#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
}

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c15 [[id(2)]];
    constant _16* vp_c8 [[id(3)]];
    constant _16* vp_c10 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
    constant _16* vp_c7 [[id(7)]];
    texture2d<float> vp_t_tcb_C [[id(8)]];
    sampler vp_t_tcb_CSmplr [[id(9)]];
    texture2d<float> vp_t_tcb_24 [[id(10)]];
    sampler vp_t_tcb_24Smplr [[id(11)]];
    texture2d_array<float> vp_t_tcb_14 [[id(12)]];
    sampler vp_t_tcb_14Smplr [[id(13)]];
    texture2d_array<float> vp_t_tcb_16 [[id(14)]];
    sampler vp_t_tcb_16Smplr [[id(15)]];
    texture3d<float> vp_t_tcb_32 [[id(16)]];
    sampler vp_t_tcb_32Smplr [[id(17)]];
    texture3d<float> vp_t_tcb_30 [[id(18)]];
    sampler vp_t_tcb_30Smplr [[id(19)]];
    texture2d<float> vp_t_tcb_1C [[id(20)]];
    sampler vp_t_tcb_1CSmplr [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    sampler vp_t_tcb_32Smplr_w [[id(24)]];
    sampler vp_t_tcb_30Smplr_w [[id(25)]];
    sampler vp_t_tcb_1CSmplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_79 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_99 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_97 [[user(locn4)]];
    float4 m_89 [[user(locn5)]];
    float4 m_101 [[user(locn6)]];
    float4 m_87 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_93 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_63 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad9 [[user(locn9)]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_67 [[attribute(2)]];
    float4 m_71 [[attribute(3)]];
    float4 m_81 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_73 [[attribute(9)]];
    float4 m_83 [[attribute(10)]];
    float4 m_75 [[attribute(12)]];
};

static inline __attribute__((always_inline))
int _116(thread const int& _8420, thread const int& _8421, constant _10& support_buffer)
{
    float _8424 = as_type<float>(support_buffer._m4);
    int _8426 = _8421 + as_type<int>(_8424);
    int _8428 = 1 + _8426;
    float _8430 = support_buffer._m5[_8428].x;
    float _8432 = abs(_8430);
    bool _8434 = _8432 == 1.0;
    if (_8434)
    {
        return _8420;
    }
    float _8436 = float(_8420);
    float _8438 = _8436 / _8432;
    int _8440 = int(_8438);
    return _8440;
}

static inline __attribute__((always_inline))
int _117(thread const int& _8470, thread const int& _8471, constant _10& support_buffer)
{
    float _8474 = as_type<float>(support_buffer._m4);
    int _8476 = _8471 + as_type<int>(_8474);
    int _8478 = 1 + _8476;
    float _8480 = support_buffer._m5[_8478].x;
    bool _8482 = _8480 == 1.0;
    if (_8482)
    {
        return _8470;
    }
    float _8484 = float(_8470);
    float _8486 = _8484 * _8480;
    int _8488 = int(_8486);
    return _8488;
}

static inline __attribute__((always_inline))
void _114(thread const int& _8104, thread const int& _8105, thread const int& _8106, thread const int& _8107, thread const int& _8108, thread int& _8109, thread int& _8110, thread int& _8111, thread int& _8112, thread int& _8113, thread int& _8114, thread int& _8115, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _8118 = _8108;
    int _8120 = _8105;
    int _8122 = _8106;
    float _8124 = 0.0 + as_type<float>(_8104);
    bool _8126 = _8124 != 0.0;
    bool _8128 = isnan(_8124);
    bool _8130 = _8126 || _8128;
    bool _8132 = isnan(0.0);
    bool _8134 = _8130 || _8132;
    int _8136 = as_type<int>(_8124);
    int _8138 = _8134 ? (-1) : 0;
    if (!_8134)
    {
        float _8140 = as_type<float>(_8104) * 1.0;
        _8118 = as_type<int>(_8140);
    }
    int _8142 = _8118;
    bool _8144 = !_8134;
    int _8146 = _8142;
    int _8148 = _8142;
    if (!_8144)
    {
        bool _8150 = _8124 >= 0.0;
        bool _8152 = isnan(_8124);
        bool _8154 = _8150 || _8152;
        bool _8156 = isnan(0.0);
        bool _8158 = _8154 || _8156;
        _8138 = _8158 ? (-1) : 0;
        if (!_8158)
        {
            _8146 = 2147483647;
        }
        int _8160 = _8146;
        bool _8162 = !_8158;
        int _8164 = _8160;
        _8148 = _8160;
        if (!_8162)
        {
            float _8166 = abs(as_type<float>(_8104));
            float _8168 = 0.0 + _8166;
            bool _8170 = _8168 > as_type<float>(0x7f800000u /* inf */);
            bool _8172 = isnan(_8168);
            bool _8174 = _8170 || _8172;
            bool _8176 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _8178 = _8174 || _8176;
            _8136 = as_type<int>(_8168);
            _8138 = _8178 ? (-1) : 0;
            if (_8178)
            {
                float _8180 = as_type<float>(_8104) + 1.0;
                _8164 = as_type<int>(_8180);
            }
            int _8182 = _8164;
            int _8184 = _8182;
            _8148 = _8182;
            if (!_8178)
            {
                bool _8186 = _8168 != as_type<float>(0x7f800000u /* inf */);
                bool _8188 = isnan(_8168);
                bool _8190 = _8186 || _8188;
                bool _8192 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _8194 = _8190 || _8192;
                _8138 = _8194 ? (-1) : 0;
                if (!_8194)
                {
                    _8184 = _8104;
                }
                int _8196 = _8184;
                bool _8198 = !_8194;
                _8148 = _8196;
                if (!_8198)
                {
                    float _8200 = as_type<float>(_8104) * 18446744073709551616.0;
                    float _8202 = rsqrt(_8200);
                    float _8204 = _8200 * _8202;
                    float _8206 = _8202 * 0.5;
                    float _8208 = -_8204;
                    float _8210 = 0.0 + _8208;
                    float _8212 = fma(_8206, _8210, 0.5);
                    float _8214 = fma(_8204, _8212, _8204);
                    float _8216 = -_8214;
                    float _8218 = 0.0 + _8216;
                    float _8220 = fma(_8214, _8218, _8200);
                    float _8222 = fma(_8206, _8220, _8214);
                    float _8224 = _8222 * 2.3283064365386962890625e-10;
                    _8136 = as_type<int>(_8222);
                    _8120 = as_type<int>(_8210);
                    _8122 = as_type<int>(_8214);
                    _8148 = as_type<int>(_8224);
                }
            }
        }
    }
    int _8226 = _8136;
    int _8228 = _8120;
    int _8230 = _8122;
    int _8232 = _8148;
    int _8234 = _8138;
    _8109 = _8107;
    _8110 = 0;
    _8111 = _8226;
    _8112 = _8228;
    _8113 = _8230;
    _8114 = _8232;
    _8115 = _8234;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad9 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2999 = false;
    bool _1813 = false;
    bool _1081 = false;
    bool _889 = false;
    bool _359 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_60.w;
    float _123 = trunc(_121);
    int _125 = int(_123);
    bool _129 = _125 >= 1;
    float _131 = 0.0;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    float _135 = _133;
    if (!_129)
    {
        out.m_63.x = 0.0;
    }
    int _137 = 0;
    if (!_129)
    {
        float _139 = _133 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3298 = as_type<float>(_141);
        out.gl_Position.z = _3298;
    }
    if (!_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_65.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _161 = 0.0;
    float _163 = _159;
    if (_155)
    {
        float _165 = float(_125);
        _161 = _165;
    }
    float _167 = _161;
    bool _169 = _159 >= _167;
    bool _171 = !_155;
    bool _173 = _169 || _171;
    if (_173)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _135;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    if (_173)
    {
        float _177 = _175 * 5.0;
        _143 = as_type<int>(_177);
    }
    int _179 = _143;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3367 = as_type<float>(_179);
        out.gl_Position.z = _3367;
    }
    if (_173)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _181 = in.m_67.x;
    float _183 = in.m_67.y;
    float _185 = in.m_67.z;
    float _187 = in.m_69.x;
    float _189 = in.m_69.y;
    float _191 = in.m_69.z;
    float _193 = in.m_71.x;
    float _195 = in.m_71.y;
    float _197 = in.m_71.z;
    float _199 = _181 * _181;
    float _201 = _183 * _183;
    float _203 = _185 * _185;
    float _205 = fma(_187, _187, _199);
    float _207 = fma(_189, _189, _201);
    float _209 = fma(_191, _191, _203);
    float _211 = fma(_193, _193, _205);
    float _213 = fma(_195, _195, _207);
    float _215 = fma(_197, _197, _209);
    float _217 = sqrt(_211);
    float _219 = sqrt(_213);
    float _221 = sqrt(_215);
    bool _223 = _217 > 0.0;
    bool _225 = _219 > 0.0;
    float _227 = _219;
    float _229 = _217;
    float _231 = _211;
    float _233 = _215;
    if (_223)
    {
        float _235 = rsqrt(_211);
        _227 = _235;
    }
    float _237 = _227;
    float _239 = 0.0;
    float _241 = 0.0;
    if (!_223)
    {
        _239 = 0.0;
        _241 = 0.0;
    }
    float _243 = _239;
    float _245 = _241;
    bool _247 = _221 > 0.0;
    float _249 = 0.0;
    float _251 = _245;
    float _253 = _243;
    if (!_223)
    {
        _249 = 0.0;
    }
    float _255 = _249;
    float _257 = 0.0;
    float _259 = _255;
    if (!_225)
    {
        _257 = 0.0;
    }
    float _261 = _257;
    float _263 = 0.0;
    float _265 = _261;
    if (_225)
    {
        float _267 = rsqrt(_213);
        _263 = _267;
    }
    float _269 = _263;
    float _271 = 0.0;
    if (!_225)
    {
        _271 = 0.0;
    }
    float _273 = _271;
    float _275 = _273;
    if (!_225)
    {
        _229 = 0.0;
    }
    float _277 = _229;
    float _279 = _277;
    if (!_247)
    {
        _231 = 0.0;
    }
    float _281 = _231;
    float _283 = _221;
    float _285 = _281;
    if (_247)
    {
        float _287 = rsqrt(_215);
        _283 = _287;
    }
    float _289 = _283;
    float _291 = _237;
    if (_223)
    {
        float _293 = _237 * _187;
        _259 = _293;
    }
    float _295 = _259;
    if (_223)
    {
        float _297 = _237 * _181;
        _251 = _297;
    }
    float _299 = _251;
    if (_223)
    {
        float _301 = _237 * _193;
        _253 = _301;
    }
    float _303 = _253;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_247)
    {
        _291 = 0.0;
    }
    float _307 = _291;
    float _309 = _307;
    if (_225)
    {
        float _311 = _269 * _189;
        _265 = _311;
    }
    float _313 = _265;
    if (!_247)
    {
        _233 = 0.0;
    }
    float _315 = _233;
    float _317 = _315;
    if (_225)
    {
        float _319 = _269 * _183;
        _275 = _319;
    }
    float _321 = _275;
    if (_225)
    {
        float _323 = _269 * _195;
        _279 = _323;
    }
    float _325 = _279;
    if (_247)
    {
        float _327 = _289 * _191;
        _317 = _327;
    }
    float _329 = _317;
    if (_247)
    {
        float _331 = _289 * _185;
        _309 = _331;
    }
    float _333 = _309;
    if (_247)
    {
        float _335 = _289 * _197;
        _285 = _335;
    }
    float _337 = _285;
    bool _339 = !_305;
    float _357;
    if (!_339)
    {
        float _341 = in.m_73.x;
        float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _345 = _341 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _349 = _347 * _343;
        float _351 = floor(_349);
        float _353 = -_351;
        float _355 = _349 + _353;
        _357 = _355;
        _359 = true;
    }
    else
    {
        float _361 = float(_125);
        float _363 = 1.0 / _361;
        float _365 = _159 * _363;
        _357 = _365;
    }
    _359 = false;
    float _367 = _357;
    int _369 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _371 = _369;
    int _373 = 0;
    int _375 = _116(_371, _373, (*spvDescriptorSet0.support_buffer));
    float _377 = in.m_73.x;
    float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _381 = in.m_73.y;
    float _383 = in.m_75.z;
    float _385 = -_379;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _389 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _377);
    float _391 = fma(_387, _381, _379);
    float _393 = _389 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _395 = trunc(_383);
    int _397 = int(_395);
    float _399 = _393 * _391;
    float _401 = float(_375);
    int _403 = abs(_375);
    bool _405 = _375 == 0;
    float _407 = _399 * _401;
    float _409 = float(uint(_403));
    float _411 = trunc(_407);
    int _413 = int(_411);
    float _415 = 1.0 / _409;
    int _417 = abs(_413);
    uint _420 = uint(int(uint(_413) >> uint(31)));
    float _422 = float(uint(_417));
    int _424 = ~int(_420);
    int _426 = _424 + 1;
    int _428 = as_type<int>(_415) + (-2);
    float _430 = as_type<float>(_428) * _422;
    float _432 = trunc(_430);
    float _434 = precise::max(_432, 0.0);
    uint _436 = uint(_434);
    int _438 = ~int(_436);
    int _440 = _438 + 1;
    int _442 = _440 * _403;
    int _444 = _442 + _417;
    float _446 = float(uint(_444));
    float _448 = as_type<float>(_428) * _446;
    float _450 = trunc(_448);
    float _452 = precise::max(_450, 0.0);
    uint _454 = uint(_452);
    int _456 = int(_436) + int(_454);
    int _458 = ~_456;
    int _460 = _458 + 1;
    int _462 = _460 * _403;
    int _464 = _462 + _417;
    bool _466 = uint(_464) >= uint(_403);
    bool _468 = !_466;
    int _470 = _468 ? 0 : (-1);
    int _472 = ~_456;
    int _474 = _472 + _470;
    int _476 = _474 + 1;
    int _478 = _476 * _403;
    int _480 = _478 + _417;
    int _482 = _480 ^ _426;
    int _484 = ~_426;
    int _486 = _484 + _482;
    int _488 = _486 + 1;
    bool _490 = !_405;
    int _492 = _490 ? _488 : (-1);
    int _494 = _492;
    int _496 = 0;
    int _498 = _117(_494, _496, (*spvDescriptorSet0.support_buffer));
    int _500 = _397;
    int _502 = 0;
    int _504 = _117(_500, _502, (*spvDescriptorSet0.support_buffer));
    float4 _507 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_498, _504)), 0).xyzw;
    float _509 = _507.x;
    float _511 = _507.y;
    float _513 = _507.z;
    float _515 = _507.w;
    float _517 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _519 = in.m_75.x;
    bool _521 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _523 = isnan(_367);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = _517 * _377;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _537 = _535 != 0;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _541 = _539 != 0;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _543;
    float _547 = trunc(_533);
    int _549 = int(_547);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _553 = _367 + _551;
    bool _555 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _557 = isnan(_367);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    bool _567 = _377 > 0.5;
    bool _569 = _567 && _537;
    bool _571 = _381 > 0.5;
    bool _573 = _571 && _541;
    float _575 = -_565;
    float _577 = _575 + 1.0;
    float _579 = 1.0 / _545;
    float _581 = _531 * _577;
    int _583 = _492 + 1;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _587 = -_531;
    float _589 = _587 + 1.0;
    int _591 = _549 << 4;
    int _593 = _591 + 1712;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _597 = _585 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _599 = uint(int(uint(_593) >> uint(2)));
    uint _601 = uint(int(uint(int(_599)) >> uint(2)));
    int _603 = int(_599) & 3;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[int(_601)][_603];
    int _607 = int(_599) + 1;
    uint _609 = uint(int(uint(_607) >> uint(2)));
    int _611 = _607 & 3;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[int(_609)][_611];
    float _615 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _617;
    float _621 = _553 * _579;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _625 = fma(_619, _621, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _627 = _593 + 8;
    uint _629 = uint(int(uint(_627) >> uint(2)));
    uint _631 = uint(int(uint(int(_629)) >> uint(2)));
    int _633 = int(_629) & 3;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[int(_631)][_633];
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _637;
    float _641 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _643;
    float _647 = _625 * _581;
    float _649 = fma(_639, _621, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _651 = fma(_645, _621, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    out.m_77.x = _597;
    out.m_77.y = _615;
    out.m_77.z = _641;
    float _653 = _649 * _581;
    float _655 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].y, _647);
    float _657 = _651 * _581;
    int _659 = abs(_583);
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _663 = _649;
    float _665 = _597;
    if (_537)
    {
        _663 = _519;
    }
    float _667 = _663;
    float _669 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[144].y, _655);
    uint _671 = uint(int(uint(_583) >> uint(31)));
    float _673 = _667;
    if (_569)
    {
        float _675 = -_667;
        float _677 = _675 + 1.0;
        _673 = _677;
    }
    float _679 = _673;
    float _681 = float(uint(_659));
    float _683 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].x, _653);
    float _685 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].z, _657);
    if (!_537)
    {
        _665 = _519;
    }
    float _687 = _665;
    float _689 = as_type<float>(_428) * _681;
    float _691 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[144].x, _683);
    float _693 = _687;
    if (_537)
    {
        _693 = _679;
    }
    float _695 = _693;
    float _697 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[144].z, _685);
    int _699 = ~int(_671);
    int _701 = _699 + 1;
    float _703 = trunc(_689);
    float _705 = precise::max(_703, 0.0);
    uint _707 = uint(_705);
    float _709 = _695 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _711 = _613 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _713 = _605 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _715 = _711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _721 = ~int(_707);
    int _723 = _721 + 1;
    float _725 = _635 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _727 = _723 * _403;
    int _729 = _727 + _659;
    float _731 = _725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _733 = float(uint(_729));
    out.m_79.x = _717;
    out.m_79.y = _715;
    out.m_79.z = _731;
    out.m_79.w = _661;
    float _735 = as_type<float>(_428) * _733;
    float _737 = trunc(_735);
    float _739 = precise::max(_737, 0.0);
    uint _741 = uint(_739);
    int _743 = int(_707) + int(_741);
    int _745 = ~_743;
    int _747 = _745 + 1;
    int _749 = _747 * _403;
    int _751 = _749 + _659;
    bool _753 = uint(_751) >= uint(_403);
    bool _755 = !_753;
    int _757 = _755 ? 0 : (-1);
    int _759 = ~_743;
    int _761 = _759 + _757;
    int _763 = _761 + 1;
    int _765 = _763 * _403;
    int _767 = _765 + _659;
    float _769 = in.m_75.y;
    int _771 = _767 ^ _701;
    int _773 = ~_701;
    int _775 = _773 + _771;
    int _777 = _775 + 1;
    bool _779 = !_405;
    int _781 = _779 ? _777 : (-1);
    float _783 = _769;
    if (_573)
    {
        float _785 = -_769;
        float _787 = _785 + 1.0;
        _783 = _787;
    }
    float _789 = _783;
    float _791 = _789 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _793 = _791 * _719;
    uint _795 = as_type<uint>(half2(float2(_515, 0.0)));
    uint _797 = extract_bits(_795, 0u, 8u);
    int _799 = int(_797) & 255;
    uint _801 = extract_bits(_795, 8u, 8u);
    int _803 = int(_801) & 255;
    int _805 = _803 << 8;
    int _807 = _799 | _805;
    bool _809 = _807 >= 32768;
    int _811 = _807 + (-1024);
    int _813 = _811;
    float _815 = _793;
    if (_809)
    {
        int _817 = ~_807;
        int _819 = _817 + 33792;
        int _821 = _819 + 1;
        _813 = _821;
    }
    int _823 = _813;
    int _825 = _823 + 30719;
    float _827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _829 = float(_825);
    float _831 = fma(_829, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _833 = abs(_831);
    float _835 = -_833;
    float _837 = _835 + 1.0;
    float _839 = abs(_831);
    float _841 = fma(_839, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _843 = as_type<int>(_837) + (-218103808);
    float _845 = abs(_831);
    float _847 = fma(_845, _841, -0.212114393711090087890625);
    float _849 = _709 * _827;
    bool _851 = _831 < 0.0;
    float _853 = float(_851);
    bool _855 = uint(_843) >= 1920991232u;
    float _857 = abs(_831);
    float _859 = fma(_857, _847, 1.570728778839111328125);
    bool _861 = !_855;
    float _887;
    if (!_861)
    {
        int _863 = as_type<int>(_837);
        int _865 = as_type<int>(_837);
        int _867 = _701;
        int _869 = 3680;
        int _871 = 0;
        int _873;
        int _875;
        int _877;
        int _879;
        int _881;
        int _883;
        int _885;
        _114(_863, _865, _867, _869, _871, _873, _875, _877, _879, _881, _883, _885, out.gl_Position, out.gl_PointSize);
        _887 = as_type<float>(_883);
        _889 = true;
    }
    else
    {
        float _891 = rsqrt(_837);
        float _893 = _837 * _891;
        float _895 = _891 * 0.5;
        float _897 = -_893;
        float _899 = 0.0 + _897;
        float _901 = fma(_895, _899, 0.5);
        float _903 = fma(_893, _901, _893);
        float _905 = -_903;
        float _907 = 0.0 + _905;
        float _909 = fma(_903, _907, _837);
        float _911 = fma(_895, _909, _903);
        _887 = _911;
    }
    _889 = false;
    float _913 = _887;
    int _915 = _781;
    int _917 = 0;
    int _919 = _117(_915, _917, (*spvDescriptorSet0.support_buffer));
    int _921 = _397;
    int _923 = 0;
    int _925 = _117(_921, _923, (*spvDescriptorSet0.support_buffer));
    float4 _927 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_919, _925)), 0).xyzw;
    float _929 = _927.x;
    float _931 = _927.y;
    float _933 = _927.z;
    float _935 = _927.w;
    float _937 = _859 * _913;
    float _939 = _853 * 2.0;
    float _941 = _829 * 3.883221149444580078125;
    float _943 = floor(_407);
    float _945 = -_939;
    float _947 = fma(_937, _945, _937);
    float _949 = _941 * 0.15915493667125701904296875;
    float _951 = fma(_853, 3.1415927410125732421875, _947);
    float _953 = _949 * 6.283185482025146484375;
    float _955 = cos(_953);
    float _957 = _951 * 0.15915493667125701904296875;
    float _959 = _957 * 6.283185482025146484375;
    float _961 = sin(_959);
    float _963 = -_943;
    float _965 = _407 + _963;
    float _967 = _961 * _955;
    float _969 = _949 * 6.283185482025146484375;
    float _971 = sin(_969);
    float _973 = _961 * _971;
    uint _975 = as_type<uint>(half2(float2(_935, 0.0)));
    float _977 = -_509;
    float _979 = _977 + _929;
    float _981 = -_513;
    float _983 = _981 + _933;
    uint _985 = extract_bits(_975, 0u, 8u);
    int _987 = int(_985) & 255;
    uint _989 = extract_bits(_975, 8u, 8u);
    int _991 = int(_989) & 255;
    int _993 = _991 << 8;
    int _995 = _987 | _993;
    float _997 = fma(_965, _979, _509);
    float _999 = fma(_965, _983, _513);
    bool _1001 = _995 >= 32768;
    int _1003 = _995 + (-1024);
    int _1005 = _1003;
    if (_1001)
    {
        int _1007 = ~_995;
        int _1009 = _1007 + 33792;
        int _1011 = _1009 + 1;
        _1005 = _1011;
    }
    int _1013 = _1005;
    int _1015 = _1013 + 30719;
    float _1017 = float(_1015);
    float _1019 = fma(_1017, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1021 = abs(_1019);
    float _1023 = -_1021;
    float _1025 = _1023 + 1.0;
    float _1027 = abs(_1019);
    float _1029 = fma(_1027, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1031 = _1019 < 0.0;
    float _1033 = float(_1031);
    int _1035 = as_type<int>(_1025) + (-218103808);
    float _1037 = abs(_1019);
    float _1039 = fma(_1037, _1029, -0.212114393711090087890625);
    bool _1041 = uint(_1035) >= 1920991232u;
    float _1043 = -_511;
    float _1045 = _1043 + _931;
    float _1047 = abs(_1019);
    float _1049 = fma(_1047, _1039, 1.570728778839111328125);
    float _1051 = fma(_965, _1045, _511);
    bool _1053 = !_1041;
    float _1079;
    if (!_1053)
    {
        int _1055 = as_type<int>(_1025);
        int _1057 = as_type<int>(_949);
        int _1059 = as_type<int>(_943);
        int _1061 = 4576;
        int _1063 = as_type<int>(_957);
        int _1065;
        int _1067;
        int _1069;
        int _1071;
        int _1073;
        int _1075;
        int _1077;
        _114(_1055, _1057, _1059, _1061, _1063, _1065, _1067, _1069, _1071, _1073, _1075, _1077, out.gl_Position, out.gl_PointSize);
        _1079 = as_type<float>(_1075);
        _1081 = true;
    }
    else
    {
        float _1083 = rsqrt(_1025);
        float _1085 = _1025 * _1083;
        float _1087 = _1083 * 0.5;
        float _1089 = -_1085;
        float _1091 = 0.0 + _1089;
        float _1093 = fma(_1087, _1091, 0.5);
        float _1095 = fma(_1085, _1093, _1085);
        float _1097 = -_1095;
        float _1099 = 0.0 + _1097;
        float _1101 = fma(_1095, _1099, _1025);
        float _1103 = fma(_1087, _1101, _1095);
        _1079 = _1103;
    }
    _1081 = false;
    float _1105 = _1079;
    float _1107 = in.m_73.x;
    float _1109 = in.m_73.y;
    float _1111 = in.m_73.z;
    float _1113 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1115 = log2(_1113);
    float _1117 = _1049 * _1105;
    float _1119 = _1017 * 3.883221149444580078125;
    float _1121 = -_831;
    float _1123 = _1121 + _1019;
    float _1125 = _1115 * _159;
    float _1127 = exp2(_1125);
    float _1129 = _1111 * 2.0;
    float _1131 = _1107 * 2.0;
    float _1133 = _1109 * 2.0;
    float _1135 = floor(_1129);
    float _1137 = floor(_1131);
    float _1139 = -_1127;
    float _1141 = _1139 + 1.0;
    float _1143 = floor(_1133);
    bool _1145 = _1135 > 0.0;
    bool _1147 = _1135 >= 0.0;
    bool _1149 = isnan(_1135);
    bool _1151 = _1147 || _1149;
    bool _1153 = isnan(0.0);
    bool _1155 = _1151 || _1153;
    int _1157 = _1155 ? 0 : 1;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1161 = _1159 != 0;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1165 = _1163 != 0;
    int _1167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1169 = _1167 != 0;
    int _1171 = ~_1157;
    int _1173 = _1171 + 1;
    int _1175 = _1173 + 1;
    bool _1177 = _1137 > 0.0;
    int _1179 = _1175;
    if (!_1145)
    {
        int _1181 = ~_1157;
        int _1183 = _1181 + 1;
        _1179 = _1183;
    }
    int _1185 = _1179;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1189 = 1.0 + _1187;
    bool _1191 = _1137 >= 0.0;
    bool _1193 = isnan(_1137);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan(0.0);
    bool _1199 = _1195 || _1197;
    bool _1201 = _1143 > 0.0;
    float _1203 = 1.0 / _1189;
    bool _1205 = _1143 >= 0.0;
    bool _1207 = isnan(_1143);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan(0.0);
    bool _1213 = _1209 || _1211;
    float _1215 = in.m_81.x;
    float _1217 = in.m_81.y;
    float _1219 = in.m_81.z;
    bool _1221 = !_1161;
    int _1223 = _1221 ? 0 : 1;
    int _1225 = _1199 ? 0 : 1;
    bool _1227 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1229 = isnan(1.0);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1235 = _1231 || _1233;
    int _1237 = abs(_1223);
    float _1239 = _1109 + _1107;
    bool _1241 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1243 = isnan(0.0);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1237);
    float _1253 = _1239 + (-1.0);
    float _1255 = float(_1185);
    float _1257 = _1249 ? _1141 : 0.0;
    float _1259 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1261 = _1213 ? 0 : 1;
    float _1263 = _1251 * _1255;
    float _1265 = _1107 + (-0.5);
    if (_1235)
    {
        float _1267 = _1257 * _1203;
        _163 = _1267;
    }
    float _1269 = _163;
    int _1271 = ~_1261;
    int _1273 = _1271 + 1;
    int _1275 = _1273 + 1;
    float _1277 = _1263 * (-2.0);
    bool _1279 = !_1169;
    int _1281 = _1279 ? 0 : 1;
    float _1283 = _1111 + _1107;
    bool _1285 = !_1165;
    int _1287 = _1285 ? 0 : 1;
    float _1289 = fma(_1277, _1215, _1215);
    int _1291 = abs(_1281);
    float _1293 = fma(_1259, _1277, _1259);
    int _1295 = _1275;
    if (!_1201)
    {
        int _1297 = ~_1261;
        int _1299 = _1297 + 1;
        _1295 = _1299;
    }
    int _1301 = _1295;
    float _1303 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1289);
    float _1305 = _1283 + (-1.0);
    int _1307 = abs(_1287);
    float _1309 = fma(_1293, _1269, _1303);
    float _1311 = float(_1291);
    float _1313 = float(_1301);
    float _1315 = _1309 * 0.15915493667125701904296875;
    int _1317 = ~_1225;
    int _1319 = _1317 + 1;
    int _1321 = _1319 + 1;
    float _1323 = _1311 * _1313;
    int _1325 = _1321;
    if (!_1177)
    {
        int _1327 = ~_1225;
        int _1329 = _1327 + 1;
        _1325 = _1329;
    }
    int _1331 = _1325;
    float _1333 = fma(_1305, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1335 = float(_1307);
    float _1337 = _1323 * (-2.0);
    float _1339 = float(_1331);
    float _1341 = _1111 + (-0.5);
    float _1343 = _1111 + _1109;
    float _1345 = fma(_1337, _1219, _1219);
    float _1347 = fma(_1333, _1337, _1333);
    float _1349 = _1335 * _1339;
    float _1351 = _1343 + (-1.0);
    float _1353 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1345);
    float _1355 = in.m_60.x;
    float _1357 = in.m_60.y;
    float _1359 = in.m_60.z;
    float _1361 = _1349 * (-2.0);
    float _1363 = _1109 + (-0.5);
    float _1365 = fma(_1347, _1269, _1353);
    float _1367 = in.m_69.x;
    float _1369 = in.m_69.y;
    float _1371 = in.m_69.z;
    float _1373 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1375 = _1315 * 6.283185482025146484375;
    float _1377 = sin(_1375);
    float _1379 = _1365 * 0.15915493667125701904296875;
    float _1381 = in.m_83.x;
    float _1383 = in.m_83.y;
    float _1385 = in.m_83.z;
    float _1387 = fma(_1361, _1217, _1217);
    float _1389 = fma(_1373, _1361, _1373);
    float _1391 = _1033 * 2.0;
    float _1393 = in.m_71.x;
    float _1395 = in.m_71.y;
    float _1397 = in.m_71.z;
    float _1399 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1387);
    float _1401 = _1315 * 6.283185482025146484375;
    float _1403 = cos(_1401);
    float _1405 = -_1391;
    float _1407 = fma(_1117, _1405, _1117);
    bool _1409 = _1051 != 0.0;
    bool _1411 = isnan(_1051);
    bool _1413 = _1409 || _1411;
    bool _1415 = isnan(0.0);
    bool _1417 = _1413 || _1415;
    float _1419 = fma(_1389, _1269, _1399);
    float _1421 = fma(_1033, 3.1415927410125732421875, _1407);
    bool _1423 = _997 == 0.0;
    bool _1425 = !_1417;
    bool _1427 = _1423 && _1425;
    float _1429 = _1419 * 0.15915493667125701904296875;
    float _1431 = _1379 * 6.283185482025146484375;
    float _1433 = sin(_1431);
    float _1435 = _1421 * 0.15915493667125701904296875;
    bool _1437 = _999 == 0.0;
    bool _1439 = _1437 && _1427;
    float _1441 = _1369 * _1357;
    float _1443 = _1429 * 6.283185482025146484375;
    float _1445 = cos(_1443);
    float _1447 = _669 * _1383;
    float _1449 = _697 * _1385;
    float _1451 = fma(_1367, _1355, _1441);
    float _1453 = _691 * _1381;
    float _1455 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1051);
    float _1457 = _1447 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1459 = _1379 * 6.283185482025146484375;
    float _1461 = cos(_1459);
    float _1463 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _999);
    float _1465 = _1449 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1467 = _1395 * _1357;
    float _1469 = fma(_1371, _1359, _1451);
    float _1471 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _997);
    float _1473 = _1453 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1475 = _1457 * _1455;
    float _1477 = _1429 * 6.283185482025146484375;
    float _1479 = sin(_1477);
    float _1481 = _1465 * _1463;
    float _1483 = fma(_1393, _1355, _1467);
    float _1485 = _1403 * _1433;
    float _1487 = _1377 * _1433;
    float _1489 = _1445 * _1433;
    float _1491 = _1473 * _1471;
    float _1493 = fma(_1397, _1359, _1483);
    float _1495 = _1403 * _1461;
    float _1497 = _1377 * _1461;
    float _1499 = _1377 * _1445;
    float _1501 = _1445 * _1461;
    float _1503 = _1403 * _1445;
    float _1505 = _1469 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1507 = _1435 * 6.283185482025146484375;
    float _1509 = sin(_1507);
    float _1511 = fma(_1479, _1487, _1495);
    float _1513 = -_1485;
    float _1515 = fma(_1479, _1497, _1513);
    float _1517 = -_1497;
    float _1519 = fma(_1479, _1485, _1517);
    float _1521 = _1499 * _1475;
    float _1523 = _1511 * _1475;
    float _1525 = _1515 * _1475;
    float _1527 = fma(_1479, _1495, _1487);
    float _1529 = -_1479;
    float _1531 = fma(_1529, _1491, _1521);
    float _1533 = fma(_1489, _1491, _1523);
    float _1535 = fma(_1501, _1491, _1525);
    float _1537 = fma(_1503, _1481, _1531);
    float _1539 = fma(_1519, _1481, _1533);
    float _1541 = fma(_1527, _1481, _1535);
    float _1543 = _1119 * 0.15915493667125701904296875;
    float _1545 = in.m_67.x;
    float _1547 = in.m_67.y;
    float _1549 = in.m_67.z;
    float _1551 = _1539 * _313;
    float _1553 = _1539 * _325;
    float _1555 = _1543 * 6.283185482025146484375;
    float _1557 = cos(_1555);
    float _1559 = _1539 * _321;
    float _1561 = fma(_1541, _295, _1551);
    float _1563 = fma(_1541, _303, _1553);
    float _1565 = _1493 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1567 = fma(_1541, _299, _1559);
    float _1569 = fma(_1537, _329, _1561);
    float _1571 = fma(_1537, _337, _1563);
    float _1573 = _1543 * 6.283185482025146484375;
    float _1575 = sin(_1573);
    float _1577 = fma(_1537, _333, _1567);
    float _1579 = _1505 + _1569;
    float _1581 = _1565 + _1571;
    float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1585 = _1579 + _1583;
    float _1587 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1589 = _1581 + _1587;
    float _1591 = -_967;
    float _1593 = fma(_1509, _1557, _1591);
    float _1595 = _1585 * _1585;
    float _1597 = _1589 * _1589;
    float _1599 = _1547 * _1357;
    float _1601 = _1595 + _1597;
    float _1603 = -_973;
    float _1605 = fma(_1509, _1575, _1603);
    float _1607 = fma(_1545, _1355, _1599);
    float _1609 = fma(_965, _1123, _831);
    float _1611 = sqrt(_1601);
    float _1613 = fma(_965, _1593, _967);
    float _1615 = fma(_1549, _1359, _1607);
    float _1617 = _1609;
    float _1619 = _1613;
    float _1621 = _1595;
    float _1623 = _1597;
    float _1625 = _1579;
    float _1627 = _1581;
    int _1629 = as_type<int>(_1475);
    int _1631 = as_type<int>(_1559);
    float _1633 = _1565;
    if (!_1439)
    {
        float _1635 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1609);
        _1617 = _1635;
    }
    float _1637 = _1617;
    float _1639 = fma(_965, _1605, _973);
    float _1641 = _1639;
    float _1643 = _1637;
    if (!_1439)
    {
        float _1645 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1613);
        _1619 = _1645;
    }
    float _1647 = _1619;
    float _1649 = _1615 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1651 = _1499 * _1637;
    float _1653 = _1515 * _1637;
    float _1655 = _1511 * _1637;
    float _1657 = _1649 + _1577;
    if (!_1439)
    {
        float _1659 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1639);
        _1641 = _1659;
    }
    float _1661 = _1641;
    bool _1663 = _1611 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1663)
    {
        _1643 = _1657;
    }
    float _1665 = _1643;
    bool _1667 = !_1663;
    float _1669 = _1665;
    if (!_1667)
    {
        float _1671 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1675 = _1611 + _1673;
        float _1677 = rsqrt(_1601);
        float _1679 = _1675 * _1671;
        float _1681 = _1657 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1683 = _1679 * 0.15915493667125701904296875;
        float _1685 = _1683 * 6.283185482025146484375;
        float _1687 = sin(_1685);
        float _1689 = _1683 * 6.283185482025146484375;
        float _1691 = cos(_1689);
        float _1693 = fma(_1687, _1681, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1695 = _1677 * _1693;
        float _1697 = _1691 + (-1.0);
        float _1699 = _1585 * _1695;
        float _1701 = _1589 * _1695;
        float _1703 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1705 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1707 = _1699 * _1699;
        float _1709 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1711 = fma(_1657, _1691, _1703);
        float _1713 = _1701 * _1701;
        _1669 = _1711;
        _1621 = _1707;
        _1623 = _1713;
        _1625 = _1705;
        _1627 = _1709;
    }
    float _1715 = _1669;
    float _1717 = _1621;
    float _1719 = _1623;
    float _1721 = _1625;
    float _1723 = _1627;
    float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1727 = _1715 + _1725;
    float _1729 = fma(_1489, _1647, _1655);
    float _1731 = fma(_1501, _1647, _1653);
    float _1733 = -_1479;
    float _1735 = fma(_1733, _1647, _1651);
    float _1737 = fma(_1727, _1727, _1717);
    float _1739 = fma(_1519, _1661, _1729);
    float _1741 = fma(_1527, _1661, _1731);
    float _1743 = fma(_1503, _1661, _1735);
    float _1745 = _1737 + _1719;
    float _1747 = _1739 * _313;
    float _1749 = _1739 * _321;
    float _1751 = _1739 * _325;
    out.m_85.x = _849;
    out.m_85.y = _793;
    float _1753 = fma(_1741, _295, _1747);
    float _1755 = sqrt(_1745);
    float _1757 = fma(_1741, _299, _1749);
    float _1759 = fma(_1741, _303, _1751);
    float _1761 = fma(_1743, _329, _1753);
    float _1763 = fma(_1743, _333, _1757);
    float _1765 = fma(_1743, _337, _1759);
    out.m_87.x = _1761;
    out.m_87.y = _1763;
    out.m_87.z = _1765;
    bool _1767 = _1755 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1769 = isnan(_1755);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1775 = _1771 || _1773;
    float _1777 = _1757;
    if (!_1775)
    {
        _1777 = 1.0;
    }
    float _1779 = _1777;
    bool _1781 = !_1775;
    float _1783 = _1779;
    if (!_1781)
    {
        bool _1785 = _1755 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1787 = isnan(_1755);
        bool _1789 = _1785 || _1787;
        bool _1791 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1793 = _1789 || _1791;
        if (!_1793)
        {
            float _1795 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1797 = _1755 + _1795;
            float _1799 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1801 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1799;
            float _1803 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1805 = _1803 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1807 = 1.0 / _1801;
            float _1809 = _1797 * _1807;
            float _1811 = fma(_1809, _1805, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1783 = _1811;
            _1813 = true;
        }
        else
        {
            bool _1815 = _1755 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1817 = isnan(_1755);
            bool _1819 = _1815 || _1817;
            bool _1821 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1823 = _1819 || _1821;
            if (!_1823)
            {
                float _1825 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1827 = _1755 + _1825;
                float _1829 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1831 = _1829 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1833 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1835 = _1833 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1837 = 1.0 / _1831;
                float _1839 = _1827 * _1837;
                float _1841 = fma(_1839, _1835, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1783 = _1841;
                _1813 = true;
            }
            else
            {
                _1783 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1813 = false;
    float _1843 = _1783;
    float _1845 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1847 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1849 = _1715 + _1847;
    float _1851 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1853 = _1721 + _1851;
    float _1855 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1857 = _1723 + _1855;
    float _1859 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1845);
    float _1861 = fma(_1849, _1843, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1863 = fma(_1853, _1843, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1865 = fma(_1857, _1843, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1867 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1859);
    float _1869 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1871 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1873 = _1861 + _1871;
    float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1877 = _1863 + _1875;
    float _1879 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1881 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1869);
    float _1883 = _1873 * _1873;
    float _1885 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1887 = _1865 + _1885;
    float _1889 = 1.0 / _1879;
    float _1891 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1881);
    float _1893 = fma(_1877, _1877, _1883);
    float _1895 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1897 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1899 = fma(_1887, _1887, _1893);
    float _1901 = _1649 + _1895;
    float _1903 = _1897 + _1879;
    float _1905 = rsqrt(_1899);
    float _1907 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1909 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1911 = _1903 * _1889;
    float _1913 = _1911 * 0.5;
    float _1915 = fma(_1505, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1907);
    float _1917 = sqrt(_1899);
    float _1919 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1909);
    float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1923 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1921);
    float _1925 = fma(_1565, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1915);
    float _1927 = fma(_1565, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1929 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1919);
    float _1931 = _1925 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1933 = 1.0 / _1923;
    float _1935 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1937 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1939 = _1877 * _1935;
    float _1941 = _1887 * _1935;
    float _1943 = trunc(_1931);
    int _1945 = int(_1943);
    float _1947 = _1939 * _1939;
    float _1949 = _1941 * _1941;
    float _1951 = _1947 + _1949;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1955 = _1933 * _1953;
    float _1957 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1959 = sqrt(_1951);
    bool _1961 = _1955 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1963 = fma(_1505, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1957);
    bool _1965 = _1955 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1967 = fma(_1565, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1963);
    float _1969 = floor(_1927);
    float _1971 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1973 = !_1961;
    int _1975 = _1973 ? 0 : 1;
    int _1977 = 2;
    int _1979 = as_type<int>(_1873);
    float _1981 = _1939;
    float _1983 = _1941;
    float _1985 = _1947;
    float _1987 = _1949;
    float _1989 = _1955;
    if (!_1961)
    {
        _1977 = 1;
    }
    int _1991 = _1977;
    float _1993 = trunc(_1971);
    int _1995 = int(_1993);
    int _1997 = _1991;
    if (!_1965)
    {
        _1997 = _1975;
    }
    int _1999 = _1997;
    bool _2001 = _1959 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2005 = _1959 + _2003;
    int _2007 = _1999 << 6;
    float _2009 = -_1969;
    float _2011 = _1927 + _2009;
    int _2013 = _2007 + 96;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    uint _2017 = uint(int(uint(int(_2015)) >> uint(2)));
    int _2019 = int(_2015) & 3;
    float _2021 = (*spvDescriptorSet0.vp_c15)._m0[int(_2017)][_2019];
    int _2023 = int(_2015) + 1;
    uint _2025 = uint(int(uint(_2023) >> uint(2)));
    int _2027 = _2023 & 3;
    float _2029 = (*spvDescriptorSet0.vp_c15)._m0[int(_2025)][_2027];
    float _2031 = _1729;
    float _2033 = _2005;
    if (_2001)
    {
        float _2035 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2031 = _2035;
    }
    float _2037 = _2031;
    int _2039 = _2007 + 104;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    uint _2043 = uint(int(uint(int(_2041)) >> uint(2)));
    int _2045 = int(_2041) & 3;
    float _2047 = (*spvDescriptorSet0.vp_c15)._m0[int(_2043)][_2045];
    int _2049 = int(_2041) + 1;
    uint _2051 = uint(int(uint(_2049) >> uint(2)));
    int _2053 = _2049 & 3;
    float _2055 = (*spvDescriptorSet0.vp_c15)._m0[int(_2051)][_2053];
    if (_2001)
    {
        float _2057 = _2005 * _2037;
        _2033 = _2057;
    }
    float _2059 = _2033;
    int _2061 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2063 = _1945 + _2061;
    int _2065 = _2063 + 1;
    float _2067 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2001)
    {
        float _2069 = _2059 * 0.15915493667125701904296875;
        _815 = _2069;
    }
    float _2071 = _815;
    int _2073 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2075 = _1995 + _2073;
    int _2077 = _2075 + 1;
    float _2079 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2067);
    float _2081 = _313;
    if (_2001)
    {
        float _2083 = _2071 * 6.283185482025146484375;
        float _2085 = cos(_2083);
        _2081 = _2085;
    }
    float _2087 = _2081;
    bool _2089 = _2077 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2091 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2079);
    int _2093 = _2077 | _2065;
    float _2095 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2097 = _2093 < 0;
    bool _2099 = _2097 || _2089;
    float _2101 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2103 = _849;
    if (_2001)
    {
        float _2105 = _2071 * 6.283185482025146484375;
        float _2107 = sin(_2105);
        _2103 = _2107;
    }
    float _2109 = _2103;
    float _2111 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2113 = _2065 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2115 = _2113 || _2099;
    float _2117 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2119 = precise::max(0.0, _2101);
    float _2121 = -_2117;
    float _2123 = fma(_2121, _2111, 1.0);
    float _2125 = _2091;
    if (_2001)
    {
        float _2127 = rsqrt(_1951);
        _2125 = _2127;
    }
    float _2129 = _2125;
    float _2131 = -_1935;
    float _2133 = -_2119;
    float _2135 = fma(_1873, _2131, _2133);
    float _2137 = _1901 * _2029;
    float _2139 = _2029;
    float _2141 = _2137;
    float _2143 = _2135;
    if (_2001)
    {
        float _2145 = _2135 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2139 = _2145;
    }
    float _2147 = _2139;
    float _2149 = fma(_1505, _2021, _2137);
    if (!_2115)
    {
        int _2151 = _2065 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2153 = _2151 + _2077;
        _1979 = _2153;
    }
    int _2155 = _1979;
    if (_2001)
    {
        float _2157 = _2087 + (-1.0);
        _2141 = _2157;
    }
    float _2159 = _2141;
    int _2161 = _2007 + 48;
    uint _2163 = uint(int(uint(_2161) >> uint(2)));
    uint _2165 = uint(int(uint(int(_2163)) >> uint(2)));
    int _2167 = int(_2163) & 3;
    float _2169 = (*spvDescriptorSet0.vp_c15)._m0[int(_2165)][_2167];
    int _2171 = int(_2163) + 1;
    uint _2173 = uint(int(uint(_2171) >> uint(2)));
    int _2175 = _2171 & 3;
    float _2177 = (*spvDescriptorSet0.vp_c15)._m0[int(_2173)][_2175];
    float _2179 = _2109;
    float _2181 = _2159;
    if (_2001)
    {
        float _2183 = fma(_2109, _2147, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2179 = _2183;
    }
    float _2185 = _2179;
    float _2187 = fma(_1565, _2047, _2149);
    if (_2001)
    {
        float _2189 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2181 = _2189;
    }
    float _2191 = _2181;
    float _2193 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (!_2115)
    {
        int _2195 = _2155 << 2;
        _1629 = _2195;
    }
    int _2197 = _1629;
    float _2199 = _2129;
    int _2201 = _2197;
    if (_2001)
    {
        float _2203 = _2129 * _2185;
        _2199 = _2203;
    }
    float _2205 = _2199;
    if (_2001)
    {
        float _2207 = fma(_2135, _2087, _2191);
        _2143 = _2207;
    }
    float _2209 = _2143;
    int _2211 = _2007 + 56;
    uint _2213 = uint(int(uint(_2211) >> uint(2)));
    uint _2215 = uint(int(uint(int(_2213)) >> uint(2)));
    int _2217 = int(_2213) & 3;
    float _2219 = (*spvDescriptorSet0.vp_c15)._m0[int(_2215)][_2217];
    int _2221 = int(_2213) + 1;
    uint _2223 = uint(int(uint(_2221) >> uint(2)));
    int _2225 = _2221 & 3;
    float _2227 = (*spvDescriptorSet0.vp_c15)._m0[int(_2223)][_2225];
    float _2229 = fma(_1505, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_2001)
    {
        float _2231 = _1939 * _2205;
        _1981 = _2231;
    }
    float _2233 = _1981;
    if (_2001)
    {
        float _2235 = _1941 * _2205;
        _1983 = _2235;
    }
    float _2237 = _1983;
    float _2239 = _2187 + _2055;
    if (!_2115)
    {
        uint _2241 = uint(int(uint(_2155) >> uint(2)));
        _1631 = int(_2241);
    }
    int _2243 = _1631;
    if (_2001)
    {
        float _2245 = _2233 * _2233;
        _1985 = _2245;
    }
    float _2247 = _1985;
    if (_2001)
    {
        float _2249 = _2237 * _2237;
        _1987 = _2249;
    }
    float _2251 = _1987;
    int _2253 = _2007 + 64;
    uint _2255 = uint(int(uint(_2253) >> uint(2)));
    uint _2257 = uint(int(uint(int(_2255)) >> uint(2)));
    int _2259 = int(_2255) & 3;
    float _2261 = (*spvDescriptorSet0.vp_c15)._m0[int(_2257)][_2259];
    int _2263 = int(_2255) + 1;
    uint _2265 = uint(int(uint(_2263) >> uint(2)));
    int _2267 = _2263 & 3;
    float _2269 = (*spvDescriptorSet0.vp_c15)._m0[int(_2265)][_2267];
    if (!_2115)
    {
        int _2271 = 12 & _2197;
        _2201 = _2271;
    }
    int _2273 = _2201;
    float _2275 = fma(_2209, _2209, _2247);
    float _2277 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2279 = 1.0 / _2239;
    int _2281 = _2273;
    if (!_2115)
    {
        int _2283 = _2243 << 4;
        int _2285 = _2283 + _2273;
        _2281 = _2285;
    }
    int _2287 = _2281;
    float _2289 = _2275 + _2251;
    float _2291 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2277);
    int _2293 = _2007 + 72;
    uint _2295 = uint(int(uint(_2293) >> uint(2)));
    uint _2297 = uint(int(uint(int(_2295)) >> uint(2)));
    int _2299 = int(_2295) & 3;
    float _2301 = (*spvDescriptorSet0.vp_c15)._m0[int(_2297)][_2299];
    int _2303 = int(_2295) + 1;
    uint _2305 = uint(int(uint(_2303) >> uint(2)));
    int _2307 = _2303 & 3;
    float _2309 = (*spvDescriptorSet0.vp_c15)._m0[int(_2305)][_2307];
    float _2311 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2193);
    float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2315 = fma(_1917, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2313);
    float _2317 = precise::clamp(_2315, 0.0, 1.0);
    float _2319 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2291);
    float _2321 = rsqrt(_2289);
    float _2323 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2311);
    float _2325 = -_2317;
    float _2327 = _2325 + 1.0;
    float _2329 = _2319 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _2331 = _2007 + 80;
    uint _2333 = uint(int(uint(_2331) >> uint(2)));
    uint _2335 = uint(int(uint(int(_2333)) >> uint(2)));
    int _2337 = int(_2333) & 3;
    float _2339 = (*spvDescriptorSet0.vp_c15)._m0[int(_2335)][_2337];
    int _2341 = int(_2333) + 1;
    uint _2343 = uint(int(uint(_2341) >> uint(2)));
    int _2345 = _2341 & 3;
    float _2347 = (*spvDescriptorSet0.vp_c15)._m0[int(_2343)][_2345];
    float _2349 = _2323 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2351 = _2329 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2353 = abs(_2327);
    float _2355 = log2(_2353);
    float _2357 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2351);
    int _2359 = _2007 + 88;
    uint _2361 = uint(int(uint(_2359) >> uint(2)));
    uint _2363 = uint(int(uint(int(_2361)) >> uint(2)));
    int _2365 = int(_2361) & 3;
    float _2367 = (*spvDescriptorSet0.vp_c15)._m0[int(_2363)][_2365];
    int _2369 = int(_2361) + 1;
    uint _2371 = uint(int(uint(_2369) >> uint(2)));
    int _2373 = _2369 & 3;
    float _2375 = (*spvDescriptorSet0.vp_c15)._m0[int(_2371)][_2373];
    float _2377 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2357);
    float _2379 = _2321 * _2233;
    float _2381 = floor(_2229);
    float _2383 = _2321 * _2209;
    float _2385 = _1901 * _2177;
    float _2387 = _2357;
    if (!_2115)
    {
        int _2389 = _2287 + 400;
        uint _2391 = uint(int(uint(_2389) >> uint(2)));
        uint _2393 = uint(int(uint(int(_2391)) >> uint(2)));
        int _2395 = int(_2391) & 3;
        float _2397 = (*spvDescriptorSet0.vp_c15)._m0[int(_2393)][_2395];
        _2387 = _2397;
    }
    float _2399 = _2387;
    float _2401 = _2379 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2403 = _2321 * _2237;
    float _2405 = fma(_1505, _2169, _2385);
    float _2407 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2377);
    float _2409 = log2(_2123);
    float _2411 = fma(_1565, _2219, _2405);
    float _2413 = _2411 + _2227;
    float _2415 = -_2401;
    float _2417 = fma(_2383, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2415);
    float _2419 = -_2381;
    float _2421 = _2229 + _2419;
    float _2423 = _1901 * _2269;
    float _2425 = _2413 * _2279;
    float _2427 = -_2403;
    float _2429 = fma(_2427, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2417);
    float _2431 = 1.0 / _2407;
    float _2433 = fma(_1505, _2261, _2423);
    float _2435 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2437 = _2425 >= 0.0;
    float _2439 = _2409 * 0.693147182464599609375;
    float _2441 = fma(_1565, _2301, _2433);
    float _2443 = fma(_2429, -0.5, 0.5);
    bool _2445 = _2425 <= 1.0;
    bool _2447 = _2445 && _2437;
    float _2449 = exp2(_2435);
    float _2451 = _2441 + _2309;
    float _2453 = _2451 * _2279;
    float _2455 = _1901 * _2347;
    float _2457 = _2329 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2459 = sqrt(_2443);
    bool _2461 = _2453 >= 0.0;
    bool _2463 = _2461 && _2447;
    float _2465 = fma(_1505, _2339, _2455);
    float _2467 = fma(_2429, 0.5, 0.5);
    float _2469 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2457);
    bool _2471 = _2453 <= 1.0;
    bool _2473 = _2471 && _2463;
    float _2475 = fma(_1565, _2367, _2465);
    float _2477 = fma(_2467, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2479 = _2403;
    float _2481 = _2467;
    if (!_2115)
    {
        float _2483 = floor(_1931);
        _2479 = _2483;
    }
    float _2485 = _2479;
    float _2487 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2469);
    float _2489 = _2475 + _2375;
    float _2491 = fma(_2467, _2477, -0.212114393711090087890625);
    float _2493 = _2329 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2495 = _2383 + 1.0;
    float _2497 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2487);
    float _2499 = fma(_2467, _2491, 1.570728778839111328125);
    float _2501 = _2429;
    float _2503 = _2495;
    float _2505 = _2497;
    if (!_2115)
    {
        float _2507 = floor(_1971);
        _2501 = _2507;
    }
    float _2509 = _2501;
    float _2511 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2493);
    if (_2473)
    {
        float _2513 = float(_1999);
        _2481 = _2513;
    }
    float _2515 = _2481;
    float _2517 = _2459 * 0.636619746685028076171875;
    float _2519 = -_2383;
    float _2521 = fma(_2449, _2495, _2519);
    float _2523 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2511);
    float _2525 = _2497 * _2431;
    float _2527 = -_2499;
    float _2529 = fma(_2517, _2527, 1.0);
    float _2531 = _2475;
    if (!_2115)
    {
        float _2533 = rint(_2399);
        float _2535 = precise::max(_2533, 0.0);
        uint _2537 = uint(_2535);
        uint _2539 = clamp(_2537, 0u, 65535u);
        _2531 = as_type<float>(_2539);
    }
    float _2541 = _2531;
    float _2543 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2523);
    float _2545 = _2485;
    if (!_2115)
    {
        float _2547 = -_2485;
        float _2549 = _1931 + _2547;
        _2545 = _2549;
    }
    float _2551 = _2545;
    float _2553 = _2489 * _2279;
    float _2555 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2557 = _2543 * _2431;
    float _2559 = fma(_2525, 0.5, 0.5);
    float _2561 = fma(_2521, 0.5, 0.5);
    float _2563 = _2515;
    if (_2473)
    {
        float _2565 = rint(_2515);
        float _2567 = precise::max(_2565, 0.0);
        uint _2569 = uint(_2567);
        uint _2571 = clamp(_2569, 0u, 65535u);
        _2563 = as_type<float>(_2571);
    }
    float _2573 = _2563;
    if (!_2115)
    {
        float _2575 = -_2509;
        float _2577 = _1971 + _2575;
        _2503 = _2577;
    }
    float _2579 = _2503;
    float _2581 = fma(_2557, -0.5, 0.5);
    float2 _6944 = float2(_2421, _2011);
    float _2583 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6944, float2(0.0), isnan(_6944)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6944, float2(0.0), isnan(_6944)), level(0.0)).x;
    float _2585 = _2541;
    if (!_2115)
    {
        float3 _6961 = float3(_2579, _2551, float(as_type<int>(_2541)));
        float3 _6965 = select(_6961, float3(0.0), isnan(_6961));
        float _2587 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6965.xy, uint(rint(_6965.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6965.xy, uint(rint(_6965.z)), level(0.0)).x;
        _2585 = _2587;
    }
    float _2589 = _2585;
    float _2591 = _2573;
    if (_2473)
    {
        float3 _6980 = float3(_2425, _2453, float(as_type<int>(_2573)));
        float3 _6982 = select(_6980, float3(0.0), isnan(_6980));
        float _2593 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6982.xy, uint(rint(_6982.z)), _2553, level(0.0));
        _2591 = _2593;
    }
    float _2595 = _2591;
    float3 _6992 = float3(_2559, _2581, _2555);
    float _2597 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6992, float3(0.0), isnan(_6992)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6992, float3(0.0), isnan(_6992)), level(0.0)).x;
    float3 _7001 = float3(_2559, _2581, _2555);
    float4 _2599 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7001, float3(0.0), isnan(_7001)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7001, float3(0.0), isnan(_7001)), level(0.0)).xyzw;
    float _2601 = _2599.x;
    float _2603 = _2599.y;
    float _2605 = _2599.z;
    float _2607 = _2599.w;
    float2 _7017 = float2(_2529, _2561);
    float3 _2611 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7017, float2(0.0), isnan(_7017)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7017, float2(0.0), isnan(_7017)), level(0.0)).xyz;
    float _2613 = _2611.x;
    float _2615 = _2611.y;
    float _2617 = _2611.z;
    float _2619 = abs(_1955);
    float _2621 = log2(_2619);
    float _2623 = _2329 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_89.x = _1505;
    float _2625 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2627 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2623);
    out.m_89.z = _1565;
    float _2629 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2627);
    float _2631 = exp2(_2625);
    float _2633 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2629);
    float _2635 = _2621 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2637 = _2633 + _2407;
    out.gl_Position.x = _2497;
    out.gl_Position.y = _2543;
    out.gl_Position.z = _2633;
    out.gl_Position.w = _2407;
    float _2639 = exp2(_2635);
    float _2641 = _2637 * 0.5;
    bool _2643 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2645 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2647 = _2643 || _2645;
    bool _2649 = isnan(0.5);
    bool _2651 = _2647 || _2649;
    out.m_91.z = _2641;
    out.m_91.w = _2407;
    float _2653 = fma(_2639, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2655 = precise::clamp(_2653, 0.0, 1.0);
    float _2657 = fma(_2655, -2.0, 3.0);
    float _2659 = _2655 * _2655;
    float _2661 = _2659 * _2657;
    bool _2663 = _1955 <= 8000.0;
    bool _2665 = isnan(_1955);
    bool _2667 = _2663 || _2665;
    bool _2669 = isnan(8000.0);
    bool _2671 = _2667 || _2669;
    float _2673 = float(_2671);
    float _2675 = -_2661;
    float _2677 = _2675 + 1.0;
    float _2679 = fma(_2677, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2661);
    float _2681 = _2673 * _2679;
    float _2683 = _2673;
    if (_2651)
    {
        _2683 = 1.0;
    }
    float _2685 = _2683;
    float _2687 = _2685;
    float _2689 = _2589;
    if (!_2651)
    {
        float _2691 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2693 = _2691 * 0.15915493667125701904296875;
        float _2695 = _2693 * 6.283185482025146484375;
        float _2697 = cos(_2695);
        float _2699 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2701 = _2699 * 0.15915493667125701904296875;
        float _2703 = _2693 * 6.283185482025146484375;
        float _2705 = sin(_2703);
        float _2707 = 1.0 / _2697;
        float _2709 = _2701 * 6.283185482025146484375;
        float _2711 = cos(_2709);
        float _2713 = _2705 * _2707;
        float _2715 = _2701 * 6.283185482025146484375;
        float _2717 = sin(_2715);
        float _2719 = _2711 * _2713;
        float _2721 = 1.0 / _2719;
        float _2723 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2725 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2723;
        float _2727 = 1.0 / _2725;
        float _2729 = _2717 * _2721;
        float _2731 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2733 = fma(_1955, _2729, _2731);
        float _2735 = _2733 * _2727;
        float _2737 = precise::clamp(_2735, 0.0, 1.0);
        _2505 = _2721;
        _2687 = _2737;
    }
    float _2739 = _2505;
    float _2741 = _2687;
    float _2743 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2745 = -_2583;
    float _2747 = _2745 + 1.0;
    float _2749 = -_2631;
    float _2751 = _2749 + 1.0;
    float _2753 = _2739;
    if (!_2473)
    {
        _2753 = 1.0;
    }
    float _2755 = _2753;
    float _2757 = _2747 * _2743;
    float _2759 = precise::clamp(_2757, 0.0, 1.0);
    float _2761 = _2755;
    if (_2473)
    {
        bool _2763 = _2595 >= _2553;
        bool _2765 = isnan(_2595);
        bool _2767 = _2763 || _2765;
        bool _2769 = isnan(_2553);
        bool _2771 = _2767 || _2769;
        float _2773 = float(_2771);
        _2761 = _2773;
    }
    float _2775 = _2761;
    float _2777 = _2751 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2779 = _2775;
    if (_2115)
    {
        _1989 = 1.0;
    }
    float _2781 = _1989;
    float _2783 = _2781;
    if (!_2115)
    {
        int _2785 = _2155 << 4;
        int _2787 = _2785 + 2048;
        uint _2789 = uint(int(uint(_2787) >> uint(2)));
        uint _2791 = uint(int(uint(int(_2789)) >> uint(2)));
        int _2793 = int(_2789) & 3;
        float _2795 = (*spvDescriptorSet0.vp_c15)._m0[int(_2791)][_2793];
        int _2797 = int(_2789) + 1;
        uint _2799 = uint(int(uint(_2797) >> uint(2)));
        int _2801 = _2797 & 3;
        float _2803 = (*spvDescriptorSet0.vp_c15)._m0[int(_2799)][_2801];
        int _2805 = _2787 + 8;
        uint _2807 = uint(int(uint(_2805) >> uint(2)));
        uint _2809 = uint(int(uint(int(_2807)) >> uint(2)));
        int _2811 = int(_2807) & 3;
        float _2813 = (*spvDescriptorSet0.vp_c15)._m0[int(_2809)][_2811];
        int _2815 = int(_2807) + 1;
        uint _2817 = uint(int(uint(_2815) >> uint(2)));
        int _2819 = _2815 & 3;
        float _2821 = (*spvDescriptorSet0.vp_c15)._m0[int(_2817)][_2819];
        float _2823 = _1901 * _2803;
        float _2825 = fma(_1505, _2795, _2823);
        float _2827 = fma(_1565, _2813, _2825);
        float _2829 = _2827 + _2821;
        float _2831 = precise::clamp(_2829, 0.0, 1.0);
        float _2833 = -_2831;
        float _2835 = _2833 + _2589;
        float _2837 = fma(_2835, 500.0, 1.5);
        float _2839 = exp2(_2837);
        float _2841 = 0.0 + _2839;
        float _2843 = precise::clamp(_2841, 0.0, 1.0);
        _2783 = _2843;
        _1633 = _2839;
    }
    float _2845 = _2783;
    float _2847 = _1633;
    float _2849 = _2775 * _2845;
    float _2851 = _2777 * _2597;
    float _2853 = -_2759;
    float _2855 = fma(_2853, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2857 = -_2777;
    float _2859 = _2857 + 1.0;
    out.m_93.x = _1863;
    out.m_93.y = _1861;
    out.m_93.z = _1865;
    float _2861 = _2607 * _2851;
    float _2863 = -_2849;
    float _2865 = fma(_2863, _2855, 1.0);
    float _2867 = precise::clamp(_2865, 0.0, 1.0);
    float _2869 = _2617 * _2851;
    float _2871 = _2607 * _2859;
    float _2873 = fma(_2613, _2861, _2601);
    float _2875 = fma(_2615, _2861, _2603);
    float _2877 = _2867 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2879 = fma(_2607, _2869, _2605);
    bool _2881 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2883 = isnan(_1917);
    bool _2885 = _2881 || _2883;
    bool _2887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2889 = _2885 || _2887;
    float _2891 = _2741 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _2877;
    out.m_97.x = _2873;
    out.m_97.y = _2875;
    out.m_97.z = _2879;
    out.m_97.w = _2871;
    float _2893 = _2859;
    float _2895 = _2847;
    float _2897 = _2861;
    float _2899 = _2867;
    if (!_2889)
    {
        _2893 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2901 = _2893;
    float _2903 = _2901;
    float _2905 = _2901;
    if (!_2889)
    {
        _2779 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2907 = _2779;
    float _2909 = _2907;
    float _2911 = _2907;
    if (!_2889)
    {
        _2689 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2913 = _2689;
    float _2915 = _2913;
    float _2917 = _2913;
    if (!_2889)
    {
        _2895 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2919 = _2895;
    float _2921 = _2919;
    float _2923 = _2919;
    if (!_2889)
    {
        _2897 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2925 = _2897;
    float _2927 = _2925;
    float _2929 = _2925;
    if (!_2889)
    {
        _2899 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2931 = _2899;
    bool _2933 = !_2889;
    float _2935 = _2931;
    float _2937 = _2931;
    if (!_2933)
    {
        bool _2939 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2941 = isnan(_1917);
        bool _2943 = _2939 || _2941;
        bool _2945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2947 = _2943 || _2945;
        if (!_2947)
        {
            float _2949 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2951 = _1917 + _2949;
            float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2955 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2953;
            float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2961 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2963 = _2961 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2965 = 1.0 / _2955;
            float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2969 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2973 = _2971 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2975 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2977 = _2975 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2979 = _2951 * _2965;
            float _2981 = precise::clamp(_2979, 0.0, 1.0);
            float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2985 = _2983 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2987 = fma(_2981, _2959, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2989 = fma(_2981, _2963, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2991 = fma(_2981, _2985, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2993 = fma(_2981, _2969, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2995 = fma(_2981, _2973, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2997 = fma(_2981, _2977, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2911 = _2989;
            _2929 = _2995;
            _2905 = _2987;
            _2923 = _2993;
            _2917 = _2991;
            _2937 = _2997;
            _2999 = true;
        }
        else
        {
            bool _3001 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3003 = isnan(_1917);
            bool _3005 = _3001 || _3003;
            bool _3007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3009 = _3005 || _3007;
            if (!_3009)
            {
                _2903 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3011 = _2903;
            _2905 = _3011;
            if (!_3009)
            {
                _2909 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3013 = _2909;
            _2911 = _3013;
            if (!_3009)
            {
                _2915 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3015 = _2915;
            _2917 = _3015;
            if (!_3009)
            {
                _2921 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3017 = _2921;
            _2923 = _3017;
            if (!_3009)
            {
                _2927 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3019 = _2927;
            _2929 = _3019;
            if (!_3009)
            {
                _2935 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3021 = _2935;
            bool _3023 = !_3009;
            _2937 = _3021;
            if (!_3023)
            {
                bool _3025 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3027 = isnan(_1917);
                bool _3029 = _3025 || _3027;
                bool _3031 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3033 = _3029 || _3031;
                if (!_3033)
                {
                    float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3037 = _1917 + _3035;
                    float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3041 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3039;
                    float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3049 = _3047 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3051 = 1.0 / _3041;
                    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3055 = _3053 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3059 = _3057 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3061 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3063 = _3061 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3065 = _3037 * _3051;
                    float _3067 = precise::clamp(_3065, 0.0, 1.0);
                    float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3071 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3073 = fma(_3067, _3045, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3075 = fma(_3067, _3049, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3077 = fma(_3067, _3071, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3079 = fma(_3067, _3055, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3081 = fma(_3067, _3059, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3083 = fma(_3067, _3063, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2911 = _3075;
                    _2929 = _3081;
                    _2905 = _3073;
                    _2923 = _3079;
                    _2917 = _3077;
                    _2937 = _3083;
                    _2999 = true;
                }
                else
                {
                    _2911 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2929 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2905 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2923 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2917 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2937 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2999 = false;
    float _3085 = _2911;
    float _3087 = _2929;
    float _3089 = _2905;
    float _3091 = _2923;
    float _3093 = _2917;
    float _3095 = _2937;
    float _3097 = fma(_1763, -0.5, 0.5);
    float _3099 = precise::clamp(_3097, 0.0, 1.0);
    float _3101 = -_3085;
    float _3103 = _3101 + _3087;
    float _3105 = _2891 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3107 = -_3089;
    float _3109 = _3107 + _3091;
    out.m_99.x = 0.0;
    float _3111 = fma(_3099, _3103, _3085);
    float _3113 = fma(_3099, _3109, _3089);
    out.m_63.x = _3105;
    float _3115 = -_3093;
    float _3117 = _3115 + _3095;
    float _3119 = _3111 * 0.586610972881317138671875;
    bool _3121 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3123 = fma(_3099, _3117, _3093);
    float _3125 = fma(_3113, 0.298911988735198974609375, _3119);
    bool _3127 = _2741 > 0.0;
    bool _3129 = isnan(_2741);
    bool _3131 = _3127 || _3129;
    bool _3133 = isnan(0.0);
    bool _3135 = _3131 || _3133;
    float _3137 = fma(_3123, 0.114477999508380889892578125, _3125);
    float _3139 = -_3137;
    float _3141 = _3113 + _3139;
    float _3143 = -_3137;
    float _3145 = _3111 + _3143;
    float _3147 = -_3137;
    float _3149 = _3123 + _3147;
    float _3151 = fma(_3141, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3137);
    float _3153 = fma(_3145, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3137);
    float _3155 = fma(_3149, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3137);
    bool _3157 = !_3121;
    if (!_3157)
    {
        float _3159 = -_1861;
        float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3163 = -_1863;
        float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3167 = -_1865;
        float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3171 = _3161 * _3161;
        float _3173 = fma(_3165, _3165, _3171);
        float _3175 = fma(_3169, _3169, _3173);
        float _3177 = sqrt(_3175);
        float _3179 = rsqrt(_3175);
        float _3181 = -_3177;
        float _3183 = _3181 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3185 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3187 = precise::clamp(_3185, 0.0, 1.0);
        float _3189 = _3165 * _3179;
        float _3191 = _3161 * _3179;
        float _3193 = abs(_3187);
        float _3195 = log2(_3193);
        float _3197 = _3169 * _3179;
        float _3199 = _3189 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3201 = _1763 * _3191;
        float _3203 = -_3191;
        float _3205 = -_3199;
        float _3207 = fma(_3203, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3205);
        float _3209 = fma(_1761, _3189, _3201);
        float _3211 = -_3197;
        float _3213 = fma(_3211, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3207);
        float _3215 = fma(_1765, _3197, _3209);
        float _3217 = precise::clamp(_3215, 0.0, 1.0);
        float _3219 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3221 = _3213 + _3219;
        float _3223 = _3195 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3225 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3227 = precise::clamp(_3225, 0.0, 1.0);
        float _3229 = exp2(_3223);
        float _3231 = _3229 * _3227;
        float _3233 = _3217 * _3231;
        float _3235 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3237 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3239 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _3235;
        out.m_99.y = _3237;
        out.m_99.z = _3239;
    }
    out.m_101.x = _3151;
    out.m_101.y = _3153;
    out.m_101.z = _3155;
    if (_3135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_63.x = 0.0;
    float _3241 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3241;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad9 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2999 = false;
    bool _1813 = false;
    bool _1081 = false;
    bool _889 = false;
    bool _359 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_60.w;
    float _123 = trunc(_121);
    int _125 = int(_123);
    bool _129 = _125 >= 1;
    float _131 = 0.0;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    float _135 = _133;
    if (!_129)
    {
        out.m_63.x = 0.0;
    }
    int _137 = 0;
    if (!_129)
    {
        float _139 = _133 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3298 = as_type<float>(_141);
        out.gl_Position.z = _3298;
    }
    if (!_129)
    {
        return out;
    }
    float _145 = in.m_65.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _161 = 0.0;
    float _163 = _159;
    if (_155)
    {
        float _165 = float(_125);
        _161 = _165;
    }
    float _167 = _161;
    bool _169 = _159 >= _167;
    bool _171 = !_155;
    bool _173 = _169 || _171;
    if (_173)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _135;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    if (_173)
    {
        float _177 = _175 * 5.0;
        _143 = as_type<int>(_177);
    }
    int _179 = _143;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3367 = as_type<float>(_179);
        out.gl_Position.z = _3367;
    }
    if (_173)
    {
        return out;
    }
    float _181 = in.m_67.x;
    float _183 = in.m_67.y;
    float _185 = in.m_67.z;
    float _187 = in.m_69.x;
    float _189 = in.m_69.y;
    float _191 = in.m_69.z;
    float _193 = in.m_71.x;
    float _195 = in.m_71.y;
    float _197 = in.m_71.z;
    float _199 = _181 * _181;
    float _201 = _183 * _183;
    float _203 = _185 * _185;
    float _205 = fma(_187, _187, _199);
    float _207 = fma(_189, _189, _201);
    float _209 = fma(_191, _191, _203);
    float _211 = fma(_193, _193, _205);
    float _213 = fma(_195, _195, _207);
    float _215 = fma(_197, _197, _209);
    float _217 = sqrt(_211);
    float _219 = sqrt(_213);
    float _221 = sqrt(_215);
    bool _223 = _217 > 0.0;
    bool _225 = _219 > 0.0;
    float _227 = _219;
    float _229 = _217;
    float _231 = _211;
    float _233 = _215;
    if (_223)
    {
        float _235 = rsqrt(_211);
        _227 = _235;
    }
    float _237 = _227;
    float _239 = 0.0;
    float _241 = 0.0;
    if (!_223)
    {
        _239 = 0.0;
        _241 = 0.0;
    }
    float _243 = _239;
    float _245 = _241;
    bool _247 = _221 > 0.0;
    float _249 = 0.0;
    float _251 = _245;
    float _253 = _243;
    if (!_223)
    {
        _249 = 0.0;
    }
    float _255 = _249;
    float _257 = 0.0;
    float _259 = _255;
    if (!_225)
    {
        _257 = 0.0;
    }
    float _261 = _257;
    float _263 = 0.0;
    float _265 = _261;
    if (_225)
    {
        float _267 = rsqrt(_213);
        _263 = _267;
    }
    float _269 = _263;
    float _271 = 0.0;
    if (!_225)
    {
        _271 = 0.0;
    }
    float _273 = _271;
    float _275 = _273;
    if (!_225)
    {
        _229 = 0.0;
    }
    float _277 = _229;
    float _279 = _277;
    if (!_247)
    {
        _231 = 0.0;
    }
    float _281 = _231;
    float _283 = _221;
    float _285 = _281;
    if (_247)
    {
        float _287 = rsqrt(_215);
        _283 = _287;
    }
    float _289 = _283;
    float _291 = _237;
    if (_223)
    {
        float _293 = _237 * _187;
        _259 = _293;
    }
    float _295 = _259;
    if (_223)
    {
        float _297 = _237 * _181;
        _251 = _297;
    }
    float _299 = _251;
    if (_223)
    {
        float _301 = _237 * _193;
        _253 = _301;
    }
    float _303 = _253;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_247)
    {
        _291 = 0.0;
    }
    float _307 = _291;
    float _309 = _307;
    if (_225)
    {
        float _311 = _269 * _189;
        _265 = _311;
    }
    float _313 = _265;
    if (!_247)
    {
        _233 = 0.0;
    }
    float _315 = _233;
    float _317 = _315;
    if (_225)
    {
        float _319 = _269 * _183;
        _275 = _319;
    }
    float _321 = _275;
    if (_225)
    {
        float _323 = _269 * _195;
        _279 = _323;
    }
    float _325 = _279;
    if (_247)
    {
        float _327 = _289 * _191;
        _317 = _327;
    }
    float _329 = _317;
    if (_247)
    {
        float _331 = _289 * _185;
        _309 = _331;
    }
    float _333 = _309;
    if (_247)
    {
        float _335 = _289 * _197;
        _285 = _335;
    }
    float _337 = _285;
    bool _339 = !_305;
    float _357;
    if (!_339)
    {
        float _341 = in.m_73.x;
        float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _345 = _341 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _349 = _347 * _343;
        float _351 = floor(_349);
        float _353 = -_351;
        float _355 = _349 + _353;
        _357 = _355;
        _359 = true;
    }
    else
    {
        float _361 = float(_125);
        float _363 = 1.0 / _361;
        float _365 = _159 * _363;
        _357 = _365;
    }
    _359 = false;
    float _367 = _357;
    int _369 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _371 = _369;
    int _373 = 0;
    int _375 = _116(_371, _373, (*spvDescriptorSet0.support_buffer));
    float _377 = in.m_73.x;
    float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _381 = in.m_73.y;
    float _383 = in.m_75.z;
    float _385 = -_379;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _389 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _377);
    float _391 = fma(_387, _381, _379);
    float _393 = _389 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _395 = trunc(_383);
    int _397 = int(_395);
    float _399 = _393 * _391;
    float _401 = float(_375);
    int _403 = abs(_375);
    bool _405 = _375 == 0;
    float _407 = _399 * _401;
    float _409 = float(uint(_403));
    float _411 = trunc(_407);
    int _413 = int(_411);
    float _415 = 1.0 / _409;
    int _417 = abs(_413);
    uint _420 = uint(int(uint(_413) >> uint(31)));
    float _422 = float(uint(_417));
    int _424 = ~int(_420);
    int _426 = _424 + 1;
    int _428 = as_type<int>(_415) + (-2);
    float _430 = as_type<float>(_428) * _422;
    float _432 = trunc(_430);
    float _434 = precise::max(_432, 0.0);
    uint _436 = uint(_434);
    int _438 = ~int(_436);
    int _440 = _438 + 1;
    int _442 = _440 * _403;
    int _444 = _442 + _417;
    float _446 = float(uint(_444));
    float _448 = as_type<float>(_428) * _446;
    float _450 = trunc(_448);
    float _452 = precise::max(_450, 0.0);
    uint _454 = uint(_452);
    int _456 = int(_436) + int(_454);
    int _458 = ~_456;
    int _460 = _458 + 1;
    int _462 = _460 * _403;
    int _464 = _462 + _417;
    bool _466 = uint(_464) >= uint(_403);
    bool _468 = !_466;
    int _470 = _468 ? 0 : (-1);
    int _472 = ~_456;
    int _474 = _472 + _470;
    int _476 = _474 + 1;
    int _478 = _476 * _403;
    int _480 = _478 + _417;
    int _482 = _480 ^ _426;
    int _484 = ~_426;
    int _486 = _484 + _482;
    int _488 = _486 + 1;
    bool _490 = !_405;
    int _492 = _490 ? _488 : (-1);
    int _494 = _492;
    int _496 = 0;
    int _498 = _117(_494, _496, (*spvDescriptorSet0.support_buffer));
    int _500 = _397;
    int _502 = 0;
    int _504 = _117(_500, _502, (*spvDescriptorSet0.support_buffer));
    float4 _507 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_498, _504)), 0).xyzw;
    float _509 = _507.x;
    float _511 = _507.y;
    float _513 = _507.z;
    float _515 = _507.w;
    float _517 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _519 = in.m_75.x;
    bool _521 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _523 = isnan(_367);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = _517 * _377;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _537 = _535 != 0;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _541 = _539 != 0;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _543;
    float _547 = trunc(_533);
    int _549 = int(_547);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _553 = _367 + _551;
    bool _555 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _557 = isnan(_367);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    bool _567 = _377 > 0.5;
    bool _569 = _567 && _537;
    bool _571 = _381 > 0.5;
    bool _573 = _571 && _541;
    float _575 = -_565;
    float _577 = _575 + 1.0;
    float _579 = 1.0 / _545;
    float _581 = _531 * _577;
    int _583 = _492 + 1;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _587 = -_531;
    float _589 = _587 + 1.0;
    int _591 = _549 << 4;
    int _593 = _591 + 1712;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _597 = _585 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _599 = uint(int(uint(_593) >> uint(2)));
    uint _601 = uint(int(uint(int(_599)) >> uint(2)));
    int _603 = int(_599) & 3;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[int(_601)][_603];
    int _607 = int(_599) + 1;
    uint _609 = uint(int(uint(_607) >> uint(2)));
    int _611 = _607 & 3;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[int(_609)][_611];
    float _615 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _617;
    float _621 = _553 * _579;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _625 = fma(_619, _621, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _627 = _593 + 8;
    uint _629 = uint(int(uint(_627) >> uint(2)));
    uint _631 = uint(int(uint(int(_629)) >> uint(2)));
    int _633 = int(_629) & 3;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[int(_631)][_633];
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _637;
    float _641 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _643;
    float _647 = _625 * _581;
    float _649 = fma(_639, _621, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _651 = fma(_645, _621, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    out.m_77.x = _597;
    out.m_77.y = _615;
    out.m_77.z = _641;
    float _653 = _649 * _581;
    float _655 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].y, _647);
    float _657 = _651 * _581;
    int _659 = abs(_583);
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _663 = _649;
    float _665 = _597;
    if (_537)
    {
        _663 = _519;
    }
    float _667 = _663;
    float _669 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[144].y, _655);
    uint _671 = uint(int(uint(_583) >> uint(31)));
    float _673 = _667;
    if (_569)
    {
        float _675 = -_667;
        float _677 = _675 + 1.0;
        _673 = _677;
    }
    float _679 = _673;
    float _681 = float(uint(_659));
    float _683 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].x, _653);
    float _685 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].z, _657);
    if (!_537)
    {
        _665 = _519;
    }
    float _687 = _665;
    float _689 = as_type<float>(_428) * _681;
    float _691 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[144].x, _683);
    float _693 = _687;
    if (_537)
    {
        _693 = _679;
    }
    float _695 = _693;
    float _697 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[144].z, _685);
    int _699 = ~int(_671);
    int _701 = _699 + 1;
    float _703 = trunc(_689);
    float _705 = precise::max(_703, 0.0);
    uint _707 = uint(_705);
    float _709 = _695 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _711 = _613 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _713 = _605 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _715 = _711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _721 = ~int(_707);
    int _723 = _721 + 1;
    float _725 = _635 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _727 = _723 * _403;
    int _729 = _727 + _659;
    float _731 = _725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _733 = float(uint(_729));
    out.m_79.x = _717;
    out.m_79.y = _715;
    out.m_79.z = _731;
    out.m_79.w = _661;
    float _735 = as_type<float>(_428) * _733;
    float _737 = trunc(_735);
    float _739 = precise::max(_737, 0.0);
    uint _741 = uint(_739);
    int _743 = int(_707) + int(_741);
    int _745 = ~_743;
    int _747 = _745 + 1;
    int _749 = _747 * _403;
    int _751 = _749 + _659;
    bool _753 = uint(_751) >= uint(_403);
    bool _755 = !_753;
    int _757 = _755 ? 0 : (-1);
    int _759 = ~_743;
    int _761 = _759 + _757;
    int _763 = _761 + 1;
    int _765 = _763 * _403;
    int _767 = _765 + _659;
    float _769 = in.m_75.y;
    int _771 = _767 ^ _701;
    int _773 = ~_701;
    int _775 = _773 + _771;
    int _777 = _775 + 1;
    bool _779 = !_405;
    int _781 = _779 ? _777 : (-1);
    float _783 = _769;
    if (_573)
    {
        float _785 = -_769;
        float _787 = _785 + 1.0;
        _783 = _787;
    }
    float _789 = _783;
    float _791 = _789 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _793 = _791 * _719;
    uint _795 = as_type<uint>(half2(float2(_515, 0.0)));
    uint _797 = extract_bits(_795, 0u, 8u);
    int _799 = int(_797) & 255;
    uint _801 = extract_bits(_795, 8u, 8u);
    int _803 = int(_801) & 255;
    int _805 = _803 << 8;
    int _807 = _799 | _805;
    bool _809 = _807 >= 32768;
    int _811 = _807 + (-1024);
    int _813 = _811;
    float _815 = _793;
    if (_809)
    {
        int _817 = ~_807;
        int _819 = _817 + 33792;
        int _821 = _819 + 1;
        _813 = _821;
    }
    int _823 = _813;
    int _825 = _823 + 30719;
    float _827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _829 = float(_825);
    float _831 = fma(_829, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _833 = abs(_831);
    float _835 = -_833;
    float _837 = _835 + 1.0;
    float _839 = abs(_831);
    float _841 = fma(_839, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _843 = as_type<int>(_837) + (-218103808);
    float _845 = abs(_831);
    float _847 = fma(_845, _841, -0.212114393711090087890625);
    float _849 = _709 * _827;
    bool _851 = _831 < 0.0;
    float _853 = float(_851);
    bool _855 = uint(_843) >= 1920991232u;
    float _857 = abs(_831);
    float _859 = fma(_857, _847, 1.570728778839111328125);
    bool _861 = !_855;
    float _887;
    if (!_861)
    {
        int _863 = as_type<int>(_837);
        int _865 = as_type<int>(_837);
        int _867 = _701;
        int _869 = 3680;
        int _871 = 0;
        int _873;
        int _875;
        int _877;
        int _879;
        int _881;
        int _883;
        int _885;
        _114(_863, _865, _867, _869, _871, _873, _875, _877, _879, _881, _883, _885, out.gl_Position, out.gl_PointSize);
        _887 = as_type<float>(_883);
        _889 = true;
    }
    else
    {
        float _891 = rsqrt(_837);
        float _893 = _837 * _891;
        float _895 = _891 * 0.5;
        float _897 = -_893;
        float _899 = 0.0 + _897;
        float _901 = fma(_895, _899, 0.5);
        float _903 = fma(_893, _901, _893);
        float _905 = -_903;
        float _907 = 0.0 + _905;
        float _909 = fma(_903, _907, _837);
        float _911 = fma(_895, _909, _903);
        _887 = _911;
    }
    _889 = false;
    float _913 = _887;
    int _915 = _781;
    int _917 = 0;
    int _919 = _117(_915, _917, (*spvDescriptorSet0.support_buffer));
    int _921 = _397;
    int _923 = 0;
    int _925 = _117(_921, _923, (*spvDescriptorSet0.support_buffer));
    float4 _927 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_919, _925)), 0).xyzw;
    float _929 = _927.x;
    float _931 = _927.y;
    float _933 = _927.z;
    float _935 = _927.w;
    float _937 = _859 * _913;
    float _939 = _853 * 2.0;
    float _941 = _829 * 3.883221149444580078125;
    float _943 = floor(_407);
    float _945 = -_939;
    float _947 = fma(_937, _945, _937);
    float _949 = _941 * 0.15915493667125701904296875;
    float _951 = fma(_853, 3.1415927410125732421875, _947);
    float _953 = _949 * 6.283185482025146484375;
    float _955 = cos(_953);
    float _957 = _951 * 0.15915493667125701904296875;
    float _959 = _957 * 6.283185482025146484375;
    float _961 = sin(_959);
    float _963 = -_943;
    float _965 = _407 + _963;
    float _967 = _961 * _955;
    float _969 = _949 * 6.283185482025146484375;
    float _971 = sin(_969);
    float _973 = _961 * _971;
    uint _975 = as_type<uint>(half2(float2(_935, 0.0)));
    float _977 = -_509;
    float _979 = _977 + _929;
    float _981 = -_513;
    float _983 = _981 + _933;
    uint _985 = extract_bits(_975, 0u, 8u);
    int _987 = int(_985) & 255;
    uint _989 = extract_bits(_975, 8u, 8u);
    int _991 = int(_989) & 255;
    int _993 = _991 << 8;
    int _995 = _987 | _993;
    float _997 = fma(_965, _979, _509);
    float _999 = fma(_965, _983, _513);
    bool _1001 = _995 >= 32768;
    int _1003 = _995 + (-1024);
    int _1005 = _1003;
    if (_1001)
    {
        int _1007 = ~_995;
        int _1009 = _1007 + 33792;
        int _1011 = _1009 + 1;
        _1005 = _1011;
    }
    int _1013 = _1005;
    int _1015 = _1013 + 30719;
    float _1017 = float(_1015);
    float _1019 = fma(_1017, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1021 = abs(_1019);
    float _1023 = -_1021;
    float _1025 = _1023 + 1.0;
    float _1027 = abs(_1019);
    float _1029 = fma(_1027, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1031 = _1019 < 0.0;
    float _1033 = float(_1031);
    int _1035 = as_type<int>(_1025) + (-218103808);
    float _1037 = abs(_1019);
    float _1039 = fma(_1037, _1029, -0.212114393711090087890625);
    bool _1041 = uint(_1035) >= 1920991232u;
    float _1043 = -_511;
    float _1045 = _1043 + _931;
    float _1047 = abs(_1019);
    float _1049 = fma(_1047, _1039, 1.570728778839111328125);
    float _1051 = fma(_965, _1045, _511);
    bool _1053 = !_1041;
    float _1079;
    if (!_1053)
    {
        int _1055 = as_type<int>(_1025);
        int _1057 = as_type<int>(_949);
        int _1059 = as_type<int>(_943);
        int _1061 = 4576;
        int _1063 = as_type<int>(_957);
        int _1065;
        int _1067;
        int _1069;
        int _1071;
        int _1073;
        int _1075;
        int _1077;
        _114(_1055, _1057, _1059, _1061, _1063, _1065, _1067, _1069, _1071, _1073, _1075, _1077, out.gl_Position, out.gl_PointSize);
        _1079 = as_type<float>(_1075);
        _1081 = true;
    }
    else
    {
        float _1083 = rsqrt(_1025);
        float _1085 = _1025 * _1083;
        float _1087 = _1083 * 0.5;
        float _1089 = -_1085;
        float _1091 = 0.0 + _1089;
        float _1093 = fma(_1087, _1091, 0.5);
        float _1095 = fma(_1085, _1093, _1085);
        float _1097 = -_1095;
        float _1099 = 0.0 + _1097;
        float _1101 = fma(_1095, _1099, _1025);
        float _1103 = fma(_1087, _1101, _1095);
        _1079 = _1103;
    }
    _1081 = false;
    float _1105 = _1079;
    float _1107 = in.m_73.x;
    float _1109 = in.m_73.y;
    float _1111 = in.m_73.z;
    float _1113 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1115 = log2(_1113);
    float _1117 = _1049 * _1105;
    float _1119 = _1017 * 3.883221149444580078125;
    float _1121 = -_831;
    float _1123 = _1121 + _1019;
    float _1125 = _1115 * _159;
    float _1127 = exp2(_1125);
    float _1129 = _1111 * 2.0;
    float _1131 = _1107 * 2.0;
    float _1133 = _1109 * 2.0;
    float _1135 = floor(_1129);
    float _1137 = floor(_1131);
    float _1139 = -_1127;
    float _1141 = _1139 + 1.0;
    float _1143 = floor(_1133);
    bool _1145 = _1135 > 0.0;
    bool _1147 = _1135 >= 0.0;
    bool _1149 = isnan(_1135);
    bool _1151 = _1147 || _1149;
    bool _1153 = isnan(0.0);
    bool _1155 = _1151 || _1153;
    int _1157 = _1155 ? 0 : 1;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1161 = _1159 != 0;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1165 = _1163 != 0;
    int _1167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1169 = _1167 != 0;
    int _1171 = ~_1157;
    int _1173 = _1171 + 1;
    int _1175 = _1173 + 1;
    bool _1177 = _1137 > 0.0;
    int _1179 = _1175;
    if (!_1145)
    {
        int _1181 = ~_1157;
        int _1183 = _1181 + 1;
        _1179 = _1183;
    }
    int _1185 = _1179;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1189 = 1.0 + _1187;
    bool _1191 = _1137 >= 0.0;
    bool _1193 = isnan(_1137);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan(0.0);
    bool _1199 = _1195 || _1197;
    bool _1201 = _1143 > 0.0;
    float _1203 = 1.0 / _1189;
    bool _1205 = _1143 >= 0.0;
    bool _1207 = isnan(_1143);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan(0.0);
    bool _1213 = _1209 || _1211;
    float _1215 = in.m_81.x;
    float _1217 = in.m_81.y;
    float _1219 = in.m_81.z;
    bool _1221 = !_1161;
    int _1223 = _1221 ? 0 : 1;
    int _1225 = _1199 ? 0 : 1;
    bool _1227 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1229 = isnan(1.0);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1235 = _1231 || _1233;
    int _1237 = abs(_1223);
    float _1239 = _1109 + _1107;
    bool _1241 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1243 = isnan(0.0);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1237);
    float _1253 = _1239 + (-1.0);
    float _1255 = float(_1185);
    float _1257 = _1249 ? _1141 : 0.0;
    float _1259 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1261 = _1213 ? 0 : 1;
    float _1263 = _1251 * _1255;
    float _1265 = _1107 + (-0.5);
    if (_1235)
    {
        float _1267 = _1257 * _1203;
        _163 = _1267;
    }
    float _1269 = _163;
    int _1271 = ~_1261;
    int _1273 = _1271 + 1;
    int _1275 = _1273 + 1;
    float _1277 = _1263 * (-2.0);
    bool _1279 = !_1169;
    int _1281 = _1279 ? 0 : 1;
    float _1283 = _1111 + _1107;
    bool _1285 = !_1165;
    int _1287 = _1285 ? 0 : 1;
    float _1289 = fma(_1277, _1215, _1215);
    int _1291 = abs(_1281);
    float _1293 = fma(_1259, _1277, _1259);
    int _1295 = _1275;
    if (!_1201)
    {
        int _1297 = ~_1261;
        int _1299 = _1297 + 1;
        _1295 = _1299;
    }
    int _1301 = _1295;
    float _1303 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1289);
    float _1305 = _1283 + (-1.0);
    int _1307 = abs(_1287);
    float _1309 = fma(_1293, _1269, _1303);
    float _1311 = float(_1291);
    float _1313 = float(_1301);
    float _1315 = _1309 * 0.15915493667125701904296875;
    int _1317 = ~_1225;
    int _1319 = _1317 + 1;
    int _1321 = _1319 + 1;
    float _1323 = _1311 * _1313;
    int _1325 = _1321;
    if (!_1177)
    {
        int _1327 = ~_1225;
        int _1329 = _1327 + 1;
        _1325 = _1329;
    }
    int _1331 = _1325;
    float _1333 = fma(_1305, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1335 = float(_1307);
    float _1337 = _1323 * (-2.0);
    float _1339 = float(_1331);
    float _1341 = _1111 + (-0.5);
    float _1343 = _1111 + _1109;
    float _1345 = fma(_1337, _1219, _1219);
    float _1347 = fma(_1333, _1337, _1333);
    float _1349 = _1335 * _1339;
    float _1351 = _1343 + (-1.0);
    float _1353 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1345);
    float _1355 = in.m_60.x;
    float _1357 = in.m_60.y;
    float _1359 = in.m_60.z;
    float _1361 = _1349 * (-2.0);
    float _1363 = _1109 + (-0.5);
    float _1365 = fma(_1347, _1269, _1353);
    float _1367 = in.m_69.x;
    float _1369 = in.m_69.y;
    float _1371 = in.m_69.z;
    float _1373 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1375 = _1315 * 6.283185482025146484375;
    float _1377 = sin(_1375);
    float _1379 = _1365 * 0.15915493667125701904296875;
    float _1381 = in.m_83.x;
    float _1383 = in.m_83.y;
    float _1385 = in.m_83.z;
    float _1387 = fma(_1361, _1217, _1217);
    float _1389 = fma(_1373, _1361, _1373);
    float _1391 = _1033 * 2.0;
    float _1393 = in.m_71.x;
    float _1395 = in.m_71.y;
    float _1397 = in.m_71.z;
    float _1399 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1387);
    float _1401 = _1315 * 6.283185482025146484375;
    float _1403 = cos(_1401);
    float _1405 = -_1391;
    float _1407 = fma(_1117, _1405, _1117);
    bool _1409 = _1051 != 0.0;
    bool _1411 = isnan(_1051);
    bool _1413 = _1409 || _1411;
    bool _1415 = isnan(0.0);
    bool _1417 = _1413 || _1415;
    float _1419 = fma(_1389, _1269, _1399);
    float _1421 = fma(_1033, 3.1415927410125732421875, _1407);
    bool _1423 = _997 == 0.0;
    bool _1425 = !_1417;
    bool _1427 = _1423 && _1425;
    float _1429 = _1419 * 0.15915493667125701904296875;
    float _1431 = _1379 * 6.283185482025146484375;
    float _1433 = sin(_1431);
    float _1435 = _1421 * 0.15915493667125701904296875;
    bool _1437 = _999 == 0.0;
    bool _1439 = _1437 && _1427;
    float _1441 = _1369 * _1357;
    float _1443 = _1429 * 6.283185482025146484375;
    float _1445 = cos(_1443);
    float _1447 = _669 * _1383;
    float _1449 = _697 * _1385;
    float _1451 = fma(_1367, _1355, _1441);
    float _1453 = _691 * _1381;
    float _1455 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1051);
    float _1457 = _1447 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1459 = _1379 * 6.283185482025146484375;
    float _1461 = cos(_1459);
    float _1463 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _999);
    float _1465 = _1449 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1467 = _1395 * _1357;
    float _1469 = fma(_1371, _1359, _1451);
    float _1471 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _997);
    float _1473 = _1453 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1475 = _1457 * _1455;
    float _1477 = _1429 * 6.283185482025146484375;
    float _1479 = sin(_1477);
    float _1481 = _1465 * _1463;
    float _1483 = fma(_1393, _1355, _1467);
    float _1485 = _1403 * _1433;
    float _1487 = _1377 * _1433;
    float _1489 = _1445 * _1433;
    float _1491 = _1473 * _1471;
    float _1493 = fma(_1397, _1359, _1483);
    float _1495 = _1403 * _1461;
    float _1497 = _1377 * _1461;
    float _1499 = _1377 * _1445;
    float _1501 = _1445 * _1461;
    float _1503 = _1403 * _1445;
    float _1505 = _1469 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1507 = _1435 * 6.283185482025146484375;
    float _1509 = sin(_1507);
    float _1511 = fma(_1479, _1487, _1495);
    float _1513 = -_1485;
    float _1515 = fma(_1479, _1497, _1513);
    float _1517 = -_1497;
    float _1519 = fma(_1479, _1485, _1517);
    float _1521 = _1499 * _1475;
    float _1523 = _1511 * _1475;
    float _1525 = _1515 * _1475;
    float _1527 = fma(_1479, _1495, _1487);
    float _1529 = -_1479;
    float _1531 = fma(_1529, _1491, _1521);
    float _1533 = fma(_1489, _1491, _1523);
    float _1535 = fma(_1501, _1491, _1525);
    float _1537 = fma(_1503, _1481, _1531);
    float _1539 = fma(_1519, _1481, _1533);
    float _1541 = fma(_1527, _1481, _1535);
    float _1543 = _1119 * 0.15915493667125701904296875;
    float _1545 = in.m_67.x;
    float _1547 = in.m_67.y;
    float _1549 = in.m_67.z;
    float _1551 = _1539 * _313;
    float _1553 = _1539 * _325;
    float _1555 = _1543 * 6.283185482025146484375;
    float _1557 = cos(_1555);
    float _1559 = _1539 * _321;
    float _1561 = fma(_1541, _295, _1551);
    float _1563 = fma(_1541, _303, _1553);
    float _1565 = _1493 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1567 = fma(_1541, _299, _1559);
    float _1569 = fma(_1537, _329, _1561);
    float _1571 = fma(_1537, _337, _1563);
    float _1573 = _1543 * 6.283185482025146484375;
    float _1575 = sin(_1573);
    float _1577 = fma(_1537, _333, _1567);
    float _1579 = _1505 + _1569;
    float _1581 = _1565 + _1571;
    float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1585 = _1579 + _1583;
    float _1587 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1589 = _1581 + _1587;
    float _1591 = -_967;
    float _1593 = fma(_1509, _1557, _1591);
    float _1595 = _1585 * _1585;
    float _1597 = _1589 * _1589;
    float _1599 = _1547 * _1357;
    float _1601 = _1595 + _1597;
    float _1603 = -_973;
    float _1605 = fma(_1509, _1575, _1603);
    float _1607 = fma(_1545, _1355, _1599);
    float _1609 = fma(_965, _1123, _831);
    float _1611 = sqrt(_1601);
    float _1613 = fma(_965, _1593, _967);
    float _1615 = fma(_1549, _1359, _1607);
    float _1617 = _1609;
    float _1619 = _1613;
    float _1621 = _1595;
    float _1623 = _1597;
    float _1625 = _1579;
    float _1627 = _1581;
    int _1629 = as_type<int>(_1475);
    int _1631 = as_type<int>(_1559);
    float _1633 = _1565;
    if (!_1439)
    {
        float _1635 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1609);
        _1617 = _1635;
    }
    float _1637 = _1617;
    float _1639 = fma(_965, _1605, _973);
    float _1641 = _1639;
    float _1643 = _1637;
    if (!_1439)
    {
        float _1645 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1613);
        _1619 = _1645;
    }
    float _1647 = _1619;
    float _1649 = _1615 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1651 = _1499 * _1637;
    float _1653 = _1515 * _1637;
    float _1655 = _1511 * _1637;
    float _1657 = _1649 + _1577;
    if (!_1439)
    {
        float _1659 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1639);
        _1641 = _1659;
    }
    float _1661 = _1641;
    bool _1663 = _1611 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1663)
    {
        _1643 = _1657;
    }
    float _1665 = _1643;
    bool _1667 = !_1663;
    float _1669 = _1665;
    if (!_1667)
    {
        float _1671 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1675 = _1611 + _1673;
        float _1677 = rsqrt(_1601);
        float _1679 = _1675 * _1671;
        float _1681 = _1657 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1683 = _1679 * 0.15915493667125701904296875;
        float _1685 = _1683 * 6.283185482025146484375;
        float _1687 = sin(_1685);
        float _1689 = _1683 * 6.283185482025146484375;
        float _1691 = cos(_1689);
        float _1693 = fma(_1687, _1681, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1695 = _1677 * _1693;
        float _1697 = _1691 + (-1.0);
        float _1699 = _1585 * _1695;
        float _1701 = _1589 * _1695;
        float _1703 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1705 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1707 = _1699 * _1699;
        float _1709 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1711 = fma(_1657, _1691, _1703);
        float _1713 = _1701 * _1701;
        _1669 = _1711;
        _1621 = _1707;
        _1623 = _1713;
        _1625 = _1705;
        _1627 = _1709;
    }
    float _1715 = _1669;
    float _1717 = _1621;
    float _1719 = _1623;
    float _1721 = _1625;
    float _1723 = _1627;
    float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1727 = _1715 + _1725;
    float _1729 = fma(_1489, _1647, _1655);
    float _1731 = fma(_1501, _1647, _1653);
    float _1733 = -_1479;
    float _1735 = fma(_1733, _1647, _1651);
    float _1737 = fma(_1727, _1727, _1717);
    float _1739 = fma(_1519, _1661, _1729);
    float _1741 = fma(_1527, _1661, _1731);
    float _1743 = fma(_1503, _1661, _1735);
    float _1745 = _1737 + _1719;
    float _1747 = _1739 * _313;
    float _1749 = _1739 * _321;
    float _1751 = _1739 * _325;
    out.m_85.x = _849;
    out.m_85.y = _793;
    float _1753 = fma(_1741, _295, _1747);
    float _1755 = sqrt(_1745);
    float _1757 = fma(_1741, _299, _1749);
    float _1759 = fma(_1741, _303, _1751);
    float _1761 = fma(_1743, _329, _1753);
    float _1763 = fma(_1743, _333, _1757);
    float _1765 = fma(_1743, _337, _1759);
    out.m_87.x = _1761;
    out.m_87.y = _1763;
    out.m_87.z = _1765;
    bool _1767 = _1755 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1769 = isnan(_1755);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1775 = _1771 || _1773;
    float _1777 = _1757;
    if (!_1775)
    {
        _1777 = 1.0;
    }
    float _1779 = _1777;
    bool _1781 = !_1775;
    float _1783 = _1779;
    if (!_1781)
    {
        bool _1785 = _1755 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1787 = isnan(_1755);
        bool _1789 = _1785 || _1787;
        bool _1791 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1793 = _1789 || _1791;
        if (!_1793)
        {
            float _1795 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1797 = _1755 + _1795;
            float _1799 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1801 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1799;
            float _1803 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1805 = _1803 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1807 = 1.0 / _1801;
            float _1809 = _1797 * _1807;
            float _1811 = fma(_1809, _1805, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1783 = _1811;
            _1813 = true;
        }
        else
        {
            bool _1815 = _1755 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1817 = isnan(_1755);
            bool _1819 = _1815 || _1817;
            bool _1821 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1823 = _1819 || _1821;
            if (!_1823)
            {
                float _1825 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1827 = _1755 + _1825;
                float _1829 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1831 = _1829 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1833 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1835 = _1833 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1837 = 1.0 / _1831;
                float _1839 = _1827 * _1837;
                float _1841 = fma(_1839, _1835, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1783 = _1841;
                _1813 = true;
            }
            else
            {
                _1783 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1813 = false;
    float _1843 = _1783;
    float _1845 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1847 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1849 = _1715 + _1847;
    float _1851 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1853 = _1721 + _1851;
    float _1855 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1857 = _1723 + _1855;
    float _1859 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1845);
    float _1861 = fma(_1849, _1843, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1863 = fma(_1853, _1843, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1865 = fma(_1857, _1843, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1867 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1859);
    float _1869 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1871 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1873 = _1861 + _1871;
    float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1877 = _1863 + _1875;
    float _1879 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1881 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1869);
    float _1883 = _1873 * _1873;
    float _1885 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1887 = _1865 + _1885;
    float _1889 = 1.0 / _1879;
    float _1891 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1881);
    float _1893 = fma(_1877, _1877, _1883);
    float _1895 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1897 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1899 = fma(_1887, _1887, _1893);
    float _1901 = _1649 + _1895;
    float _1903 = _1897 + _1879;
    float _1905 = rsqrt(_1899);
    float _1907 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1909 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1911 = _1903 * _1889;
    float _1913 = _1911 * 0.5;
    float _1915 = fma(_1505, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1907);
    float _1917 = sqrt(_1899);
    float _1919 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1909);
    float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1923 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1921);
    float _1925 = fma(_1565, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1915);
    float _1927 = fma(_1565, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1929 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1919);
    float _1931 = _1925 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1933 = 1.0 / _1923;
    float _1935 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1937 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1939 = _1877 * _1935;
    float _1941 = _1887 * _1935;
    float _1943 = trunc(_1931);
    int _1945 = int(_1943);
    float _1947 = _1939 * _1939;
    float _1949 = _1941 * _1941;
    float _1951 = _1947 + _1949;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1955 = _1933 * _1953;
    float _1957 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1959 = sqrt(_1951);
    bool _1961 = _1955 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1963 = fma(_1505, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1957);
    bool _1965 = _1955 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1967 = fma(_1565, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1963);
    float _1969 = floor(_1927);
    float _1971 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1973 = !_1961;
    int _1975 = _1973 ? 0 : 1;
    int _1977 = 2;
    int _1979 = as_type<int>(_1873);
    float _1981 = _1939;
    float _1983 = _1941;
    float _1985 = _1947;
    float _1987 = _1949;
    float _1989 = _1955;
    if (!_1961)
    {
        _1977 = 1;
    }
    int _1991 = _1977;
    float _1993 = trunc(_1971);
    int _1995 = int(_1993);
    int _1997 = _1991;
    if (!_1965)
    {
        _1997 = _1975;
    }
    int _1999 = _1997;
    bool _2001 = _1959 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2005 = _1959 + _2003;
    int _2007 = _1999 << 6;
    float _2009 = -_1969;
    float _2011 = _1927 + _2009;
    int _2013 = _2007 + 96;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    uint _2017 = uint(int(uint(int(_2015)) >> uint(2)));
    int _2019 = int(_2015) & 3;
    float _2021 = (*spvDescriptorSet0.vp_c15)._m0[int(_2017)][_2019];
    int _2023 = int(_2015) + 1;
    uint _2025 = uint(int(uint(_2023) >> uint(2)));
    int _2027 = _2023 & 3;
    float _2029 = (*spvDescriptorSet0.vp_c15)._m0[int(_2025)][_2027];
    float _2031 = _1729;
    float _2033 = _2005;
    if (_2001)
    {
        float _2035 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2031 = _2035;
    }
    float _2037 = _2031;
    int _2039 = _2007 + 104;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    uint _2043 = uint(int(uint(int(_2041)) >> uint(2)));
    int _2045 = int(_2041) & 3;
    float _2047 = (*spvDescriptorSet0.vp_c15)._m0[int(_2043)][_2045];
    int _2049 = int(_2041) + 1;
    uint _2051 = uint(int(uint(_2049) >> uint(2)));
    int _2053 = _2049 & 3;
    float _2055 = (*spvDescriptorSet0.vp_c15)._m0[int(_2051)][_2053];
    if (_2001)
    {
        float _2057 = _2005 * _2037;
        _2033 = _2057;
    }
    float _2059 = _2033;
    int _2061 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2063 = _1945 + _2061;
    int _2065 = _2063 + 1;
    float _2067 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2001)
    {
        float _2069 = _2059 * 0.15915493667125701904296875;
        _815 = _2069;
    }
    float _2071 = _815;
    int _2073 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2075 = _1995 + _2073;
    int _2077 = _2075 + 1;
    float _2079 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2067);
    float _2081 = _313;
    if (_2001)
    {
        float _2083 = _2071 * 6.283185482025146484375;
        float _2085 = cos(_2083);
        _2081 = _2085;
    }
    float _2087 = _2081;
    bool _2089 = _2077 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2091 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2079);
    int _2093 = _2077 | _2065;
    float _2095 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2097 = _2093 < 0;
    bool _2099 = _2097 || _2089;
    float _2101 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2103 = _849;
    if (_2001)
    {
        float _2105 = _2071 * 6.283185482025146484375;
        float _2107 = sin(_2105);
        _2103 = _2107;
    }
    float _2109 = _2103;
    float _2111 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2113 = _2065 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2115 = _2113 || _2099;
    float _2117 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2119 = precise::max(0.0, _2101);
    float _2121 = -_2117;
    float _2123 = fma(_2121, _2111, 1.0);
    float _2125 = _2091;
    if (_2001)
    {
        float _2127 = rsqrt(_1951);
        _2125 = _2127;
    }
    float _2129 = _2125;
    float _2131 = -_1935;
    float _2133 = -_2119;
    float _2135 = fma(_1873, _2131, _2133);
    float _2137 = _1901 * _2029;
    float _2139 = _2029;
    float _2141 = _2137;
    float _2143 = _2135;
    if (_2001)
    {
        float _2145 = _2135 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2139 = _2145;
    }
    float _2147 = _2139;
    float _2149 = fma(_1505, _2021, _2137);
    if (!_2115)
    {
        int _2151 = _2065 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2153 = _2151 + _2077;
        _1979 = _2153;
    }
    int _2155 = _1979;
    if (_2001)
    {
        float _2157 = _2087 + (-1.0);
        _2141 = _2157;
    }
    float _2159 = _2141;
    int _2161 = _2007 + 48;
    uint _2163 = uint(int(uint(_2161) >> uint(2)));
    uint _2165 = uint(int(uint(int(_2163)) >> uint(2)));
    int _2167 = int(_2163) & 3;
    float _2169 = (*spvDescriptorSet0.vp_c15)._m0[int(_2165)][_2167];
    int _2171 = int(_2163) + 1;
    uint _2173 = uint(int(uint(_2171) >> uint(2)));
    int _2175 = _2171 & 3;
    float _2177 = (*spvDescriptorSet0.vp_c15)._m0[int(_2173)][_2175];
    float _2179 = _2109;
    float _2181 = _2159;
    if (_2001)
    {
        float _2183 = fma(_2109, _2147, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2179 = _2183;
    }
    float _2185 = _2179;
    float _2187 = fma(_1565, _2047, _2149);
    if (_2001)
    {
        float _2189 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2181 = _2189;
    }
    float _2191 = _2181;
    float _2193 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (!_2115)
    {
        int _2195 = _2155 << 2;
        _1629 = _2195;
    }
    int _2197 = _1629;
    float _2199 = _2129;
    int _2201 = _2197;
    if (_2001)
    {
        float _2203 = _2129 * _2185;
        _2199 = _2203;
    }
    float _2205 = _2199;
    if (_2001)
    {
        float _2207 = fma(_2135, _2087, _2191);
        _2143 = _2207;
    }
    float _2209 = _2143;
    int _2211 = _2007 + 56;
    uint _2213 = uint(int(uint(_2211) >> uint(2)));
    uint _2215 = uint(int(uint(int(_2213)) >> uint(2)));
    int _2217 = int(_2213) & 3;
    float _2219 = (*spvDescriptorSet0.vp_c15)._m0[int(_2215)][_2217];
    int _2221 = int(_2213) + 1;
    uint _2223 = uint(int(uint(_2221) >> uint(2)));
    int _2225 = _2221 & 3;
    float _2227 = (*spvDescriptorSet0.vp_c15)._m0[int(_2223)][_2225];
    float _2229 = fma(_1505, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_2001)
    {
        float _2231 = _1939 * _2205;
        _1981 = _2231;
    }
    float _2233 = _1981;
    if (_2001)
    {
        float _2235 = _1941 * _2205;
        _1983 = _2235;
    }
    float _2237 = _1983;
    float _2239 = _2187 + _2055;
    if (!_2115)
    {
        uint _2241 = uint(int(uint(_2155) >> uint(2)));
        _1631 = int(_2241);
    }
    int _2243 = _1631;
    if (_2001)
    {
        float _2245 = _2233 * _2233;
        _1985 = _2245;
    }
    float _2247 = _1985;
    if (_2001)
    {
        float _2249 = _2237 * _2237;
        _1987 = _2249;
    }
    float _2251 = _1987;
    int _2253 = _2007 + 64;
    uint _2255 = uint(int(uint(_2253) >> uint(2)));
    uint _2257 = uint(int(uint(int(_2255)) >> uint(2)));
    int _2259 = int(_2255) & 3;
    float _2261 = (*spvDescriptorSet0.vp_c15)._m0[int(_2257)][_2259];
    int _2263 = int(_2255) + 1;
    uint _2265 = uint(int(uint(_2263) >> uint(2)));
    int _2267 = _2263 & 3;
    float _2269 = (*spvDescriptorSet0.vp_c15)._m0[int(_2265)][_2267];
    if (!_2115)
    {
        int _2271 = 12 & _2197;
        _2201 = _2271;
    }
    int _2273 = _2201;
    float _2275 = fma(_2209, _2209, _2247);
    float _2277 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2279 = 1.0 / _2239;
    int _2281 = _2273;
    if (!_2115)
    {
        int _2283 = _2243 << 4;
        int _2285 = _2283 + _2273;
        _2281 = _2285;
    }
    int _2287 = _2281;
    float _2289 = _2275 + _2251;
    float _2291 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2277);
    int _2293 = _2007 + 72;
    uint _2295 = uint(int(uint(_2293) >> uint(2)));
    uint _2297 = uint(int(uint(int(_2295)) >> uint(2)));
    int _2299 = int(_2295) & 3;
    float _2301 = (*spvDescriptorSet0.vp_c15)._m0[int(_2297)][_2299];
    int _2303 = int(_2295) + 1;
    uint _2305 = uint(int(uint(_2303) >> uint(2)));
    int _2307 = _2303 & 3;
    float _2309 = (*spvDescriptorSet0.vp_c15)._m0[int(_2305)][_2307];
    float _2311 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2193);
    float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2315 = fma(_1917, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2313);
    float _2317 = precise::clamp(_2315, 0.0, 1.0);
    float _2319 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2291);
    float _2321 = rsqrt(_2289);
    float _2323 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2311);
    float _2325 = -_2317;
    float _2327 = _2325 + 1.0;
    float _2329 = _2319 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _2331 = _2007 + 80;
    uint _2333 = uint(int(uint(_2331) >> uint(2)));
    uint _2335 = uint(int(uint(int(_2333)) >> uint(2)));
    int _2337 = int(_2333) & 3;
    float _2339 = (*spvDescriptorSet0.vp_c15)._m0[int(_2335)][_2337];
    int _2341 = int(_2333) + 1;
    uint _2343 = uint(int(uint(_2341) >> uint(2)));
    int _2345 = _2341 & 3;
    float _2347 = (*spvDescriptorSet0.vp_c15)._m0[int(_2343)][_2345];
    float _2349 = _2323 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2351 = _2329 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2353 = abs(_2327);
    float _2355 = log2(_2353);
    float _2357 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2351);
    int _2359 = _2007 + 88;
    uint _2361 = uint(int(uint(_2359) >> uint(2)));
    uint _2363 = uint(int(uint(int(_2361)) >> uint(2)));
    int _2365 = int(_2361) & 3;
    float _2367 = (*spvDescriptorSet0.vp_c15)._m0[int(_2363)][_2365];
    int _2369 = int(_2361) + 1;
    uint _2371 = uint(int(uint(_2369) >> uint(2)));
    int _2373 = _2369 & 3;
    float _2375 = (*spvDescriptorSet0.vp_c15)._m0[int(_2371)][_2373];
    float _2377 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2357);
    float _2379 = _2321 * _2233;
    float _2381 = floor(_2229);
    float _2383 = _2321 * _2209;
    float _2385 = _1901 * _2177;
    float _2387 = _2357;
    if (!_2115)
    {
        int _2389 = _2287 + 400;
        uint _2391 = uint(int(uint(_2389) >> uint(2)));
        uint _2393 = uint(int(uint(int(_2391)) >> uint(2)));
        int _2395 = int(_2391) & 3;
        float _2397 = (*spvDescriptorSet0.vp_c15)._m0[int(_2393)][_2395];
        _2387 = _2397;
    }
    float _2399 = _2387;
    float _2401 = _2379 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2403 = _2321 * _2237;
    float _2405 = fma(_1505, _2169, _2385);
    float _2407 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2377);
    float _2409 = log2(_2123);
    float _2411 = fma(_1565, _2219, _2405);
    float _2413 = _2411 + _2227;
    float _2415 = -_2401;
    float _2417 = fma(_2383, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2415);
    float _2419 = -_2381;
    float _2421 = _2229 + _2419;
    float _2423 = _1901 * _2269;
    float _2425 = _2413 * _2279;
    float _2427 = -_2403;
    float _2429 = fma(_2427, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2417);
    float _2431 = 1.0 / _2407;
    float _2433 = fma(_1505, _2261, _2423);
    float _2435 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2437 = _2425 >= 0.0;
    float _2439 = _2409 * 0.693147182464599609375;
    float _2441 = fma(_1565, _2301, _2433);
    float _2443 = fma(_2429, -0.5, 0.5);
    bool _2445 = _2425 <= 1.0;
    bool _2447 = _2445 && _2437;
    float _2449 = exp2(_2435);
    float _2451 = _2441 + _2309;
    float _2453 = _2451 * _2279;
    float _2455 = _1901 * _2347;
    float _2457 = _2329 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2459 = sqrt(_2443);
    bool _2461 = _2453 >= 0.0;
    bool _2463 = _2461 && _2447;
    float _2465 = fma(_1505, _2339, _2455);
    float _2467 = fma(_2429, 0.5, 0.5);
    float _2469 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2457);
    bool _2471 = _2453 <= 1.0;
    bool _2473 = _2471 && _2463;
    float _2475 = fma(_1565, _2367, _2465);
    float _2477 = fma(_2467, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2479 = _2403;
    float _2481 = _2467;
    if (!_2115)
    {
        float _2483 = floor(_1931);
        _2479 = _2483;
    }
    float _2485 = _2479;
    float _2487 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2469);
    float _2489 = _2475 + _2375;
    float _2491 = fma(_2467, _2477, -0.212114393711090087890625);
    float _2493 = _2329 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2495 = _2383 + 1.0;
    float _2497 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2487);
    float _2499 = fma(_2467, _2491, 1.570728778839111328125);
    float _2501 = _2429;
    float _2503 = _2495;
    float _2505 = _2497;
    if (!_2115)
    {
        float _2507 = floor(_1971);
        _2501 = _2507;
    }
    float _2509 = _2501;
    float _2511 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2493);
    if (_2473)
    {
        float _2513 = float(_1999);
        _2481 = _2513;
    }
    float _2515 = _2481;
    float _2517 = _2459 * 0.636619746685028076171875;
    float _2519 = -_2383;
    float _2521 = fma(_2449, _2495, _2519);
    float _2523 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2511);
    float _2525 = _2497 * _2431;
    float _2527 = -_2499;
    float _2529 = fma(_2517, _2527, 1.0);
    float _2531 = _2475;
    if (!_2115)
    {
        float _2533 = rint(_2399);
        float _2535 = precise::max(_2533, 0.0);
        uint _2537 = uint(_2535);
        uint _2539 = clamp(_2537, 0u, 65535u);
        _2531 = as_type<float>(_2539);
    }
    float _2541 = _2531;
    float _2543 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2523);
    float _2545 = _2485;
    if (!_2115)
    {
        float _2547 = -_2485;
        float _2549 = _1931 + _2547;
        _2545 = _2549;
    }
    float _2551 = _2545;
    float _2553 = _2489 * _2279;
    float _2555 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2557 = _2543 * _2431;
    float _2559 = fma(_2525, 0.5, 0.5);
    float _2561 = fma(_2521, 0.5, 0.5);
    float _2563 = _2515;
    if (_2473)
    {
        float _2565 = rint(_2515);
        float _2567 = precise::max(_2565, 0.0);
        uint _2569 = uint(_2567);
        uint _2571 = clamp(_2569, 0u, 65535u);
        _2563 = as_type<float>(_2571);
    }
    float _2573 = _2563;
    if (!_2115)
    {
        float _2575 = -_2509;
        float _2577 = _1971 + _2575;
        _2503 = _2577;
    }
    float _2579 = _2503;
    float _2581 = fma(_2557, -0.5, 0.5);
    float2 _6944 = float2(_2421, _2011);
    float _2583 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6944, float2(0.0), isnan(_6944)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6944, float2(0.0), isnan(_6944)), level(0.0)).x;
    float _2585 = _2541;
    if (!_2115)
    {
        float3 _6961 = float3(_2579, _2551, float(as_type<int>(_2541)));
        float3 _6965 = select(_6961, float3(0.0), isnan(_6961));
        float _2587 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6965.xy, uint(rint(_6965.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6965.xy, uint(rint(_6965.z)), level(0.0)).x;
        _2585 = _2587;
    }
    float _2589 = _2585;
    float _2591 = _2573;
    if (_2473)
    {
        float3 _6980 = float3(_2425, _2453, float(as_type<int>(_2573)));
        float3 _6982 = select(_6980, float3(0.0), isnan(_6980));
        float _2593 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6982.xy, uint(rint(_6982.z)), _2553, level(0.0));
        _2591 = _2593;
    }
    float _2595 = _2591;
    float3 _6992 = float3(_2559, _2581, _2555);
    float _2597 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6992, float3(0.0), isnan(_6992)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6992, float3(0.0), isnan(_6992)), level(0.0)).x;
    float3 _7001 = float3(_2559, _2581, _2555);
    float4 _2599 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7001, float3(0.0), isnan(_7001)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7001, float3(0.0), isnan(_7001)), level(0.0)).xyzw;
    float _2601 = _2599.x;
    float _2603 = _2599.y;
    float _2605 = _2599.z;
    float _2607 = _2599.w;
    float2 _7017 = float2(_2529, _2561);
    float3 _2611 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7017, float2(0.0), isnan(_7017)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7017, float2(0.0), isnan(_7017)), level(0.0)).xyz;
    float _2613 = _2611.x;
    float _2615 = _2611.y;
    float _2617 = _2611.z;
    float _2619 = abs(_1955);
    float _2621 = log2(_2619);
    float _2623 = _2329 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_89.x = _1505;
    float _2625 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2627 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2623);
    out.m_89.z = _1565;
    float _2629 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2627);
    float _2631 = exp2(_2625);
    float _2633 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2629);
    float _2635 = _2621 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2637 = _2633 + _2407;
    out.gl_Position.x = _2497;
    out.gl_Position.y = _2543;
    out.gl_Position.z = _2633;
    out.gl_Position.w = _2407;
    float _2639 = exp2(_2635);
    float _2641 = _2637 * 0.5;
    bool _2643 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2645 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2647 = _2643 || _2645;
    bool _2649 = isnan(0.5);
    bool _2651 = _2647 || _2649;
    out.m_91.z = _2641;
    out.m_91.w = _2407;
    float _2653 = fma(_2639, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2655 = precise::clamp(_2653, 0.0, 1.0);
    float _2657 = fma(_2655, -2.0, 3.0);
    float _2659 = _2655 * _2655;
    float _2661 = _2659 * _2657;
    bool _2663 = _1955 <= 8000.0;
    bool _2665 = isnan(_1955);
    bool _2667 = _2663 || _2665;
    bool _2669 = isnan(8000.0);
    bool _2671 = _2667 || _2669;
    float _2673 = float(_2671);
    float _2675 = -_2661;
    float _2677 = _2675 + 1.0;
    float _2679 = fma(_2677, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2661);
    float _2681 = _2673 * _2679;
    float _2683 = _2673;
    if (_2651)
    {
        _2683 = 1.0;
    }
    float _2685 = _2683;
    float _2687 = _2685;
    float _2689 = _2589;
    if (!_2651)
    {
        float _2691 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2693 = _2691 * 0.15915493667125701904296875;
        float _2695 = _2693 * 6.283185482025146484375;
        float _2697 = cos(_2695);
        float _2699 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2701 = _2699 * 0.15915493667125701904296875;
        float _2703 = _2693 * 6.283185482025146484375;
        float _2705 = sin(_2703);
        float _2707 = 1.0 / _2697;
        float _2709 = _2701 * 6.283185482025146484375;
        float _2711 = cos(_2709);
        float _2713 = _2705 * _2707;
        float _2715 = _2701 * 6.283185482025146484375;
        float _2717 = sin(_2715);
        float _2719 = _2711 * _2713;
        float _2721 = 1.0 / _2719;
        float _2723 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2725 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2723;
        float _2727 = 1.0 / _2725;
        float _2729 = _2717 * _2721;
        float _2731 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2733 = fma(_1955, _2729, _2731);
        float _2735 = _2733 * _2727;
        float _2737 = precise::clamp(_2735, 0.0, 1.0);
        _2505 = _2721;
        _2687 = _2737;
    }
    float _2739 = _2505;
    float _2741 = _2687;
    float _2743 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2745 = -_2583;
    float _2747 = _2745 + 1.0;
    float _2749 = -_2631;
    float _2751 = _2749 + 1.0;
    float _2753 = _2739;
    if (!_2473)
    {
        _2753 = 1.0;
    }
    float _2755 = _2753;
    float _2757 = _2747 * _2743;
    float _2759 = precise::clamp(_2757, 0.0, 1.0);
    float _2761 = _2755;
    if (_2473)
    {
        bool _2763 = _2595 >= _2553;
        bool _2765 = isnan(_2595);
        bool _2767 = _2763 || _2765;
        bool _2769 = isnan(_2553);
        bool _2771 = _2767 || _2769;
        float _2773 = float(_2771);
        _2761 = _2773;
    }
    float _2775 = _2761;
    float _2777 = _2751 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2779 = _2775;
    if (_2115)
    {
        _1989 = 1.0;
    }
    float _2781 = _1989;
    float _2783 = _2781;
    if (!_2115)
    {
        int _2785 = _2155 << 4;
        int _2787 = _2785 + 2048;
        uint _2789 = uint(int(uint(_2787) >> uint(2)));
        uint _2791 = uint(int(uint(int(_2789)) >> uint(2)));
        int _2793 = int(_2789) & 3;
        float _2795 = (*spvDescriptorSet0.vp_c15)._m0[int(_2791)][_2793];
        int _2797 = int(_2789) + 1;
        uint _2799 = uint(int(uint(_2797) >> uint(2)));
        int _2801 = _2797 & 3;
        float _2803 = (*spvDescriptorSet0.vp_c15)._m0[int(_2799)][_2801];
        int _2805 = _2787 + 8;
        uint _2807 = uint(int(uint(_2805) >> uint(2)));
        uint _2809 = uint(int(uint(int(_2807)) >> uint(2)));
        int _2811 = int(_2807) & 3;
        float _2813 = (*spvDescriptorSet0.vp_c15)._m0[int(_2809)][_2811];
        int _2815 = int(_2807) + 1;
        uint _2817 = uint(int(uint(_2815) >> uint(2)));
        int _2819 = _2815 & 3;
        float _2821 = (*spvDescriptorSet0.vp_c15)._m0[int(_2817)][_2819];
        float _2823 = _1901 * _2803;
        float _2825 = fma(_1505, _2795, _2823);
        float _2827 = fma(_1565, _2813, _2825);
        float _2829 = _2827 + _2821;
        float _2831 = precise::clamp(_2829, 0.0, 1.0);
        float _2833 = -_2831;
        float _2835 = _2833 + _2589;
        float _2837 = fma(_2835, 500.0, 1.5);
        float _2839 = exp2(_2837);
        float _2841 = 0.0 + _2839;
        float _2843 = precise::clamp(_2841, 0.0, 1.0);
        _2783 = _2843;
        _1633 = _2839;
    }
    float _2845 = _2783;
    float _2847 = _1633;
    float _2849 = _2775 * _2845;
    float _2851 = _2777 * _2597;
    float _2853 = -_2759;
    float _2855 = fma(_2853, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2857 = -_2777;
    float _2859 = _2857 + 1.0;
    out.m_93.x = _1863;
    out.m_93.y = _1861;
    out.m_93.z = _1865;
    float _2861 = _2607 * _2851;
    float _2863 = -_2849;
    float _2865 = fma(_2863, _2855, 1.0);
    float _2867 = precise::clamp(_2865, 0.0, 1.0);
    float _2869 = _2617 * _2851;
    float _2871 = _2607 * _2859;
    float _2873 = fma(_2613, _2861, _2601);
    float _2875 = fma(_2615, _2861, _2603);
    float _2877 = _2867 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2879 = fma(_2607, _2869, _2605);
    bool _2881 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2883 = isnan(_1917);
    bool _2885 = _2881 || _2883;
    bool _2887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2889 = _2885 || _2887;
    float _2891 = _2741 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _2877;
    out.m_97.x = _2873;
    out.m_97.y = _2875;
    out.m_97.z = _2879;
    out.m_97.w = _2871;
    float _2893 = _2859;
    float _2895 = _2847;
    float _2897 = _2861;
    float _2899 = _2867;
    if (!_2889)
    {
        _2893 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2901 = _2893;
    float _2903 = _2901;
    float _2905 = _2901;
    if (!_2889)
    {
        _2779 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2907 = _2779;
    float _2909 = _2907;
    float _2911 = _2907;
    if (!_2889)
    {
        _2689 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2913 = _2689;
    float _2915 = _2913;
    float _2917 = _2913;
    if (!_2889)
    {
        _2895 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2919 = _2895;
    float _2921 = _2919;
    float _2923 = _2919;
    if (!_2889)
    {
        _2897 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2925 = _2897;
    float _2927 = _2925;
    float _2929 = _2925;
    if (!_2889)
    {
        _2899 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2931 = _2899;
    bool _2933 = !_2889;
    float _2935 = _2931;
    float _2937 = _2931;
    if (!_2933)
    {
        bool _2939 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2941 = isnan(_1917);
        bool _2943 = _2939 || _2941;
        bool _2945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2947 = _2943 || _2945;
        if (!_2947)
        {
            float _2949 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2951 = _1917 + _2949;
            float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2955 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2953;
            float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2961 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2963 = _2961 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2965 = 1.0 / _2955;
            float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2969 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2973 = _2971 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2975 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2977 = _2975 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2979 = _2951 * _2965;
            float _2981 = precise::clamp(_2979, 0.0, 1.0);
            float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2985 = _2983 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2987 = fma(_2981, _2959, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2989 = fma(_2981, _2963, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2991 = fma(_2981, _2985, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2993 = fma(_2981, _2969, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2995 = fma(_2981, _2973, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2997 = fma(_2981, _2977, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2911 = _2989;
            _2929 = _2995;
            _2905 = _2987;
            _2923 = _2993;
            _2917 = _2991;
            _2937 = _2997;
            _2999 = true;
        }
        else
        {
            bool _3001 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3003 = isnan(_1917);
            bool _3005 = _3001 || _3003;
            bool _3007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3009 = _3005 || _3007;
            if (!_3009)
            {
                _2903 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3011 = _2903;
            _2905 = _3011;
            if (!_3009)
            {
                _2909 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3013 = _2909;
            _2911 = _3013;
            if (!_3009)
            {
                _2915 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3015 = _2915;
            _2917 = _3015;
            if (!_3009)
            {
                _2921 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3017 = _2921;
            _2923 = _3017;
            if (!_3009)
            {
                _2927 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3019 = _2927;
            _2929 = _3019;
            if (!_3009)
            {
                _2935 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3021 = _2935;
            bool _3023 = !_3009;
            _2937 = _3021;
            if (!_3023)
            {
                bool _3025 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3027 = isnan(_1917);
                bool _3029 = _3025 || _3027;
                bool _3031 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3033 = _3029 || _3031;
                if (!_3033)
                {
                    float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3037 = _1917 + _3035;
                    float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3041 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3039;
                    float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3049 = _3047 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3051 = 1.0 / _3041;
                    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3055 = _3053 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3059 = _3057 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3061 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3063 = _3061 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3065 = _3037 * _3051;
                    float _3067 = precise::clamp(_3065, 0.0, 1.0);
                    float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3071 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3073 = fma(_3067, _3045, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3075 = fma(_3067, _3049, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3077 = fma(_3067, _3071, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3079 = fma(_3067, _3055, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3081 = fma(_3067, _3059, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3083 = fma(_3067, _3063, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2911 = _3075;
                    _2929 = _3081;
                    _2905 = _3073;
                    _2923 = _3079;
                    _2917 = _3077;
                    _2937 = _3083;
                    _2999 = true;
                }
                else
                {
                    _2911 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2929 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2905 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2923 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2917 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2937 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2999 = false;
    float _3085 = _2911;
    float _3087 = _2929;
    float _3089 = _2905;
    float _3091 = _2923;
    float _3093 = _2917;
    float _3095 = _2937;
    float _3097 = fma(_1763, -0.5, 0.5);
    float _3099 = precise::clamp(_3097, 0.0, 1.0);
    float _3101 = -_3085;
    float _3103 = _3101 + _3087;
    float _3105 = _2891 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3107 = -_3089;
    float _3109 = _3107 + _3091;
    out.m_99.x = 0.0;
    float _3111 = fma(_3099, _3103, _3085);
    float _3113 = fma(_3099, _3109, _3089);
    out.m_63.x = _3105;
    float _3115 = -_3093;
    float _3117 = _3115 + _3095;
    float _3119 = _3111 * 0.586610972881317138671875;
    bool _3121 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3123 = fma(_3099, _3117, _3093);
    float _3125 = fma(_3113, 0.298911988735198974609375, _3119);
    bool _3127 = _2741 > 0.0;
    bool _3129 = isnan(_2741);
    bool _3131 = _3127 || _3129;
    bool _3133 = isnan(0.0);
    bool _3135 = _3131 || _3133;
    float _3137 = fma(_3123, 0.114477999508380889892578125, _3125);
    float _3139 = -_3137;
    float _3141 = _3113 + _3139;
    float _3143 = -_3137;
    float _3145 = _3111 + _3143;
    float _3147 = -_3137;
    float _3149 = _3123 + _3147;
    float _3151 = fma(_3141, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3137);
    float _3153 = fma(_3145, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3137);
    float _3155 = fma(_3149, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3137);
    bool _3157 = !_3121;
    if (!_3157)
    {
        float _3159 = -_1861;
        float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3163 = -_1863;
        float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3167 = -_1865;
        float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3171 = _3161 * _3161;
        float _3173 = fma(_3165, _3165, _3171);
        float _3175 = fma(_3169, _3169, _3173);
        float _3177 = sqrt(_3175);
        float _3179 = rsqrt(_3175);
        float _3181 = -_3177;
        float _3183 = _3181 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3185 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3187 = precise::clamp(_3185, 0.0, 1.0);
        float _3189 = _3165 * _3179;
        float _3191 = _3161 * _3179;
        float _3193 = abs(_3187);
        float _3195 = log2(_3193);
        float _3197 = _3169 * _3179;
        float _3199 = _3189 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3201 = _1763 * _3191;
        float _3203 = -_3191;
        float _3205 = -_3199;
        float _3207 = fma(_3203, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3205);
        float _3209 = fma(_1761, _3189, _3201);
        float _3211 = -_3197;
        float _3213 = fma(_3211, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3207);
        float _3215 = fma(_1765, _3197, _3209);
        float _3217 = precise::clamp(_3215, 0.0, 1.0);
        float _3219 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3221 = _3213 + _3219;
        float _3223 = _3195 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3225 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3227 = precise::clamp(_3225, 0.0, 1.0);
        float _3229 = exp2(_3223);
        float _3231 = _3229 * _3227;
        float _3233 = _3217 * _3231;
        float _3235 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3237 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3239 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _3235;
        out.m_99.y = _3237;
        out.m_99.z = _3239;
    }
    out.m_101.x = _3151;
    out.m_101.y = _3153;
    out.m_101.z = _3155;
    if (_3135)
    {
        return out;
    }
    out.m_63.x = 0.0;
    float _3241 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3241;
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
    out.dm_pad9 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2999 = false;
    bool _1813 = false;
    bool _1081 = false;
    bool _889 = false;
    bool _359 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_60.w;
    float _123 = trunc(_121);
    int _125 = int(_123);
    bool _129 = _125 >= 1;
    float _131 = 0.0;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    float _135 = _133;
    if (!_129)
    {
        out.m_63.x = 0.0;
    }
    int _137 = 0;
    if (!_129)
    {
        float _139 = _133 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3298 = as_type<float>(_141);
        out.gl_Position.z = _3298;
    }
    if (!_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.dm_pad9.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.dm_pad9.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.dm_pad9.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.dm_pad9.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_65.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _161 = 0.0;
    float _163 = _159;
    if (_155)
    {
        float _165 = float(_125);
        _161 = _165;
    }
    float _167 = _161;
    bool _169 = _159 >= _167;
    bool _171 = !_155;
    bool _173 = _169 || _171;
    if (_173)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _135;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    if (_173)
    {
        float _177 = _175 * 5.0;
        _143 = as_type<int>(_177);
    }
    int _179 = _143;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3367 = as_type<float>(_179);
        out.gl_Position.z = _3367;
    }
    if (_173)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.dm_pad9.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.dm_pad9.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.dm_pad9.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.dm_pad9.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _181 = in.m_67.x;
    float _183 = in.m_67.y;
    float _185 = in.m_67.z;
    float _187 = in.m_69.x;
    float _189 = in.m_69.y;
    float _191 = in.m_69.z;
    float _193 = in.m_71.x;
    float _195 = in.m_71.y;
    float _197 = in.m_71.z;
    float _199 = _181 * _181;
    float _201 = _183 * _183;
    float _203 = _185 * _185;
    float _205 = fma(_187, _187, _199);
    float _207 = fma(_189, _189, _201);
    float _209 = fma(_191, _191, _203);
    float _211 = fma(_193, _193, _205);
    float _213 = fma(_195, _195, _207);
    float _215 = fma(_197, _197, _209);
    float _217 = sqrt(_211);
    float _219 = sqrt(_213);
    float _221 = sqrt(_215);
    bool _223 = _217 > 0.0;
    bool _225 = _219 > 0.0;
    float _227 = _219;
    float _229 = _217;
    float _231 = _211;
    float _233 = _215;
    if (_223)
    {
        float _235 = rsqrt(_211);
        _227 = _235;
    }
    float _237 = _227;
    float _239 = 0.0;
    float _241 = 0.0;
    if (!_223)
    {
        _239 = 0.0;
        _241 = 0.0;
    }
    float _243 = _239;
    float _245 = _241;
    bool _247 = _221 > 0.0;
    float _249 = 0.0;
    float _251 = _245;
    float _253 = _243;
    if (!_223)
    {
        _249 = 0.0;
    }
    float _255 = _249;
    float _257 = 0.0;
    float _259 = _255;
    if (!_225)
    {
        _257 = 0.0;
    }
    float _261 = _257;
    float _263 = 0.0;
    float _265 = _261;
    if (_225)
    {
        float _267 = rsqrt(_213);
        _263 = _267;
    }
    float _269 = _263;
    float _271 = 0.0;
    if (!_225)
    {
        _271 = 0.0;
    }
    float _273 = _271;
    float _275 = _273;
    if (!_225)
    {
        _229 = 0.0;
    }
    float _277 = _229;
    float _279 = _277;
    if (!_247)
    {
        _231 = 0.0;
    }
    float _281 = _231;
    float _283 = _221;
    float _285 = _281;
    if (_247)
    {
        float _287 = rsqrt(_215);
        _283 = _287;
    }
    float _289 = _283;
    float _291 = _237;
    if (_223)
    {
        float _293 = _237 * _187;
        _259 = _293;
    }
    float _295 = _259;
    if (_223)
    {
        float _297 = _237 * _181;
        _251 = _297;
    }
    float _299 = _251;
    if (_223)
    {
        float _301 = _237 * _193;
        _253 = _301;
    }
    float _303 = _253;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_247)
    {
        _291 = 0.0;
    }
    float _307 = _291;
    float _309 = _307;
    if (_225)
    {
        float _311 = _269 * _189;
        _265 = _311;
    }
    float _313 = _265;
    if (!_247)
    {
        _233 = 0.0;
    }
    float _315 = _233;
    float _317 = _315;
    if (_225)
    {
        float _319 = _269 * _183;
        _275 = _319;
    }
    float _321 = _275;
    if (_225)
    {
        float _323 = _269 * _195;
        _279 = _323;
    }
    float _325 = _279;
    if (_247)
    {
        float _327 = _289 * _191;
        _317 = _327;
    }
    float _329 = _317;
    if (_247)
    {
        float _331 = _289 * _185;
        _309 = _331;
    }
    float _333 = _309;
    if (_247)
    {
        float _335 = _289 * _197;
        _285 = _335;
    }
    float _337 = _285;
    bool _339 = !_305;
    float _357;
    if (!_339)
    {
        float _341 = in.m_73.x;
        float _343 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _345 = _341 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _347 = fma(_345, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _349 = _347 * _343;
        float _351 = floor(_349);
        float _353 = -_351;
        float _355 = _349 + _353;
        _357 = _355;
        _359 = true;
    }
    else
    {
        float _361 = float(_125);
        float _363 = 1.0 / _361;
        float _365 = _159 * _363;
        _357 = _365;
    }
    _359 = false;
    float _367 = _357;
    int _369 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _371 = _369;
    int _373 = 0;
    int _375 = _116(_371, _373, (*spvDescriptorSet0.support_buffer));
    float _377 = in.m_73.x;
    float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _381 = in.m_73.y;
    float _383 = in.m_75.z;
    float _385 = -_379;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _389 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.0166666693985462188720703125, _377);
    float _391 = fma(_387, _381, _379);
    float _393 = _389 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _395 = trunc(_383);
    int _397 = int(_395);
    float _399 = _393 * _391;
    float _401 = float(_375);
    int _403 = abs(_375);
    bool _405 = _375 == 0;
    float _407 = _399 * _401;
    float _409 = float(uint(_403));
    float _411 = trunc(_407);
    int _413 = int(_411);
    float _415 = 1.0 / _409;
    int _417 = abs(_413);
    uint _420 = uint(int(uint(_413) >> uint(31)));
    float _422 = float(uint(_417));
    int _424 = ~int(_420);
    int _426 = _424 + 1;
    int _428 = as_type<int>(_415) + (-2);
    float _430 = as_type<float>(_428) * _422;
    float _432 = trunc(_430);
    float _434 = precise::max(_432, 0.0);
    uint _436 = uint(_434);
    int _438 = ~int(_436);
    int _440 = _438 + 1;
    int _442 = _440 * _403;
    int _444 = _442 + _417;
    float _446 = float(uint(_444));
    float _448 = as_type<float>(_428) * _446;
    float _450 = trunc(_448);
    float _452 = precise::max(_450, 0.0);
    uint _454 = uint(_452);
    int _456 = int(_436) + int(_454);
    int _458 = ~_456;
    int _460 = _458 + 1;
    int _462 = _460 * _403;
    int _464 = _462 + _417;
    bool _466 = uint(_464) >= uint(_403);
    bool _468 = !_466;
    int _470 = _468 ? 0 : (-1);
    int _472 = ~_456;
    int _474 = _472 + _470;
    int _476 = _474 + 1;
    int _478 = _476 * _403;
    int _480 = _478 + _417;
    int _482 = _480 ^ _426;
    int _484 = ~_426;
    int _486 = _484 + _482;
    int _488 = _486 + 1;
    bool _490 = !_405;
    int _492 = _490 ? _488 : (-1);
    int _494 = _492;
    int _496 = 0;
    int _498 = _117(_494, _496, (*spvDescriptorSet0.support_buffer));
    int _500 = _397;
    int _502 = 0;
    int _504 = _117(_500, _502, (*spvDescriptorSet0.support_buffer));
    float4 _507 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_498, _504)), 0).xyzw;
    float _509 = _507.x;
    float _511 = _507.y;
    float _513 = _507.z;
    float _515 = _507.w;
    float _517 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _519 = in.m_75.x;
    bool _521 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _523 = isnan(_367);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = _517 * _377;
    int _535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _537 = _535 != 0;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _541 = _539 != 0;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _543;
    float _547 = trunc(_533);
    int _549 = int(_547);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _553 = _367 + _551;
    bool _555 = _367 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _557 = isnan(_367);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    bool _567 = _377 > 0.5;
    bool _569 = _567 && _537;
    bool _571 = _381 > 0.5;
    bool _573 = _571 && _541;
    float _575 = -_565;
    float _577 = _575 + 1.0;
    float _579 = 1.0 / _545;
    float _581 = _531 * _577;
    int _583 = _492 + 1;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _587 = -_531;
    float _589 = _587 + 1.0;
    int _591 = _549 << 4;
    int _593 = _591 + 1712;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _597 = _585 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _599 = uint(int(uint(_593) >> uint(2)));
    uint _601 = uint(int(uint(int(_599)) >> uint(2)));
    int _603 = int(_599) & 3;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[int(_601)][_603];
    int _607 = int(_599) + 1;
    uint _609 = uint(int(uint(_607) >> uint(2)));
    int _611 = _607 & 3;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[int(_609)][_611];
    float _615 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _617;
    float _621 = _553 * _579;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _625 = fma(_619, _621, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _627 = _593 + 8;
    uint _629 = uint(int(uint(_627) >> uint(2)));
    uint _631 = uint(int(uint(int(_629)) >> uint(2)));
    int _633 = int(_629) & 3;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[int(_631)][_633];
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _637;
    float _641 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _643;
    float _647 = _625 * _581;
    float _649 = fma(_639, _621, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _651 = fma(_645, _621, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    out.m_77.x = _597;
    out.m_77.y = _615;
    out.m_77.z = _641;
    float _653 = _649 * _581;
    float _655 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].y, _647);
    float _657 = _651 * _581;
    int _659 = abs(_583);
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _663 = _649;
    float _665 = _597;
    if (_537)
    {
        _663 = _519;
    }
    float _667 = _663;
    float _669 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[144].y, _655);
    uint _671 = uint(int(uint(_583) >> uint(31)));
    float _673 = _667;
    if (_569)
    {
        float _675 = -_667;
        float _677 = _675 + 1.0;
        _673 = _677;
    }
    float _679 = _673;
    float _681 = float(uint(_659));
    float _683 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].x, _653);
    float _685 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].z, _657);
    if (!_537)
    {
        _665 = _519;
    }
    float _687 = _665;
    float _689 = as_type<float>(_428) * _681;
    float _691 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[144].x, _683);
    float _693 = _687;
    if (_537)
    {
        _693 = _679;
    }
    float _695 = _693;
    float _697 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[144].z, _685);
    int _699 = ~int(_671);
    int _701 = _699 + 1;
    float _703 = trunc(_689);
    float _705 = precise::max(_703, 0.0);
    uint _707 = uint(_705);
    float _709 = _695 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _711 = _613 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _713 = _605 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _715 = _711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _713 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _721 = ~int(_707);
    int _723 = _721 + 1;
    float _725 = _635 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _727 = _723 * _403;
    int _729 = _727 + _659;
    float _731 = _725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _733 = float(uint(_729));
    out.m_79.x = _717;
    out.m_79.y = _715;
    out.m_79.z = _731;
    out.m_79.w = _661;
    float _735 = as_type<float>(_428) * _733;
    float _737 = trunc(_735);
    float _739 = precise::max(_737, 0.0);
    uint _741 = uint(_739);
    int _743 = int(_707) + int(_741);
    int _745 = ~_743;
    int _747 = _745 + 1;
    int _749 = _747 * _403;
    int _751 = _749 + _659;
    bool _753 = uint(_751) >= uint(_403);
    bool _755 = !_753;
    int _757 = _755 ? 0 : (-1);
    int _759 = ~_743;
    int _761 = _759 + _757;
    int _763 = _761 + 1;
    int _765 = _763 * _403;
    int _767 = _765 + _659;
    float _769 = in.m_75.y;
    int _771 = _767 ^ _701;
    int _773 = ~_701;
    int _775 = _773 + _771;
    int _777 = _775 + 1;
    bool _779 = !_405;
    int _781 = _779 ? _777 : (-1);
    float _783 = _769;
    if (_573)
    {
        float _785 = -_769;
        float _787 = _785 + 1.0;
        _783 = _787;
    }
    float _789 = _783;
    float _791 = _789 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _793 = _791 * _719;
    uint _795 = as_type<uint>(half2(float2(_515, 0.0)));
    uint _797 = extract_bits(_795, 0u, 8u);
    int _799 = int(_797) & 255;
    uint _801 = extract_bits(_795, 8u, 8u);
    int _803 = int(_801) & 255;
    int _805 = _803 << 8;
    int _807 = _799 | _805;
    bool _809 = _807 >= 32768;
    int _811 = _807 + (-1024);
    int _813 = _811;
    float _815 = _793;
    if (_809)
    {
        int _817 = ~_807;
        int _819 = _817 + 33792;
        int _821 = _819 + 1;
        _813 = _821;
    }
    int _823 = _813;
    int _825 = _823 + 30719;
    float _827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _829 = float(_825);
    float _831 = fma(_829, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _833 = abs(_831);
    float _835 = -_833;
    float _837 = _835 + 1.0;
    float _839 = abs(_831);
    float _841 = fma(_839, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _843 = as_type<int>(_837) + (-218103808);
    float _845 = abs(_831);
    float _847 = fma(_845, _841, -0.212114393711090087890625);
    float _849 = _709 * _827;
    bool _851 = _831 < 0.0;
    float _853 = float(_851);
    bool _855 = uint(_843) >= 1920991232u;
    float _857 = abs(_831);
    float _859 = fma(_857, _847, 1.570728778839111328125);
    bool _861 = !_855;
    float _887;
    if (!_861)
    {
        int _863 = as_type<int>(_837);
        int _865 = as_type<int>(_837);
        int _867 = _701;
        int _869 = 3680;
        int _871 = 0;
        int _873;
        int _875;
        int _877;
        int _879;
        int _881;
        int _883;
        int _885;
        _114(_863, _865, _867, _869, _871, _873, _875, _877, _879, _881, _883, _885, out.gl_Position, out.gl_PointSize);
        _887 = as_type<float>(_883);
        _889 = true;
    }
    else
    {
        float _891 = rsqrt(_837);
        float _893 = _837 * _891;
        float _895 = _891 * 0.5;
        float _897 = -_893;
        float _899 = 0.0 + _897;
        float _901 = fma(_895, _899, 0.5);
        float _903 = fma(_893, _901, _893);
        float _905 = -_903;
        float _907 = 0.0 + _905;
        float _909 = fma(_903, _907, _837);
        float _911 = fma(_895, _909, _903);
        _887 = _911;
    }
    _889 = false;
    float _913 = _887;
    int _915 = _781;
    int _917 = 0;
    int _919 = _117(_915, _917, (*spvDescriptorSet0.support_buffer));
    int _921 = _397;
    int _923 = 0;
    int _925 = _117(_921, _923, (*spvDescriptorSet0.support_buffer));
    float4 _927 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_919, _925)), 0).xyzw;
    float _929 = _927.x;
    float _931 = _927.y;
    float _933 = _927.z;
    float _935 = _927.w;
    float _937 = _859 * _913;
    float _939 = _853 * 2.0;
    float _941 = _829 * 3.883221149444580078125;
    float _943 = floor(_407);
    float _945 = -_939;
    float _947 = fma(_937, _945, _937);
    float _949 = _941 * 0.15915493667125701904296875;
    float _951 = fma(_853, 3.1415927410125732421875, _947);
    float _953 = _949 * 6.283185482025146484375;
    float _955 = cos(_953);
    float _957 = _951 * 0.15915493667125701904296875;
    float _959 = _957 * 6.283185482025146484375;
    float _961 = sin(_959);
    float _963 = -_943;
    float _965 = _407 + _963;
    float _967 = _961 * _955;
    float _969 = _949 * 6.283185482025146484375;
    float _971 = sin(_969);
    float _973 = _961 * _971;
    uint _975 = as_type<uint>(half2(float2(_935, 0.0)));
    float _977 = -_509;
    float _979 = _977 + _929;
    float _981 = -_513;
    float _983 = _981 + _933;
    uint _985 = extract_bits(_975, 0u, 8u);
    int _987 = int(_985) & 255;
    uint _989 = extract_bits(_975, 8u, 8u);
    int _991 = int(_989) & 255;
    int _993 = _991 << 8;
    int _995 = _987 | _993;
    float _997 = fma(_965, _979, _509);
    float _999 = fma(_965, _983, _513);
    bool _1001 = _995 >= 32768;
    int _1003 = _995 + (-1024);
    int _1005 = _1003;
    if (_1001)
    {
        int _1007 = ~_995;
        int _1009 = _1007 + 33792;
        int _1011 = _1009 + 1;
        _1005 = _1011;
    }
    int _1013 = _1005;
    int _1015 = _1013 + 30719;
    float _1017 = float(_1015);
    float _1019 = fma(_1017, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1021 = abs(_1019);
    float _1023 = -_1021;
    float _1025 = _1023 + 1.0;
    float _1027 = abs(_1019);
    float _1029 = fma(_1027, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1031 = _1019 < 0.0;
    float _1033 = float(_1031);
    int _1035 = as_type<int>(_1025) + (-218103808);
    float _1037 = abs(_1019);
    float _1039 = fma(_1037, _1029, -0.212114393711090087890625);
    bool _1041 = uint(_1035) >= 1920991232u;
    float _1043 = -_511;
    float _1045 = _1043 + _931;
    float _1047 = abs(_1019);
    float _1049 = fma(_1047, _1039, 1.570728778839111328125);
    float _1051 = fma(_965, _1045, _511);
    bool _1053 = !_1041;
    float _1079;
    if (!_1053)
    {
        int _1055 = as_type<int>(_1025);
        int _1057 = as_type<int>(_949);
        int _1059 = as_type<int>(_943);
        int _1061 = 4576;
        int _1063 = as_type<int>(_957);
        int _1065;
        int _1067;
        int _1069;
        int _1071;
        int _1073;
        int _1075;
        int _1077;
        _114(_1055, _1057, _1059, _1061, _1063, _1065, _1067, _1069, _1071, _1073, _1075, _1077, out.gl_Position, out.gl_PointSize);
        _1079 = as_type<float>(_1075);
        _1081 = true;
    }
    else
    {
        float _1083 = rsqrt(_1025);
        float _1085 = _1025 * _1083;
        float _1087 = _1083 * 0.5;
        float _1089 = -_1085;
        float _1091 = 0.0 + _1089;
        float _1093 = fma(_1087, _1091, 0.5);
        float _1095 = fma(_1085, _1093, _1085);
        float _1097 = -_1095;
        float _1099 = 0.0 + _1097;
        float _1101 = fma(_1095, _1099, _1025);
        float _1103 = fma(_1087, _1101, _1095);
        _1079 = _1103;
    }
    _1081 = false;
    float _1105 = _1079;
    float _1107 = in.m_73.x;
    float _1109 = in.m_73.y;
    float _1111 = in.m_73.z;
    float _1113 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1115 = log2(_1113);
    float _1117 = _1049 * _1105;
    float _1119 = _1017 * 3.883221149444580078125;
    float _1121 = -_831;
    float _1123 = _1121 + _1019;
    float _1125 = _1115 * _159;
    float _1127 = exp2(_1125);
    float _1129 = _1111 * 2.0;
    float _1131 = _1107 * 2.0;
    float _1133 = _1109 * 2.0;
    float _1135 = floor(_1129);
    float _1137 = floor(_1131);
    float _1139 = -_1127;
    float _1141 = _1139 + 1.0;
    float _1143 = floor(_1133);
    bool _1145 = _1135 > 0.0;
    bool _1147 = _1135 >= 0.0;
    bool _1149 = isnan(_1135);
    bool _1151 = _1147 || _1149;
    bool _1153 = isnan(0.0);
    bool _1155 = _1151 || _1153;
    int _1157 = _1155 ? 0 : 1;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1161 = _1159 != 0;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1165 = _1163 != 0;
    int _1167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1169 = _1167 != 0;
    int _1171 = ~_1157;
    int _1173 = _1171 + 1;
    int _1175 = _1173 + 1;
    bool _1177 = _1137 > 0.0;
    int _1179 = _1175;
    if (!_1145)
    {
        int _1181 = ~_1157;
        int _1183 = _1181 + 1;
        _1179 = _1183;
    }
    int _1185 = _1179;
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1189 = 1.0 + _1187;
    bool _1191 = _1137 >= 0.0;
    bool _1193 = isnan(_1137);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan(0.0);
    bool _1199 = _1195 || _1197;
    bool _1201 = _1143 > 0.0;
    float _1203 = 1.0 / _1189;
    bool _1205 = _1143 >= 0.0;
    bool _1207 = isnan(_1143);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan(0.0);
    bool _1213 = _1209 || _1211;
    float _1215 = in.m_81.x;
    float _1217 = in.m_81.y;
    float _1219 = in.m_81.z;
    bool _1221 = !_1161;
    int _1223 = _1221 ? 0 : 1;
    int _1225 = _1199 ? 0 : 1;
    bool _1227 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1229 = isnan(1.0);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1235 = _1231 || _1233;
    int _1237 = abs(_1223);
    float _1239 = _1109 + _1107;
    bool _1241 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1243 = isnan(0.0);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1237);
    float _1253 = _1239 + (-1.0);
    float _1255 = float(_1185);
    float _1257 = _1249 ? _1141 : 0.0;
    float _1259 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1261 = _1213 ? 0 : 1;
    float _1263 = _1251 * _1255;
    float _1265 = _1107 + (-0.5);
    if (_1235)
    {
        float _1267 = _1257 * _1203;
        _163 = _1267;
    }
    float _1269 = _163;
    int _1271 = ~_1261;
    int _1273 = _1271 + 1;
    int _1275 = _1273 + 1;
    float _1277 = _1263 * (-2.0);
    bool _1279 = !_1169;
    int _1281 = _1279 ? 0 : 1;
    float _1283 = _1111 + _1107;
    bool _1285 = !_1165;
    int _1287 = _1285 ? 0 : 1;
    float _1289 = fma(_1277, _1215, _1215);
    int _1291 = abs(_1281);
    float _1293 = fma(_1259, _1277, _1259);
    int _1295 = _1275;
    if (!_1201)
    {
        int _1297 = ~_1261;
        int _1299 = _1297 + 1;
        _1295 = _1299;
    }
    int _1301 = _1295;
    float _1303 = fma(_1265, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1289);
    float _1305 = _1283 + (-1.0);
    int _1307 = abs(_1287);
    float _1309 = fma(_1293, _1269, _1303);
    float _1311 = float(_1291);
    float _1313 = float(_1301);
    float _1315 = _1309 * 0.15915493667125701904296875;
    int _1317 = ~_1225;
    int _1319 = _1317 + 1;
    int _1321 = _1319 + 1;
    float _1323 = _1311 * _1313;
    int _1325 = _1321;
    if (!_1177)
    {
        int _1327 = ~_1225;
        int _1329 = _1327 + 1;
        _1325 = _1329;
    }
    int _1331 = _1325;
    float _1333 = fma(_1305, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1335 = float(_1307);
    float _1337 = _1323 * (-2.0);
    float _1339 = float(_1331);
    float _1341 = _1111 + (-0.5);
    float _1343 = _1111 + _1109;
    float _1345 = fma(_1337, _1219, _1219);
    float _1347 = fma(_1333, _1337, _1333);
    float _1349 = _1335 * _1339;
    float _1351 = _1343 + (-1.0);
    float _1353 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1345);
    float _1355 = in.m_60.x;
    float _1357 = in.m_60.y;
    float _1359 = in.m_60.z;
    float _1361 = _1349 * (-2.0);
    float _1363 = _1109 + (-0.5);
    float _1365 = fma(_1347, _1269, _1353);
    float _1367 = in.m_69.x;
    float _1369 = in.m_69.y;
    float _1371 = in.m_69.z;
    float _1373 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1375 = _1315 * 6.283185482025146484375;
    float _1377 = sin(_1375);
    float _1379 = _1365 * 0.15915493667125701904296875;
    float _1381 = in.m_83.x;
    float _1383 = in.m_83.y;
    float _1385 = in.m_83.z;
    float _1387 = fma(_1361, _1217, _1217);
    float _1389 = fma(_1373, _1361, _1373);
    float _1391 = _1033 * 2.0;
    float _1393 = in.m_71.x;
    float _1395 = in.m_71.y;
    float _1397 = in.m_71.z;
    float _1399 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1387);
    float _1401 = _1315 * 6.283185482025146484375;
    float _1403 = cos(_1401);
    float _1405 = -_1391;
    float _1407 = fma(_1117, _1405, _1117);
    bool _1409 = _1051 != 0.0;
    bool _1411 = isnan(_1051);
    bool _1413 = _1409 || _1411;
    bool _1415 = isnan(0.0);
    bool _1417 = _1413 || _1415;
    float _1419 = fma(_1389, _1269, _1399);
    float _1421 = fma(_1033, 3.1415927410125732421875, _1407);
    bool _1423 = _997 == 0.0;
    bool _1425 = !_1417;
    bool _1427 = _1423 && _1425;
    float _1429 = _1419 * 0.15915493667125701904296875;
    float _1431 = _1379 * 6.283185482025146484375;
    float _1433 = sin(_1431);
    float _1435 = _1421 * 0.15915493667125701904296875;
    bool _1437 = _999 == 0.0;
    bool _1439 = _1437 && _1427;
    float _1441 = _1369 * _1357;
    float _1443 = _1429 * 6.283185482025146484375;
    float _1445 = cos(_1443);
    float _1447 = _669 * _1383;
    float _1449 = _697 * _1385;
    float _1451 = fma(_1367, _1355, _1441);
    float _1453 = _691 * _1381;
    float _1455 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1051);
    float _1457 = _1447 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1459 = _1379 * 6.283185482025146484375;
    float _1461 = cos(_1459);
    float _1463 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _999);
    float _1465 = _1449 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1467 = _1395 * _1357;
    float _1469 = fma(_1371, _1359, _1451);
    float _1471 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _997);
    float _1473 = _1453 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1475 = _1457 * _1455;
    float _1477 = _1429 * 6.283185482025146484375;
    float _1479 = sin(_1477);
    float _1481 = _1465 * _1463;
    float _1483 = fma(_1393, _1355, _1467);
    float _1485 = _1403 * _1433;
    float _1487 = _1377 * _1433;
    float _1489 = _1445 * _1433;
    float _1491 = _1473 * _1471;
    float _1493 = fma(_1397, _1359, _1483);
    float _1495 = _1403 * _1461;
    float _1497 = _1377 * _1461;
    float _1499 = _1377 * _1445;
    float _1501 = _1445 * _1461;
    float _1503 = _1403 * _1445;
    float _1505 = _1469 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1507 = _1435 * 6.283185482025146484375;
    float _1509 = sin(_1507);
    float _1511 = fma(_1479, _1487, _1495);
    float _1513 = -_1485;
    float _1515 = fma(_1479, _1497, _1513);
    float _1517 = -_1497;
    float _1519 = fma(_1479, _1485, _1517);
    float _1521 = _1499 * _1475;
    float _1523 = _1511 * _1475;
    float _1525 = _1515 * _1475;
    float _1527 = fma(_1479, _1495, _1487);
    float _1529 = -_1479;
    float _1531 = fma(_1529, _1491, _1521);
    float _1533 = fma(_1489, _1491, _1523);
    float _1535 = fma(_1501, _1491, _1525);
    float _1537 = fma(_1503, _1481, _1531);
    float _1539 = fma(_1519, _1481, _1533);
    float _1541 = fma(_1527, _1481, _1535);
    float _1543 = _1119 * 0.15915493667125701904296875;
    float _1545 = in.m_67.x;
    float _1547 = in.m_67.y;
    float _1549 = in.m_67.z;
    float _1551 = _1539 * _313;
    float _1553 = _1539 * _325;
    float _1555 = _1543 * 6.283185482025146484375;
    float _1557 = cos(_1555);
    float _1559 = _1539 * _321;
    float _1561 = fma(_1541, _295, _1551);
    float _1563 = fma(_1541, _303, _1553);
    float _1565 = _1493 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1567 = fma(_1541, _299, _1559);
    float _1569 = fma(_1537, _329, _1561);
    float _1571 = fma(_1537, _337, _1563);
    float _1573 = _1543 * 6.283185482025146484375;
    float _1575 = sin(_1573);
    float _1577 = fma(_1537, _333, _1567);
    float _1579 = _1505 + _1569;
    float _1581 = _1565 + _1571;
    float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1585 = _1579 + _1583;
    float _1587 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1589 = _1581 + _1587;
    float _1591 = -_967;
    float _1593 = fma(_1509, _1557, _1591);
    float _1595 = _1585 * _1585;
    float _1597 = _1589 * _1589;
    float _1599 = _1547 * _1357;
    float _1601 = _1595 + _1597;
    float _1603 = -_973;
    float _1605 = fma(_1509, _1575, _1603);
    float _1607 = fma(_1545, _1355, _1599);
    float _1609 = fma(_965, _1123, _831);
    float _1611 = sqrt(_1601);
    float _1613 = fma(_965, _1593, _967);
    float _1615 = fma(_1549, _1359, _1607);
    float _1617 = _1609;
    float _1619 = _1613;
    float _1621 = _1595;
    float _1623 = _1597;
    float _1625 = _1579;
    float _1627 = _1581;
    int _1629 = as_type<int>(_1475);
    int _1631 = as_type<int>(_1559);
    float _1633 = _1565;
    if (!_1439)
    {
        float _1635 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1609);
        _1617 = _1635;
    }
    float _1637 = _1617;
    float _1639 = fma(_965, _1605, _973);
    float _1641 = _1639;
    float _1643 = _1637;
    if (!_1439)
    {
        float _1645 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1613);
        _1619 = _1645;
    }
    float _1647 = _1619;
    float _1649 = _1615 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1651 = _1499 * _1637;
    float _1653 = _1515 * _1637;
    float _1655 = _1511 * _1637;
    float _1657 = _1649 + _1577;
    if (!_1439)
    {
        float _1659 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1639);
        _1641 = _1659;
    }
    float _1661 = _1641;
    bool _1663 = _1611 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1663)
    {
        _1643 = _1657;
    }
    float _1665 = _1643;
    bool _1667 = !_1663;
    float _1669 = _1665;
    if (!_1667)
    {
        float _1671 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1675 = _1611 + _1673;
        float _1677 = rsqrt(_1601);
        float _1679 = _1675 * _1671;
        float _1681 = _1657 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1683 = _1679 * 0.15915493667125701904296875;
        float _1685 = _1683 * 6.283185482025146484375;
        float _1687 = sin(_1685);
        float _1689 = _1683 * 6.283185482025146484375;
        float _1691 = cos(_1689);
        float _1693 = fma(_1687, _1681, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1695 = _1677 * _1693;
        float _1697 = _1691 + (-1.0);
        float _1699 = _1585 * _1695;
        float _1701 = _1589 * _1695;
        float _1703 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1705 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1707 = _1699 * _1699;
        float _1709 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1711 = fma(_1657, _1691, _1703);
        float _1713 = _1701 * _1701;
        _1669 = _1711;
        _1621 = _1707;
        _1623 = _1713;
        _1625 = _1705;
        _1627 = _1709;
    }
    float _1715 = _1669;
    float _1717 = _1621;
    float _1719 = _1623;
    float _1721 = _1625;
    float _1723 = _1627;
    float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1727 = _1715 + _1725;
    float _1729 = fma(_1489, _1647, _1655);
    float _1731 = fma(_1501, _1647, _1653);
    float _1733 = -_1479;
    float _1735 = fma(_1733, _1647, _1651);
    float _1737 = fma(_1727, _1727, _1717);
    float _1739 = fma(_1519, _1661, _1729);
    float _1741 = fma(_1527, _1661, _1731);
    float _1743 = fma(_1503, _1661, _1735);
    float _1745 = _1737 + _1719;
    float _1747 = _1739 * _313;
    float _1749 = _1739 * _321;
    float _1751 = _1739 * _325;
    out.m_85.x = _849;
    out.m_85.y = _793;
    float _1753 = fma(_1741, _295, _1747);
    float _1755 = sqrt(_1745);
    float _1757 = fma(_1741, _299, _1749);
    float _1759 = fma(_1741, _303, _1751);
    float _1761 = fma(_1743, _329, _1753);
    float _1763 = fma(_1743, _333, _1757);
    float _1765 = fma(_1743, _337, _1759);
    out.m_87.x = _1761;
    out.m_87.y = _1763;
    out.m_87.z = _1765;
    bool _1767 = _1755 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1769 = isnan(_1755);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1775 = _1771 || _1773;
    float _1777 = _1757;
    if (!_1775)
    {
        _1777 = 1.0;
    }
    float _1779 = _1777;
    bool _1781 = !_1775;
    float _1783 = _1779;
    if (!_1781)
    {
        bool _1785 = _1755 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1787 = isnan(_1755);
        bool _1789 = _1785 || _1787;
        bool _1791 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1793 = _1789 || _1791;
        if (!_1793)
        {
            float _1795 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1797 = _1755 + _1795;
            float _1799 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1801 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1799;
            float _1803 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1805 = _1803 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1807 = 1.0 / _1801;
            float _1809 = _1797 * _1807;
            float _1811 = fma(_1809, _1805, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1783 = _1811;
            _1813 = true;
        }
        else
        {
            bool _1815 = _1755 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1817 = isnan(_1755);
            bool _1819 = _1815 || _1817;
            bool _1821 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1823 = _1819 || _1821;
            if (!_1823)
            {
                float _1825 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1827 = _1755 + _1825;
                float _1829 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1831 = _1829 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1833 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1835 = _1833 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1837 = 1.0 / _1831;
                float _1839 = _1827 * _1837;
                float _1841 = fma(_1839, _1835, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1783 = _1841;
                _1813 = true;
            }
            else
            {
                _1783 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1813 = false;
    float _1843 = _1783;
    float _1845 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1847 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1849 = _1715 + _1847;
    float _1851 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1853 = _1721 + _1851;
    float _1855 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1857 = _1723 + _1855;
    float _1859 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1845);
    float _1861 = fma(_1849, _1843, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1863 = fma(_1853, _1843, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1865 = fma(_1857, _1843, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1867 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1859);
    float _1869 = _1649 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1871 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1873 = _1861 + _1871;
    float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1877 = _1863 + _1875;
    float _1879 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1881 = fma(_1505, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1869);
    float _1883 = _1873 * _1873;
    float _1885 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1887 = _1865 + _1885;
    float _1889 = 1.0 / _1879;
    float _1891 = fma(_1565, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1881);
    float _1893 = fma(_1877, _1877, _1883);
    float _1895 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1897 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1899 = fma(_1887, _1887, _1893);
    float _1901 = _1649 + _1895;
    float _1903 = _1897 + _1879;
    float _1905 = rsqrt(_1899);
    float _1907 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1909 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1911 = _1903 * _1889;
    float _1913 = _1911 * 0.5;
    float _1915 = fma(_1505, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1907);
    float _1917 = sqrt(_1899);
    float _1919 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1909);
    float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1923 = fma(_1913, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1921);
    float _1925 = fma(_1565, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1915);
    float _1927 = fma(_1565, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1929 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1919);
    float _1931 = _1925 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1933 = 1.0 / _1923;
    float _1935 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1937 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1939 = _1877 * _1935;
    float _1941 = _1887 * _1935;
    float _1943 = trunc(_1931);
    int _1945 = int(_1943);
    float _1947 = _1939 * _1939;
    float _1949 = _1941 * _1941;
    float _1951 = _1947 + _1949;
    float _1953 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1955 = _1933 * _1953;
    float _1957 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1959 = sqrt(_1951);
    bool _1961 = _1955 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1963 = fma(_1505, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1957);
    bool _1965 = _1955 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1967 = fma(_1565, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1963);
    float _1969 = floor(_1927);
    float _1971 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1973 = !_1961;
    int _1975 = _1973 ? 0 : 1;
    int _1977 = 2;
    int _1979 = as_type<int>(_1873);
    float _1981 = _1939;
    float _1983 = _1941;
    float _1985 = _1947;
    float _1987 = _1949;
    float _1989 = _1955;
    if (!_1961)
    {
        _1977 = 1;
    }
    int _1991 = _1977;
    float _1993 = trunc(_1971);
    int _1995 = int(_1993);
    int _1997 = _1991;
    if (!_1965)
    {
        _1997 = _1975;
    }
    int _1999 = _1997;
    bool _2001 = _1959 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2005 = _1959 + _2003;
    int _2007 = _1999 << 6;
    float _2009 = -_1969;
    float _2011 = _1927 + _2009;
    int _2013 = _2007 + 96;
    uint _2015 = uint(int(uint(_2013) >> uint(2)));
    uint _2017 = uint(int(uint(int(_2015)) >> uint(2)));
    int _2019 = int(_2015) & 3;
    float _2021 = (*spvDescriptorSet0.vp_c15)._m0[int(_2017)][_2019];
    int _2023 = int(_2015) + 1;
    uint _2025 = uint(int(uint(_2023) >> uint(2)));
    int _2027 = _2023 & 3;
    float _2029 = (*spvDescriptorSet0.vp_c15)._m0[int(_2025)][_2027];
    float _2031 = _1729;
    float _2033 = _2005;
    if (_2001)
    {
        float _2035 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2031 = _2035;
    }
    float _2037 = _2031;
    int _2039 = _2007 + 104;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    uint _2043 = uint(int(uint(int(_2041)) >> uint(2)));
    int _2045 = int(_2041) & 3;
    float _2047 = (*spvDescriptorSet0.vp_c15)._m0[int(_2043)][_2045];
    int _2049 = int(_2041) + 1;
    uint _2051 = uint(int(uint(_2049) >> uint(2)));
    int _2053 = _2049 & 3;
    float _2055 = (*spvDescriptorSet0.vp_c15)._m0[int(_2051)][_2053];
    if (_2001)
    {
        float _2057 = _2005 * _2037;
        _2033 = _2057;
    }
    float _2059 = _2033;
    int _2061 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2063 = _1945 + _2061;
    int _2065 = _2063 + 1;
    float _2067 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2001)
    {
        float _2069 = _2059 * 0.15915493667125701904296875;
        _815 = _2069;
    }
    float _2071 = _815;
    int _2073 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2075 = _1995 + _2073;
    int _2077 = _2075 + 1;
    float _2079 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2067);
    float _2081 = _313;
    if (_2001)
    {
        float _2083 = _2071 * 6.283185482025146484375;
        float _2085 = cos(_2083);
        _2081 = _2085;
    }
    float _2087 = _2081;
    bool _2089 = _2077 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2091 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2079);
    int _2093 = _2077 | _2065;
    float _2095 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2097 = _2093 < 0;
    bool _2099 = _2097 || _2089;
    float _2101 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2103 = _849;
    if (_2001)
    {
        float _2105 = _2071 * 6.283185482025146484375;
        float _2107 = sin(_2105);
        _2103 = _2107;
    }
    float _2109 = _2103;
    float _2111 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2113 = _2065 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2115 = _2113 || _2099;
    float _2117 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2119 = precise::max(0.0, _2101);
    float _2121 = -_2117;
    float _2123 = fma(_2121, _2111, 1.0);
    float _2125 = _2091;
    if (_2001)
    {
        float _2127 = rsqrt(_1951);
        _2125 = _2127;
    }
    float _2129 = _2125;
    float _2131 = -_1935;
    float _2133 = -_2119;
    float _2135 = fma(_1873, _2131, _2133);
    float _2137 = _1901 * _2029;
    float _2139 = _2029;
    float _2141 = _2137;
    float _2143 = _2135;
    if (_2001)
    {
        float _2145 = _2135 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2139 = _2145;
    }
    float _2147 = _2139;
    float _2149 = fma(_1505, _2021, _2137);
    if (!_2115)
    {
        int _2151 = _2065 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2153 = _2151 + _2077;
        _1979 = _2153;
    }
    int _2155 = _1979;
    if (_2001)
    {
        float _2157 = _2087 + (-1.0);
        _2141 = _2157;
    }
    float _2159 = _2141;
    int _2161 = _2007 + 48;
    uint _2163 = uint(int(uint(_2161) >> uint(2)));
    uint _2165 = uint(int(uint(int(_2163)) >> uint(2)));
    int _2167 = int(_2163) & 3;
    float _2169 = (*spvDescriptorSet0.vp_c15)._m0[int(_2165)][_2167];
    int _2171 = int(_2163) + 1;
    uint _2173 = uint(int(uint(_2171) >> uint(2)));
    int _2175 = _2171 & 3;
    float _2177 = (*spvDescriptorSet0.vp_c15)._m0[int(_2173)][_2175];
    float _2179 = _2109;
    float _2181 = _2159;
    if (_2001)
    {
        float _2183 = fma(_2109, _2147, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2179 = _2183;
    }
    float _2185 = _2179;
    float _2187 = fma(_1565, _2047, _2149);
    if (_2001)
    {
        float _2189 = _2159 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2181 = _2189;
    }
    float _2191 = _2181;
    float _2193 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (!_2115)
    {
        int _2195 = _2155 << 2;
        _1629 = _2195;
    }
    int _2197 = _1629;
    float _2199 = _2129;
    int _2201 = _2197;
    if (_2001)
    {
        float _2203 = _2129 * _2185;
        _2199 = _2203;
    }
    float _2205 = _2199;
    if (_2001)
    {
        float _2207 = fma(_2135, _2087, _2191);
        _2143 = _2207;
    }
    float _2209 = _2143;
    int _2211 = _2007 + 56;
    uint _2213 = uint(int(uint(_2211) >> uint(2)));
    uint _2215 = uint(int(uint(int(_2213)) >> uint(2)));
    int _2217 = int(_2213) & 3;
    float _2219 = (*spvDescriptorSet0.vp_c15)._m0[int(_2215)][_2217];
    int _2221 = int(_2213) + 1;
    uint _2223 = uint(int(uint(_2221) >> uint(2)));
    int _2225 = _2221 & 3;
    float _2227 = (*spvDescriptorSet0.vp_c15)._m0[int(_2223)][_2225];
    float _2229 = fma(_1505, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_2001)
    {
        float _2231 = _1939 * _2205;
        _1981 = _2231;
    }
    float _2233 = _1981;
    if (_2001)
    {
        float _2235 = _1941 * _2205;
        _1983 = _2235;
    }
    float _2237 = _1983;
    float _2239 = _2187 + _2055;
    if (!_2115)
    {
        uint _2241 = uint(int(uint(_2155) >> uint(2)));
        _1631 = int(_2241);
    }
    int _2243 = _1631;
    if (_2001)
    {
        float _2245 = _2233 * _2233;
        _1985 = _2245;
    }
    float _2247 = _1985;
    if (_2001)
    {
        float _2249 = _2237 * _2237;
        _1987 = _2249;
    }
    float _2251 = _1987;
    int _2253 = _2007 + 64;
    uint _2255 = uint(int(uint(_2253) >> uint(2)));
    uint _2257 = uint(int(uint(int(_2255)) >> uint(2)));
    int _2259 = int(_2255) & 3;
    float _2261 = (*spvDescriptorSet0.vp_c15)._m0[int(_2257)][_2259];
    int _2263 = int(_2255) + 1;
    uint _2265 = uint(int(uint(_2263) >> uint(2)));
    int _2267 = _2263 & 3;
    float _2269 = (*spvDescriptorSet0.vp_c15)._m0[int(_2265)][_2267];
    if (!_2115)
    {
        int _2271 = 12 & _2197;
        _2201 = _2271;
    }
    int _2273 = _2201;
    float _2275 = fma(_2209, _2209, _2247);
    float _2277 = _1861 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2279 = 1.0 / _2239;
    int _2281 = _2273;
    if (!_2115)
    {
        int _2283 = _2243 << 4;
        int _2285 = _2283 + _2273;
        _2281 = _2285;
    }
    int _2287 = _2281;
    float _2289 = _2275 + _2251;
    float _2291 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2277);
    int _2293 = _2007 + 72;
    uint _2295 = uint(int(uint(_2293) >> uint(2)));
    uint _2297 = uint(int(uint(int(_2295)) >> uint(2)));
    int _2299 = int(_2295) & 3;
    float _2301 = (*spvDescriptorSet0.vp_c15)._m0[int(_2297)][_2299];
    int _2303 = int(_2295) + 1;
    uint _2305 = uint(int(uint(_2303) >> uint(2)));
    int _2307 = _2303 & 3;
    float _2309 = (*spvDescriptorSet0.vp_c15)._m0[int(_2305)][_2307];
    float _2311 = fma(_1863, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2193);
    float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2315 = fma(_1917, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2313);
    float _2317 = precise::clamp(_2315, 0.0, 1.0);
    float _2319 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2291);
    float _2321 = rsqrt(_2289);
    float _2323 = fma(_1865, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2311);
    float _2325 = -_2317;
    float _2327 = _2325 + 1.0;
    float _2329 = _2319 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    int _2331 = _2007 + 80;
    uint _2333 = uint(int(uint(_2331) >> uint(2)));
    uint _2335 = uint(int(uint(int(_2333)) >> uint(2)));
    int _2337 = int(_2333) & 3;
    float _2339 = (*spvDescriptorSet0.vp_c15)._m0[int(_2335)][_2337];
    int _2341 = int(_2333) + 1;
    uint _2343 = uint(int(uint(_2341) >> uint(2)));
    int _2345 = _2341 & 3;
    float _2347 = (*spvDescriptorSet0.vp_c15)._m0[int(_2343)][_2345];
    float _2349 = _2323 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2351 = _2329 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2353 = abs(_2327);
    float _2355 = log2(_2353);
    float _2357 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2351);
    int _2359 = _2007 + 88;
    uint _2361 = uint(int(uint(_2359) >> uint(2)));
    uint _2363 = uint(int(uint(int(_2361)) >> uint(2)));
    int _2365 = int(_2361) & 3;
    float _2367 = (*spvDescriptorSet0.vp_c15)._m0[int(_2363)][_2365];
    int _2369 = int(_2361) + 1;
    uint _2371 = uint(int(uint(_2369) >> uint(2)));
    int _2373 = _2369 & 3;
    float _2375 = (*spvDescriptorSet0.vp_c15)._m0[int(_2371)][_2373];
    float _2377 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2357);
    float _2379 = _2321 * _2233;
    float _2381 = floor(_2229);
    float _2383 = _2321 * _2209;
    float _2385 = _1901 * _2177;
    float _2387 = _2357;
    if (!_2115)
    {
        int _2389 = _2287 + 400;
        uint _2391 = uint(int(uint(_2389) >> uint(2)));
        uint _2393 = uint(int(uint(int(_2391)) >> uint(2)));
        int _2395 = int(_2391) & 3;
        float _2397 = (*spvDescriptorSet0.vp_c15)._m0[int(_2393)][_2395];
        _2387 = _2397;
    }
    float _2399 = _2387;
    float _2401 = _2379 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2403 = _2321 * _2237;
    float _2405 = fma(_1505, _2169, _2385);
    float _2407 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2377);
    float _2409 = log2(_2123);
    float _2411 = fma(_1565, _2219, _2405);
    float _2413 = _2411 + _2227;
    float _2415 = -_2401;
    float _2417 = fma(_2383, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2415);
    float _2419 = -_2381;
    float _2421 = _2229 + _2419;
    float _2423 = _1901 * _2269;
    float _2425 = _2413 * _2279;
    float _2427 = -_2403;
    float _2429 = fma(_2427, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2417);
    float _2431 = 1.0 / _2407;
    float _2433 = fma(_1505, _2261, _2423);
    float _2435 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _2437 = _2425 >= 0.0;
    float _2439 = _2409 * 0.693147182464599609375;
    float _2441 = fma(_1565, _2301, _2433);
    float _2443 = fma(_2429, -0.5, 0.5);
    bool _2445 = _2425 <= 1.0;
    bool _2447 = _2445 && _2437;
    float _2449 = exp2(_2435);
    float _2451 = _2441 + _2309;
    float _2453 = _2451 * _2279;
    float _2455 = _1901 * _2347;
    float _2457 = _2329 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2459 = sqrt(_2443);
    bool _2461 = _2453 >= 0.0;
    bool _2463 = _2461 && _2447;
    float _2465 = fma(_1505, _2339, _2455);
    float _2467 = fma(_2429, 0.5, 0.5);
    float _2469 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2457);
    bool _2471 = _2453 <= 1.0;
    bool _2473 = _2471 && _2463;
    float _2475 = fma(_1565, _2367, _2465);
    float _2477 = fma(_2467, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2479 = _2403;
    float _2481 = _2467;
    if (!_2115)
    {
        float _2483 = floor(_1931);
        _2479 = _2483;
    }
    float _2485 = _2479;
    float _2487 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2469);
    float _2489 = _2475 + _2375;
    float _2491 = fma(_2467, _2477, -0.212114393711090087890625);
    float _2493 = _2329 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2495 = _2383 + 1.0;
    float _2497 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2487);
    float _2499 = fma(_2467, _2491, 1.570728778839111328125);
    float _2501 = _2429;
    float _2503 = _2495;
    float _2505 = _2497;
    if (!_2115)
    {
        float _2507 = floor(_1971);
        _2501 = _2507;
    }
    float _2509 = _2501;
    float _2511 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2493);
    if (_2473)
    {
        float _2513 = float(_1999);
        _2481 = _2513;
    }
    float _2515 = _2481;
    float _2517 = _2459 * 0.636619746685028076171875;
    float _2519 = -_2383;
    float _2521 = fma(_2449, _2495, _2519);
    float _2523 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2511);
    float _2525 = _2497 * _2431;
    float _2527 = -_2499;
    float _2529 = fma(_2517, _2527, 1.0);
    float _2531 = _2475;
    if (!_2115)
    {
        float _2533 = rint(_2399);
        float _2535 = precise::max(_2533, 0.0);
        uint _2537 = uint(_2535);
        uint _2539 = clamp(_2537, 0u, 65535u);
        _2531 = as_type<float>(_2539);
    }
    float _2541 = _2531;
    float _2543 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2523);
    float _2545 = _2485;
    if (!_2115)
    {
        float _2547 = -_2485;
        float _2549 = _1931 + _2547;
        _2545 = _2549;
    }
    float _2551 = _2545;
    float _2553 = _2489 * _2279;
    float _2555 = _2439 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2557 = _2543 * _2431;
    float _2559 = fma(_2525, 0.5, 0.5);
    float _2561 = fma(_2521, 0.5, 0.5);
    float _2563 = _2515;
    if (_2473)
    {
        float _2565 = rint(_2515);
        float _2567 = precise::max(_2565, 0.0);
        uint _2569 = uint(_2567);
        uint _2571 = clamp(_2569, 0u, 65535u);
        _2563 = as_type<float>(_2571);
    }
    float _2573 = _2563;
    if (!_2115)
    {
        float _2575 = -_2509;
        float _2577 = _1971 + _2575;
        _2503 = _2577;
    }
    float _2579 = _2503;
    float _2581 = fma(_2557, -0.5, 0.5);
    float2 _6944 = float2(_2421, _2011);
    float _2583 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6944, float2(0.0), isnan(_6944)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6944, float2(0.0), isnan(_6944)), level(0.0)).x;
    float _2585 = _2541;
    if (!_2115)
    {
        float3 _6961 = float3(_2579, _2551, float(as_type<int>(_2541)));
        float3 _6965 = select(_6961, float3(0.0), isnan(_6961));
        float _2587 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6965.xy, uint(rint(_6965.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6965.xy, uint(rint(_6965.z)), level(0.0)).x;
        _2585 = _2587;
    }
    float _2589 = _2585;
    float _2591 = _2573;
    if (_2473)
    {
        float3 _6980 = float3(_2425, _2453, float(as_type<int>(_2573)));
        float3 _6982 = select(_6980, float3(0.0), isnan(_6980));
        float _2593 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6982.xy, uint(rint(_6982.z)), _2553, level(0.0));
        _2591 = _2593;
    }
    float _2595 = _2591;
    float3 _6992 = float3(_2559, _2581, _2555);
    float _2597 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6992, float3(0.0), isnan(_6992)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6992, float3(0.0), isnan(_6992)), level(0.0)).x;
    float3 _7001 = float3(_2559, _2581, _2555);
    float4 _2599 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7001, float3(0.0), isnan(_7001)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7001, float3(0.0), isnan(_7001)), level(0.0)).xyzw;
    float _2601 = _2599.x;
    float _2603 = _2599.y;
    float _2605 = _2599.z;
    float _2607 = _2599.w;
    float2 _7017 = float2(_2529, _2561);
    float3 _2611 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7017, float2(0.0), isnan(_7017)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7017, float2(0.0), isnan(_7017)), level(0.0)).xyz;
    float _2613 = _2611.x;
    float _2615 = _2611.y;
    float _2617 = _2611.z;
    float _2619 = abs(_1955);
    float _2621 = log2(_2619);
    float _2623 = _2329 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_89.x = _1505;
    float _2625 = _2355 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2627 = fma(_2349, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2623);
    out.m_89.z = _1565;
    float _2629 = fma(_2095, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2627);
    float _2631 = exp2(_2625);
    float _2633 = fma(_1937, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2629);
    float _2635 = _2621 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2637 = _2633 + _2407;
    out.gl_Position.x = _2497;
    out.gl_Position.y = _2543;
    out.gl_Position.z = _2633;
    out.gl_Position.w = _2407;
    float _2639 = exp2(_2635);
    float _2641 = _2637 * 0.5;
    bool _2643 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2645 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2647 = _2643 || _2645;
    bool _2649 = isnan(0.5);
    bool _2651 = _2647 || _2649;
    out.m_91.z = _2641;
    out.m_91.w = _2407;
    float _2653 = fma(_2639, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2655 = precise::clamp(_2653, 0.0, 1.0);
    float _2657 = fma(_2655, -2.0, 3.0);
    float _2659 = _2655 * _2655;
    float _2661 = _2659 * _2657;
    bool _2663 = _1955 <= 8000.0;
    bool _2665 = isnan(_1955);
    bool _2667 = _2663 || _2665;
    bool _2669 = isnan(8000.0);
    bool _2671 = _2667 || _2669;
    float _2673 = float(_2671);
    float _2675 = -_2661;
    float _2677 = _2675 + 1.0;
    float _2679 = fma(_2677, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2661);
    float _2681 = _2673 * _2679;
    float _2683 = _2673;
    if (_2651)
    {
        _2683 = 1.0;
    }
    float _2685 = _2683;
    float _2687 = _2685;
    float _2689 = _2589;
    if (!_2651)
    {
        float _2691 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2693 = _2691 * 0.15915493667125701904296875;
        float _2695 = _2693 * 6.283185482025146484375;
        float _2697 = cos(_2695);
        float _2699 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2701 = _2699 * 0.15915493667125701904296875;
        float _2703 = _2693 * 6.283185482025146484375;
        float _2705 = sin(_2703);
        float _2707 = 1.0 / _2697;
        float _2709 = _2701 * 6.283185482025146484375;
        float _2711 = cos(_2709);
        float _2713 = _2705 * _2707;
        float _2715 = _2701 * 6.283185482025146484375;
        float _2717 = sin(_2715);
        float _2719 = _2711 * _2713;
        float _2721 = 1.0 / _2719;
        float _2723 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2725 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2723;
        float _2727 = 1.0 / _2725;
        float _2729 = _2717 * _2721;
        float _2731 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2733 = fma(_1955, _2729, _2731);
        float _2735 = _2733 * _2727;
        float _2737 = precise::clamp(_2735, 0.0, 1.0);
        _2505 = _2721;
        _2687 = _2737;
    }
    float _2739 = _2505;
    float _2741 = _2687;
    float _2743 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2745 = -_2583;
    float _2747 = _2745 + 1.0;
    float _2749 = -_2631;
    float _2751 = _2749 + 1.0;
    float _2753 = _2739;
    if (!_2473)
    {
        _2753 = 1.0;
    }
    float _2755 = _2753;
    float _2757 = _2747 * _2743;
    float _2759 = precise::clamp(_2757, 0.0, 1.0);
    float _2761 = _2755;
    if (_2473)
    {
        bool _2763 = _2595 >= _2553;
        bool _2765 = isnan(_2595);
        bool _2767 = _2763 || _2765;
        bool _2769 = isnan(_2553);
        bool _2771 = _2767 || _2769;
        float _2773 = float(_2771);
        _2761 = _2773;
    }
    float _2775 = _2761;
    float _2777 = _2751 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2779 = _2775;
    if (_2115)
    {
        _1989 = 1.0;
    }
    float _2781 = _1989;
    float _2783 = _2781;
    if (!_2115)
    {
        int _2785 = _2155 << 4;
        int _2787 = _2785 + 2048;
        uint _2789 = uint(int(uint(_2787) >> uint(2)));
        uint _2791 = uint(int(uint(int(_2789)) >> uint(2)));
        int _2793 = int(_2789) & 3;
        float _2795 = (*spvDescriptorSet0.vp_c15)._m0[int(_2791)][_2793];
        int _2797 = int(_2789) + 1;
        uint _2799 = uint(int(uint(_2797) >> uint(2)));
        int _2801 = _2797 & 3;
        float _2803 = (*spvDescriptorSet0.vp_c15)._m0[int(_2799)][_2801];
        int _2805 = _2787 + 8;
        uint _2807 = uint(int(uint(_2805) >> uint(2)));
        uint _2809 = uint(int(uint(int(_2807)) >> uint(2)));
        int _2811 = int(_2807) & 3;
        float _2813 = (*spvDescriptorSet0.vp_c15)._m0[int(_2809)][_2811];
        int _2815 = int(_2807) + 1;
        uint _2817 = uint(int(uint(_2815) >> uint(2)));
        int _2819 = _2815 & 3;
        float _2821 = (*spvDescriptorSet0.vp_c15)._m0[int(_2817)][_2819];
        float _2823 = _1901 * _2803;
        float _2825 = fma(_1505, _2795, _2823);
        float _2827 = fma(_1565, _2813, _2825);
        float _2829 = _2827 + _2821;
        float _2831 = precise::clamp(_2829, 0.0, 1.0);
        float _2833 = -_2831;
        float _2835 = _2833 + _2589;
        float _2837 = fma(_2835, 500.0, 1.5);
        float _2839 = exp2(_2837);
        float _2841 = 0.0 + _2839;
        float _2843 = precise::clamp(_2841, 0.0, 1.0);
        _2783 = _2843;
        _1633 = _2839;
    }
    float _2845 = _2783;
    float _2847 = _1633;
    float _2849 = _2775 * _2845;
    float _2851 = _2777 * _2597;
    float _2853 = -_2759;
    float _2855 = fma(_2853, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2857 = -_2777;
    float _2859 = _2857 + 1.0;
    out.m_93.x = _1863;
    out.m_93.y = _1861;
    out.m_93.z = _1865;
    float _2861 = _2607 * _2851;
    float _2863 = -_2849;
    float _2865 = fma(_2863, _2855, 1.0);
    float _2867 = precise::clamp(_2865, 0.0, 1.0);
    float _2869 = _2617 * _2851;
    float _2871 = _2607 * _2859;
    float _2873 = fma(_2613, _2861, _2601);
    float _2875 = fma(_2615, _2861, _2603);
    float _2877 = _2867 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2879 = fma(_2607, _2869, _2605);
    bool _2881 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2883 = isnan(_1917);
    bool _2885 = _2881 || _2883;
    bool _2887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2889 = _2885 || _2887;
    float _2891 = _2741 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _2877;
    out.m_97.x = _2873;
    out.m_97.y = _2875;
    out.m_97.z = _2879;
    out.m_97.w = _2871;
    float _2893 = _2859;
    float _2895 = _2847;
    float _2897 = _2861;
    float _2899 = _2867;
    if (!_2889)
    {
        _2893 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2901 = _2893;
    float _2903 = _2901;
    float _2905 = _2901;
    if (!_2889)
    {
        _2779 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2907 = _2779;
    float _2909 = _2907;
    float _2911 = _2907;
    if (!_2889)
    {
        _2689 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2913 = _2689;
    float _2915 = _2913;
    float _2917 = _2913;
    if (!_2889)
    {
        _2895 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2919 = _2895;
    float _2921 = _2919;
    float _2923 = _2919;
    if (!_2889)
    {
        _2897 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2925 = _2897;
    float _2927 = _2925;
    float _2929 = _2925;
    if (!_2889)
    {
        _2899 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2931 = _2899;
    bool _2933 = !_2889;
    float _2935 = _2931;
    float _2937 = _2931;
    if (!_2933)
    {
        bool _2939 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2941 = isnan(_1917);
        bool _2943 = _2939 || _2941;
        bool _2945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2947 = _2943 || _2945;
        if (!_2947)
        {
            float _2949 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2951 = _1917 + _2949;
            float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2955 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2953;
            float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2961 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2963 = _2961 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2965 = 1.0 / _2955;
            float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2969 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2973 = _2971 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2975 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2977 = _2975 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2979 = _2951 * _2965;
            float _2981 = precise::clamp(_2979, 0.0, 1.0);
            float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2985 = _2983 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2987 = fma(_2981, _2959, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2989 = fma(_2981, _2963, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2991 = fma(_2981, _2985, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2993 = fma(_2981, _2969, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2995 = fma(_2981, _2973, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2997 = fma(_2981, _2977, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2911 = _2989;
            _2929 = _2995;
            _2905 = _2987;
            _2923 = _2993;
            _2917 = _2991;
            _2937 = _2997;
            _2999 = true;
        }
        else
        {
            bool _3001 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3003 = isnan(_1917);
            bool _3005 = _3001 || _3003;
            bool _3007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3009 = _3005 || _3007;
            if (!_3009)
            {
                _2903 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3011 = _2903;
            _2905 = _3011;
            if (!_3009)
            {
                _2909 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3013 = _2909;
            _2911 = _3013;
            if (!_3009)
            {
                _2915 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3015 = _2915;
            _2917 = _3015;
            if (!_3009)
            {
                _2921 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3017 = _2921;
            _2923 = _3017;
            if (!_3009)
            {
                _2927 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3019 = _2927;
            _2929 = _3019;
            if (!_3009)
            {
                _2935 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3021 = _2935;
            bool _3023 = !_3009;
            _2937 = _3021;
            if (!_3023)
            {
                bool _3025 = _1917 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3027 = isnan(_1917);
                bool _3029 = _3025 || _3027;
                bool _3031 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3033 = _3029 || _3031;
                if (!_3033)
                {
                    float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3037 = _1917 + _3035;
                    float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3041 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3039;
                    float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3049 = _3047 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3051 = 1.0 / _3041;
                    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3055 = _3053 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3059 = _3057 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3061 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3063 = _3061 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3065 = _3037 * _3051;
                    float _3067 = precise::clamp(_3065, 0.0, 1.0);
                    float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3071 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3073 = fma(_3067, _3045, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3075 = fma(_3067, _3049, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3077 = fma(_3067, _3071, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3079 = fma(_3067, _3055, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3081 = fma(_3067, _3059, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3083 = fma(_3067, _3063, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2911 = _3075;
                    _2929 = _3081;
                    _2905 = _3073;
                    _2923 = _3079;
                    _2917 = _3077;
                    _2937 = _3083;
                    _2999 = true;
                }
                else
                {
                    _2911 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2929 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2905 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2923 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2917 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2937 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2999 = false;
    float _3085 = _2911;
    float _3087 = _2929;
    float _3089 = _2905;
    float _3091 = _2923;
    float _3093 = _2917;
    float _3095 = _2937;
    float _3097 = fma(_1763, -0.5, 0.5);
    float _3099 = precise::clamp(_3097, 0.0, 1.0);
    float _3101 = -_3085;
    float _3103 = _3101 + _3087;
    float _3105 = _2891 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3107 = -_3089;
    float _3109 = _3107 + _3091;
    out.m_99.x = 0.0;
    float _3111 = fma(_3099, _3103, _3085);
    float _3113 = fma(_3099, _3109, _3089);
    out.m_63.x = _3105;
    float _3115 = -_3093;
    float _3117 = _3115 + _3095;
    float _3119 = _3111 * 0.586610972881317138671875;
    bool _3121 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3123 = fma(_3099, _3117, _3093);
    float _3125 = fma(_3113, 0.298911988735198974609375, _3119);
    bool _3127 = _2741 > 0.0;
    bool _3129 = isnan(_2741);
    bool _3131 = _3127 || _3129;
    bool _3133 = isnan(0.0);
    bool _3135 = _3131 || _3133;
    float _3137 = fma(_3123, 0.114477999508380889892578125, _3125);
    float _3139 = -_3137;
    float _3141 = _3113 + _3139;
    float _3143 = -_3137;
    float _3145 = _3111 + _3143;
    float _3147 = -_3137;
    float _3149 = _3123 + _3147;
    float _3151 = fma(_3141, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3137);
    float _3153 = fma(_3145, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3137);
    float _3155 = fma(_3149, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3137);
    bool _3157 = !_3121;
    if (!_3157)
    {
        float _3159 = -_1861;
        float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3163 = -_1863;
        float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3167 = -_1865;
        float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3171 = _3161 * _3161;
        float _3173 = fma(_3165, _3165, _3171);
        float _3175 = fma(_3169, _3169, _3173);
        float _3177 = sqrt(_3175);
        float _3179 = rsqrt(_3175);
        float _3181 = -_3177;
        float _3183 = _3181 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3185 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3187 = precise::clamp(_3185, 0.0, 1.0);
        float _3189 = _3165 * _3179;
        float _3191 = _3161 * _3179;
        float _3193 = abs(_3187);
        float _3195 = log2(_3193);
        float _3197 = _3169 * _3179;
        float _3199 = _3189 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3201 = _1763 * _3191;
        float _3203 = -_3191;
        float _3205 = -_3199;
        float _3207 = fma(_3203, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3205);
        float _3209 = fma(_1761, _3189, _3201);
        float _3211 = -_3197;
        float _3213 = fma(_3211, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3207);
        float _3215 = fma(_1765, _3197, _3209);
        float _3217 = precise::clamp(_3215, 0.0, 1.0);
        float _3219 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3221 = _3213 + _3219;
        float _3223 = _3195 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3225 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3227 = precise::clamp(_3225, 0.0, 1.0);
        float _3229 = exp2(_3223);
        float _3231 = _3229 * _3227;
        float _3233 = _3217 * _3231;
        float _3235 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3237 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3239 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_99.x = _3235;
        out.m_99.y = _3237;
        out.m_99.z = _3239;
    }
    out.m_101.x = _3151;
    out.m_101.y = _3153;
    out.m_101.z = _3155;
    if (_3135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.dm_pad9.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.dm_pad9.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.dm_pad9.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.dm_pad9.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_63.x = 0.0;
    float _3241 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3241;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.dm_pad9.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.dm_pad9.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.dm_pad9.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.dm_pad9.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

