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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_69 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
};

static inline __attribute__((always_inline))
int _96(thread const int& _9507, thread const int& _9508, constant _10& support_buffer)
{
    float _9511 = as_type<float>(support_buffer._m4);
    int _9513 = _9508 + as_type<int>(_9511);
    int _9515 = 1 + _9513;
    float _9517 = support_buffer._m5[_9515].x;
    float _9519 = abs(_9517);
    bool _9521 = _9519 == 1.0;
    if (_9521)
    {
        return _9507;
    }
    float _9523 = float(_9507);
    float _9525 = _9523 / _9519;
    int _9527 = int(_9525);
    return _9527;
}

static inline __attribute__((always_inline))
int _97(thread const int& _9557, thread const int& _9558, constant _10& support_buffer)
{
    float _9561 = as_type<float>(support_buffer._m4);
    int _9563 = _9558 + as_type<int>(_9561);
    int _9565 = 1 + _9563;
    float _9567 = support_buffer._m5[_9565].x;
    bool _9569 = _9567 == 1.0;
    if (_9569)
    {
        return _9557;
    }
    float _9571 = float(_9557);
    float _9573 = _9571 * _9567;
    int _9575 = int(_9573);
    return _9575;
}

static inline __attribute__((always_inline))
void _94(thread const int& _9202, thread const int& _9203, thread const int& _9204, thread const int& _9205, thread int& _9206, thread int& _9207, thread int& _9208, thread int& _9209, thread int& _9210, thread int& _9211, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _9214 = _9203;
    int _9216 = _9204;
    float _9218 = 0.0 + as_type<float>(_9202);
    bool _9220 = _9218 != 0.0;
    bool _9222 = isnan(_9218);
    bool _9224 = _9220 || _9222;
    bool _9226 = isnan(0.0);
    bool _9228 = _9224 || _9226;
    int _9230 = as_type<int>(_9218);
    int _9232 = _9228 ? (-1) : 0;
    if (!_9228)
    {
        float _9234 = as_type<float>(_9202) * 1.0;
        _9214 = as_type<int>(_9234);
    }
    int _9236 = _9214;
    bool _9238 = !_9228;
    int _9240 = _9236;
    int _9242 = _9236;
    if (!_9238)
    {
        bool _9244 = _9218 >= 0.0;
        bool _9246 = isnan(_9218);
        bool _9248 = _9244 || _9246;
        bool _9250 = isnan(0.0);
        bool _9252 = _9248 || _9250;
        _9232 = _9252 ? (-1) : 0;
        if (!_9252)
        {
            _9240 = 2147483647;
        }
        int _9254 = _9240;
        bool _9256 = !_9252;
        int _9258 = _9254;
        _9242 = _9254;
        if (!_9256)
        {
            float _9260 = abs(as_type<float>(_9202));
            float _9262 = 0.0 + _9260;
            bool _9264 = _9262 > as_type<float>(0x7f800000u /* inf */);
            bool _9266 = isnan(_9262);
            bool _9268 = _9264 || _9266;
            bool _9270 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _9272 = _9268 || _9270;
            _9230 = as_type<int>(_9262);
            _9232 = _9272 ? (-1) : 0;
            if (_9272)
            {
                float _9274 = as_type<float>(_9202) + 1.0;
                _9258 = as_type<int>(_9274);
            }
            int _9276 = _9258;
            int _9278 = _9276;
            _9242 = _9276;
            if (!_9272)
            {
                bool _9280 = _9262 != as_type<float>(0x7f800000u /* inf */);
                bool _9282 = isnan(_9262);
                bool _9284 = _9280 || _9282;
                bool _9286 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _9288 = _9284 || _9286;
                _9232 = _9288 ? (-1) : 0;
                if (!_9288)
                {
                    _9278 = _9202;
                }
                int _9290 = _9278;
                bool _9292 = !_9288;
                _9242 = _9290;
                if (!_9292)
                {
                    float _9294 = as_type<float>(_9202) * 18446744073709551616.0;
                    float _9296 = rsqrt(_9294);
                    float _9298 = _9294 * _9296;
                    float _9300 = _9296 * 0.5;
                    float _9302 = -_9298;
                    float _9304 = 0.0 + _9302;
                    float _9306 = fma(_9300, _9304, 0.5);
                    float _9308 = fma(_9298, _9306, _9298);
                    float _9310 = -_9308;
                    float _9312 = 0.0 + _9310;
                    float _9314 = fma(_9308, _9312, _9294);
                    float _9316 = fma(_9300, _9314, _9308);
                    float _9318 = _9316 * 2.3283064365386962890625e-10;
                    _9242 = as_type<int>(_9318);
                    _9216 = as_type<int>(_9308);
                    _9230 = as_type<int>(_9304);
                }
            }
        }
    }
    int _9320 = _9242;
    int _9322 = _9216;
    int _9324 = _9230;
    int _9326 = _9232;
    _9206 = _9205;
    _9207 = 0;
    _9208 = _9320;
    _9209 = _9322;
    _9210 = _9324;
    _9211 = _9326;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3231 = false;
    bool _2403 = false;
    bool _2213 = false;
    bool _1651 = false;
    bool _1331 = false;
    bool _1201 = false;
    bool _1097 = false;
    bool _917 = false;
    bool _641 = false;
    bool _491 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _105 = int(_103);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3710 = as_type<float>(_121);
        out.gl_Position.z = _3710;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = 0.0;
    float _145 = _139;
    if (_135)
    {
        float _147 = float(_105);
        _115 = _147;
    }
    float _149 = _115;
    bool _151 = _139 >= _149;
    bool _153 = !_135;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _123 = as_type<int>(_161);
    }
    int _163 = _123;
    float _165 = as_type<float>(_163);
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3782 = as_type<float>(_163);
        out.gl_Position.z = _3782;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = in.m_51.x;
    float _169 = in.m_51.y;
    float _171 = in.m_51.z;
    float _173 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = _173;
    if (!_183)
    {
        float _187 = _173 * _173;
        float _189 = _187 * 0.5;
        _165 = _189;
    }
    float _191 = _165;
    float _193 = 0.0;
    float _195 = _191;
    if (!_183)
    {
        float _197 = _139 * _139;
        float _199 = _197 * 0.5;
        _193 = _199;
    }
    float _201 = _193;
    if (!_183)
    {
        float _203 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _203;
    }
    float _205 = _195;
    bool _207 = !_183;
    float _209 = _205;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _173 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _173);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _141 = _225;
        _209 = _239;
        _143 = _227;
    }
    float _241 = _141;
    float _243 = _209;
    float _245 = _143;
    bool _247 = !_183;
    float _249 = _241;
    float _251 = _245;
    if (!_247)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _173 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _249 = _265;
        _251 = _259;
        _185 = _271;
    }
    float _273 = _249;
    float _275 = _251;
    float _277 = _185;
    float _279 = _275;
    float _281 = _273;
    if (!_183)
    {
        _279 = _139;
    }
    float _283 = _279;
    float _285 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _283;
    if (!_183)
    {
        float _289 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _281 = _289;
    }
    float _291 = _281;
    bool _293 = !_183;
    float _295 = _291;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _139 * _299;
        float _305 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _307 = _305 + 1.0;
        float _309 = 1.0 / _307;
        float _311 = _301 * 0.693147182464599609375;
        float _313 = exp2(_303);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _139);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
    }
    float _327 = _295;
    bool _329 = !_183;
    if (!_329)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _337 = _335 + 1.0;
        float _339 = 1.0 / _337;
        float _341 = _139 * _333;
        float _343 = exp2(_341);
        float _345 = -_343;
        float _347 = _345 + 1.0;
        float _349 = _347 * _339;
        _287 = _349;
    }
    float _351 = _287;
    float _353 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _355 = fma(_277, _169, _285);
    float _357 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _359 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = fma(_351, _169, _353);
    float _363 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _365 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _367 = fma(_277, _167, _357);
    float _369 = fma(_351, _167, _359);
    float _371 = -_361;
    float _373 = _355 + _371;
    float _375 = fma(_277, _171, _363);
    float _377 = fma(_351, _171, _365);
    float _379 = -_369;
    float _381 = _367 + _379;
    float _383 = _373 * _373;
    float _385 = in.m_53.w;
    float _387 = -_377;
    float _389 = _375 + _387;
    float _391 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _393 = fma(_381, _381, _383);
    float _395 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _397 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _399 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _391);
    float _401 = fma(_389, _389, _393);
    float _403 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _395);
    float _405 = in.m_46.x;
    float _407 = in.m_46.y;
    float _409 = in.m_46.z;
    float _411 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _397);
    float _413 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _399);
    float _415 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _403);
    float _417 = sqrt(_401);
    float _419 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
    bool _421 = _417 >= 9.9999999747524270787835121154785e-07;
    bool _423 = isnan(_417);
    bool _425 = _421 || _423;
    bool _427 = isnan(9.9999999747524270787835121154785e-07);
    bool _429 = _425 || _427;
    float _431 = fma(_375, _385, _409);
    float _433 = fma(_367, _385, _405);
    float _435 = fma(_355, _385, _407);
    float _437 = _375;
    float _439 = _413;
    float _441 = _415;
    float _443 = _431;
    if (_429)
    {
        _437 = _413;
    }
    float _445 = _437;
    float _447 = _445;
    if (_429)
    {
        _439 = _419;
    }
    float _449 = _439;
    float _451 = _449;
    if (!_429)
    {
        bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _455 = !_453;
        if (!_455)
        {
            float _457 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _459 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _461 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _459);
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _467);
            float _475 = _469 * _469;
            float _477 = fma(_471, _471, _475);
            float _479 = fma(_473, _473, _477);
            float _481 = rsqrt(_479);
            float _483 = _481 * 9.9999999747524270787835121154785e-07;
            float _485 = _471 * _483;
            float _487 = _469 * _483;
            float _489 = _473 * _483;
            _441 = _487;
            _447 = _485;
            _451 = _489;
            _491 = true;
        }
        else
        {
            float _493 = _169 * _169;
            float _495 = fma(_167, _167, _493);
            float _497 = fma(_171, _171, _495);
            float _499 = sqrt(_497);
            bool _501 = _499 >= 9.9999999747524270787835121154785e-07;
            bool _503 = isnan(_499);
            bool _505 = _501 || _503;
            bool _507 = isnan(9.9999999747524270787835121154785e-07);
            bool _509 = _505 || _507;
            if (!_509)
            {
                float _511 = _407 * _407;
                float _513 = fma(_405, _405, _511);
                float _515 = fma(_409, _409, _513);
                float _517 = sqrt(_515);
                bool _519 = _517 >= 9.9999999747524270787835121154785e-07;
                bool _521 = isnan(_517);
                bool _523 = _519 || _521;
                bool _525 = isnan(9.9999999747524270787835121154785e-07);
                bool _527 = _523 || _525;
                if (!_527)
                {
                    float _529 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _531 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _529);
                    float _533 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _531);
                    float _535 = rsqrt(_533);
                    float _537 = _535 * 9.9999999747524270787835121154785e-07;
                    float _539 = _537 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _541 = _537 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _543 = _537 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _441 = _541;
                    _447 = _539;
                    _451 = _543;
                    _491 = true;
                }
                else
                {
                    float _545 = _407 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _547 = _407 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _549 = _407 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _551 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].x, _545);
                    float _553 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].x, _547);
                    float _555 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].x, _549);
                    float _557 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _551);
                    float _559 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _553);
                    float _561 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _555);
                    float _563 = _557 * _557;
                    float _565 = fma(_559, _559, _563);
                    float _567 = fma(_561, _561, _565);
                    float _569 = rsqrt(_567);
                    float _571 = _569 * 9.9999999747524270787835121154785e-07;
                    float _573 = _559 * _571;
                    float _575 = _557 * _571;
                    float _577 = _561 * _571;
                    _441 = _575;
                    _447 = _573;
                    _451 = _577;
                    _491 = true;
                }
            }
            else
            {
                float _579 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _581 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _583 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _585 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _579);
                float _587 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
                float _589 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _583);
                float _591 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _585);
                float _593 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _587);
                float _595 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _589);
                float _597 = _591 * _591;
                float _599 = fma(_593, _593, _597);
                float _601 = fma(_595, _595, _599);
                float _603 = rsqrt(_601);
                float _605 = _603 * 9.9999999747524270787835121154785e-07;
                float _607 = _593 * _605;
                float _609 = _591 * _605;
                float _611 = _595 * _605;
                _441 = _609;
                _447 = _607;
                _451 = _611;
            }
        }
    }
    _491 = false;
    float _613 = _441;
    float _615 = _447;
    float _617 = _451;
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _621 = !_619;
    float _639;
    if (!_621)
    {
        float _623 = in.m_55.x;
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        float _643 = float(_105);
        float _645 = 1.0 / _643;
        float _647 = _139 * _645;
        _639 = _647;
    }
    _641 = false;
    float _649 = _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _653 = _649 + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _657 = _649 + _655;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _659;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _675 = 1.0 / _661;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _679 = _649 + _677;
    float _681 = 1.0 / _669;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _685 = _649 + _683;
    bool _687 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _689 = 1.0 / _665;
    float _691 = _679 * _675;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _693;
    float _697 = fma(_695, _691, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _699 = 1.0 / _673;
    float _701 = _653 * _681;
    bool _703 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _705 = isnan(_649);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _715;
    float _719 = -_713;
    float _721 = _719 + 1.0;
    float _723 = _657 * _689;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _725;
    float _729 = fma(_717, _691, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _731 = fma(_727, _691, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _733 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _735 = isnan(_649);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = _685 * _699;
    bool _747 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _749 = isnan(_649);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    bool _759 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _761 = isnan(_649);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = -_757;
    float _773 = _771 + 1.0;
    float _775 = _769 * _721;
    float _777 = -_769;
    float _779 = _777 + 1.0;
    float _781 = _713 * _773;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _787 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _789 = isnan(_649);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = _743 * _779;
    float _801 = -_743;
    float _803 = _801 + 1.0;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _807 = _805 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _813 = fma(_785, _723, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _815 = _797 * _803;
    float _817 = fma(_807, _723, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _819 = fma(_811, _723, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _821 = _731 * _815;
    float _823 = _697 * _815;
    float _825 = -_797;
    float _827 = _825 + 1.0;
    float _829 = _729 * _815;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _831;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _835;
    float _839 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[143].x, _821);
    float _841 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[143].y, _823);
    float _843 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[143].z, _829);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _845;
    float _849 = fma(_817, _799, _839);
    float _851 = fma(_833, _701, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _853 = fma(_819, _799, _841);
    float _855 = fma(_813, _799, _843);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _865 = fma(_837, _701, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _867 = fma(_847, _701, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _873 = fma(_851, _775, _849);
    float _875 = fma(_859, _745, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _877 = fma(_863, _745, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _879 = fma(_871, _745, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _881 = fma(_865, _775, _853);
    float _883 = fma(_867, _775, _855);
    float _885 = fma(_875, _781, _873);
    float _887 = fma(_877, _781, _881);
    float _889 = fma(_879, _781, _883);
    float _891 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[147].x, _885);
    float _893 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[147].y, _887);
    float _895 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[147].z, _889);
    bool _897 = !_687;
    float _915;
    if (!_897)
    {
        float _899 = in.m_55.x;
        float _901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _903 = _899 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _905 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[11].x, _139);
        float _907 = _905 * _901;
        float _909 = floor(_907);
        float _911 = -_909;
        float _913 = _907 + _911;
        _915 = _913;
        _917 = true;
    }
    else
    {
        float _919 = float(_105);
        float _921 = 1.0 / _919;
        float _923 = _139 * _921;
        _915 = _923;
    }
    _917 = false;
    float _925 = _915;
    float _927 = in.m_53.x;
    float _929 = in.m_53.y;
    float _931 = in.m_53.z;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _935 = _925 + _933;
    bool _937 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _939 = isnan(_925);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _949;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _957 = 1.0 / _951;
    bool _959 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _961 = 1.0 / _955;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _963;
    float _967 = _935 * _957;
    bool _969 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _971 = isnan(_925);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    float _981 = _893 * _929;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _985 = _925 + _983;
    bool _987 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _989 = isnan(_925);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = _895 * _931;
    float _1001 = -_979;
    float _1003 = _1001 + 1.0;
    float _1005 = fma(_965, _967, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1007 = _985 * _961;
    float _1009 = _997 * _1003;
    float _1011 = -_997;
    float _1013 = _1011 + 1.0;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1015;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1019;
    float _1023 = _891 * _927;
    float _1025 = _947 * _1013;
    float _1027 = fma(_1017, _967, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1029 = fma(_1021, _967, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1031 = -_947;
    float _1033 = _1031 + 1.0;
    float _1035 = _1005 * _1025;
    float _1037 = _1027 * _1025;
    float _1039 = _1029 * _1025;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1043 = _1041 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1047 = _1045 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1051 = _1049 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1053 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1037);
    float _1055 = fma(_1043, _1007, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1057 = fma(_1047, _1007, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1059 = fma(_1051, _1007, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1061 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1035);
    float _1063 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1039);
    float _1065 = fma(_1055, _1009, _1053);
    float _1067 = fma(_1057, _1009, _1061);
    float _1069 = fma(_1059, _1009, _1063);
    float _1071 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1065);
    float _1073 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1067);
    float _1075 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1069);
    bool _1077 = !_959;
    float _1095;
    if (!_1077)
    {
        float _1079 = in.m_55.x;
        float _1081 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1083 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _1087 = _1085 * _1081;
        float _1089 = floor(_1087);
        float _1091 = -_1089;
        float _1093 = _1087 + _1091;
        _1095 = _1093;
        _1097 = true;
    }
    else
    {
        float _1099 = float(_105);
        float _1101 = 1.0 / _1099;
        float _1103 = _139 * _1101;
        _1095 = _1103;
    }
    _1097 = false;
    float _1105 = _1095;
    bool _1107 = _1105 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1109 = isnan(_1105);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1121 = _1119 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1123 = _1105 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1125 = isnan(_1105);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1131 = _1127 || _1129;
    float _1133 = float(_1131);
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1141 = _1105 + _1139;
    float _1143 = -_1117;
    float _1145 = _1143 + 1.0;
    bool _1147 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1149 = 1.0 / _1121;
    float _1151 = _1133 * _1145;
    float _1153 = -_1133;
    float _1155 = _1153 + 1.0;
    float _1157 = _1137 * _1149;
    float _1159 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1161 = fma(_1157, _1141, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1163 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1165 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1167 = _1161 * _1151;
    float _1169 = _1071 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1171 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1173 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1167);
    float _1175 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1177 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1173);
    float _1179 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _1175;
    out.m_57.y = _1171;
    out.m_57.z = _1165;
    out.m_57.w = _1179;
    bool _1181 = !_1147;
    float _1199;
    if (!_1181)
    {
        float _1183 = in.m_55.x;
        float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1187 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _1191 = _1189 * _1185;
        float _1193 = floor(_1191);
        float _1195 = -_1193;
        float _1197 = _1191 + _1195;
        _1199 = _1197;
        _1201 = true;
    }
    else
    {
        float _1203 = float(_105);
        float _1205 = 1.0 / _1203;
        float _1207 = _139 * _1205;
        _1199 = _1207;
    }
    _1201 = false;
    float _1209 = _1199;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1213 = _1209 + _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1217 = _1215 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1219 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1221 = isnan(_1209);
    bool _1223 = _1219 || _1221;
    bool _1225 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1227 = _1223 || _1225;
    float _1229 = float(_1227);
    float _1231 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1233 = _1231 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1235 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1237 = isnan(_1209);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1243 = _1239 || _1241;
    float _1245 = float(_1243);
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1247;
    bool _1251 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1253 = isnan(_1209);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1259 = _1255 || _1257;
    float _1261 = float(_1259);
    float _1263 = 1.0 / _1217;
    float _1265 = -_1229;
    float _1267 = _1265 + 1.0;
    bool _1269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1271 = 1.0 / _1233;
    float _1273 = _1249 * _1263;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1277 = _1275 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1279 = fma(_1273, _1213, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1281 = _1245 * _1267;
    float _1283 = -_1261;
    float _1285 = _1283 + 1.0;
    float _1287 = -_1245;
    float _1289 = _1287 + 1.0;
    float _1291 = _1277 * _1271;
    float _1293 = _1279 * _1281;
    float _1295 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1297 = _1209 + _1295;
    float _1299 = _1229 * _1285;
    float _1301 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1293);
    float _1303 = fma(_1291, _1297, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1305 = fma(_1303, _1299, _1301);
    float _1307 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1305);
    float _1309 = _1307 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.w = _1309;
    bool _1311 = !_1269;
    float _1329;
    if (!_1311)
    {
        float _1313 = in.m_55.x;
        float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1317 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1319 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[14].x, _139);
        float _1321 = _1319 * _1315;
        float _1323 = floor(_1321);
        float _1325 = -_1323;
        float _1327 = _1321 + _1325;
        _1329 = _1327;
        _1331 = true;
    }
    else
    {
        float _1333 = float(_105);
        float _1335 = 1.0 / _1333;
        float _1337 = _139 * _1335;
        _1329 = _1337;
    }
    _1331 = false;
    float _1339 = _1329;
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1343 = _1339 + _1341;
    bool _1345 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1347 = isnan(_1339);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1353 = _1349 || _1351;
    float _1355 = float(_1353);
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1361 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1363 = isnan(_1339);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1369 = _1365 || _1367;
    float _1371 = float(_1369);
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1373;
    bool _1377 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1379 = isnan(_1339);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1385 = _1381 || _1383;
    float _1387 = float(_1385);
    float _1389 = -_1355;
    float _1391 = _1389 + 1.0;
    float _1393 = 1.0 / _1359;
    bool _1395 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1397 = isnan(_1339);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1403 = _1399 || _1401;
    float _1405 = float(_1403);
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1411 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1413 = 1.0 / _1409;
    float _1415 = _1375 * _1393;
    float _1417 = -_1371;
    float _1419 = _1417 + 1.0;
    float _1421 = _1371 * _1391;
    bool _1423 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1425 = isnan(_1339);
    bool _1427 = _1423 || _1425;
    bool _1429 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1431 = _1427 || _1429;
    float _1433 = float(_1431);
    float _1435 = fma(_1415, _1343, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1437 = _1387 * _1419;
    float _1439 = -_1387;
    float _1441 = _1439 + 1.0;
    float _1443 = -_1433;
    float _1445 = _1443 + 1.0;
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1449 = _1447 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1451 = _1433 * _1441;
    bool _1453 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1455 = isnan(_1339);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1461 = _1457 || _1459;
    float _1463 = float(_1461);
    float _1465 = -_1405;
    float _1467 = _1465 + 1.0;
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1473 = _1405 * _1445;
    bool _1475 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1477 = isnan(_1339);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1483 = _1479 || _1481;
    float _1485 = float(_1483);
    float _1487 = _1463 * _1467;
    float _1489 = -_1463;
    float _1491 = _1489 + 1.0;
    float _1493 = 1.0 / _1471;
    float _1495 = _1485 * _1491;
    float _1497 = -_1485;
    float _1499 = _1497 + 1.0;
    float _1501 = _1435 * _1495;
    float _1503 = 1.0 / _1449;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1507 = _1505 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1511 = _1509 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1515 = _1513 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1517;
    float _1521 = _1511 * _1413;
    float _1523 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1501);
    float _1525 = 1.0 / _1507;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1529 = _1339 + _1527;
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1533 = _1531 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1535 = _1519 * _1493;
    float _1537 = fma(_1521, _1529, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1541 = _1339 + _1539;
    float _1543 = 1.0 / _1515;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1549 = fma(_1535, _1541, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1551 = fma(_1537, _1487, _1523);
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1553;
    float _1557 = _1547 * _1503;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1561 = _1339 + _1559;
    float _1563 = fma(_1549, _1473, _1551);
    float _1565 = 1.0 / _1533;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1569 = _1567 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1571 = _1555 * _1525;
    float _1573 = fma(_1557, _1561, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1577 = _1339 + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1581 = _1339 + _1579;
    float _1583 = _1569 * _1543;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1585;
    bool _1589 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1591 = isnan(_1339);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1597 = _1593 || _1595;
    float _1599 = float(_1597);
    float _1601 = fma(_1571, _1577, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1603 = fma(_1573, _1451, _1563);
    float _1605 = fma(_1583, _1581, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1609 = _1339 + _1607;
    float _1611 = -_1599;
    float _1613 = _1611 + 1.0;
    float _1615 = _1587 * _1565;
    float _1617 = fma(_1601, _1437, _1603);
    float _1619 = _1355 * _1613;
    float _1621 = fma(_1615, _1609, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1623 = fma(_1605, _1421, _1617);
    float _1625 = fma(_1621, _1619, _1623);
    float _1627 = fma(_1599, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1625);
    float _1629 = precise::clamp(_1627, 0.0, 1.0);
    bool _1631 = !_1411;
    float _1649;
    if (!_1631)
    {
        float _1633 = in.m_55.x;
        float _1635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1637 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[14].z, _139);
        float _1641 = _1639 * _1635;
        float _1643 = floor(_1641);
        float _1645 = -_1643;
        float _1647 = _1641 + _1645;
        _1649 = _1647;
        _1651 = true;
    }
    else
    {
        float _1653 = float(_105);
        float _1655 = 1.0 / _1653;
        float _1657 = _139 * _1655;
        _1649 = _1657;
    }
    _1651 = false;
    float _1659 = _1649;
    int _1661 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1663 = _1661;
    int _1665 = 0;
    int _1667 = _96(_1663, _1665, (*spvDescriptorSet0.support_buffer));
    float _1669 = in.m_61.z;
    float _1671 = trunc(_1669);
    int _1673 = int(_1671);
    int _1675 = _1667 + (-1);
    float _1677 = float(_1675);
    float _1679 = _1629 * _1677;
    float _1681 = trunc(_1679);
    int _1683 = int(_1681);
    int _1685 = _1683;
    int _1687 = 0;
    int _1689 = _97(_1685, _1687, (*spvDescriptorSet0.support_buffer));
    int _1691 = _1673;
    int _1693 = 0;
    int _1695 = _97(_1691, _1693, (*spvDescriptorSet0.support_buffer));
    float4 _1698 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1689, _1695)), 0).xyzw;
    float _1700 = _1698.x;
    float _1702 = _1698.y;
    float _1704 = _1698.z;
    float _1706 = _1698.w;
    float _1708 = in.m_55.w;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1712 = _1710 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1722 = 1.0 / _1712;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    int _1728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1730 = _1728 != 0;
    float _1732 = 1.0 / _1716;
    bool _1734 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1736 = isnan(_1659);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1742 = _1738 || _1740;
    float _1744 = float(_1742);
    int _1746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1748 = _1746 != 0;
    int _1750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1752 = _1750 != 0;
    float _1754 = -_1744;
    float _1756 = _1754 + 1.0;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1760 = _1758 != 0;
    float _1762 = 1.0 / _1720;
    bool _1764 = _1708 > 0.5;
    bool _1766 = _1764 && _1730;
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1768;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1774 = _1772 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _1776 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1778 = isnan(_1659);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1788;
    float _1792 = _1770 * _1722;
    float _1794 = 1.0 / _1726;
    bool _1796 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1798 = isnan(_1659);
    bool _1800 = _1796 || _1798;
    bool _1802 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1804 = _1800 || _1802;
    float _1806 = float(_1804);
    float _1808 = _1774 * _1732;
    float _1810 = _1786 * _1756;
    float _1812 = -_1786;
    float _1814 = _1812 + 1.0;
    bool _1816 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1818 = isnan(_1659);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1824 = _1820 || _1822;
    float _1826 = float(_1824);
    float _1828 = -_1806;
    float _1830 = _1828 + 1.0;
    bool _1832 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1834 = isnan(_1659);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    float _1844 = _1790 * _1762;
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1848 = _1846 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1850 = _1806 * _1814;
    float _1852 = _1826 * _1830;
    float _1854 = -_1826;
    float _1856 = _1854 + 1.0;
    float _1858 = -_1842;
    float _1860 = _1858 + 1.0;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1864 = _1862 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1866 = _1848 * _1794;
    bool _1868 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1870 = isnan(_1659);
    bool _1872 = _1868 || _1870;
    bool _1874 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1876 = _1872 || _1874;
    float _1878 = float(_1876);
    float _1880 = _1842 * _1856;
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1884 = _1659 + _1882;
    bool _1886 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1888 = isnan(_1659);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1894 = _1890 || _1892;
    float _1896 = float(_1894);
    float _1898 = _1878 * _1860;
    float _1900 = -_1878;
    float _1902 = _1900 + 1.0;
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1906 = _1904 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1908 = fma(_1792, _1884, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1912 = _1659 + _1910;
    float _1914 = _1896 * _1902;
    float _1916 = 1.0 / _1906;
    float _1918 = fma(_1808, _1912, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1920 = _1908 * _1914;
    float _1922 = -_1896;
    float _1924 = _1922 + 1.0;
    float _1926 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1928 = _1926 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1930 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1932 = _1930 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1934 = in.m_61.x;
    float _1936 = 1.0 / _1864;
    float _1938 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1920);
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1942 = _1659 + _1940;
    float _1944 = in.m_61.y;
    float _1946 = fma(_1844, _1942, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1948 = fma(_1918, _1898, _1938);
    float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1952 = _1659 + _1950;
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1954;
    float _1958 = 1.0 / _1928;
    float _1960 = _1932 * _1916;
    float _1962 = fma(_1866, _1952, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1964 = _1916;
    float _1966 = _1744;
    float _1968 = _1810;
    int _1970 = as_type<int>(_1659);
    int _1972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[182].x);
    if (_1748)
    {
        float _1974 = in.m_55.x;
        _1964 = _1974;
    }
    float _1976 = _1964;
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1978;
    float _1982 = fma(_1946, _1880, _1948);
    float _1984 = _1956 * _1936;
    float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1988 = _1659 + _1986;
    float _1990 = _1938;
    if (_1752)
    {
        float _1992 = in.m_55.z;
        _1990 = _1992;
    }
    float _1994 = _1990;
    bool _1996 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1998 = isnan(_1659);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2004 = _2000 || _2002;
    float _2006 = float(_2004);
    float _2008 = fma(_1962, _1852, _1982);
    float _2010 = fma(_1984, _1988, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2012 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2014 = _1659 + _2012;
    float _2016 = in.m_55.y;
    float _2018 = -_2006;
    float _2020 = _2018 + 1.0;
    float _2022 = fma(_2010, _1850, _2008);
    float _2024 = _1980 * _1958;
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2028 = _1659 + _2026;
    float _2030 = _1744 * _2020;
    int _2032 = as_type<int>(_2022);
    if (!_1748)
    {
        _1966 = _1934;
    }
    float _2034 = _1966;
    float _2036 = -_1944;
    float _2038 = _2036 + 1.0;
    float _2040 = fma(_1960, _2028, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2042 = fma(_2024, _2014, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2044 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2046 = fma(_2040, _1810, _2022);
    float _2048 = _2034;
    if (!_1748)
    {
        _1968 = _2034;
    }
    float _2050 = _1968;
    float _2052 = _2050;
    if (_1748)
    {
        _2048 = _1934;
    }
    float _2054 = _2048;
    float _2056 = fma(_2042, _2030, _2046);
    float _2058 = _1766 ? _2038 : _1944;
    bool _2060 = false;
    float _2062 = _2054;
    if (_1748)
    {
        bool _2064 = _1976 > 0.5;
        _2060 = _2064;
    }
    bool _2066 = _2060;
    if (_1748)
    {
        float _2068 = -_2054;
        float _2070 = _2068 + 1.0;
        _1970 = as_type<int>(_2070);
    }
    int _2072 = _1970;
    if (_1752)
    {
        float _2074 = -_2054;
        float _2076 = _2074 + 1.0;
        _2032 = as_type<int>(_2076);
    }
    int _2078 = _2032;
    bool _2080 = false;
    if (_1752)
    {
        bool _2082 = _1994 > 0.5;
        _2080 = _2082;
    }
    bool _2084 = _2080;
    float _2086 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2056);
    bool _2088 = _2016 > 0.5;
    bool _2090 = _2088 && _1760;
    float _2092 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1748)
    {
        float _2094 = _2066 ? as_type<float>(_2072) : _2054;
        _2052 = _2094;
    }
    float _2096 = _2052;
    float _2098 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2100 = _1683 + 1;
    out.m_63.x = _2086;
    if (_1752)
    {
        float _2102 = _2084 ? as_type<float>(_2078) : _2054;
        _2062 = _2102;
    }
    float _2104 = _2062;
    int _2106 = min(_1675, _2100);
    float _2108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2110 = _2090 ? _2038 : _1944;
    float _2112 = _2110 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2116 = _2112 * _2108;
    float _2118 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2120 = _2118 * _2092;
    float _2122 = _2098 * _2114;
    uint _2125 = as_type<uint>(half2(float2(_1706, 0.0)));
    uint _2127 = extract_bits(_2125, 0u, 8u);
    int _2129 = int(_2127) & 255;
    uint _2131 = extract_bits(_2125, 8u, 8u);
    int _2133 = int(_2131) & 255;
    int _2135 = _2133 << 8;
    int _2137 = _2129 | _2135;
    bool _2139 = _2137 >= 32768;
    int _2141 = _2137 + (-1024);
    int _2143 = _2141;
    if (_2139)
    {
        int _2145 = ~_2137;
        int _2147 = _2145 + 33792;
        int _2149 = _2147 + 1;
        _2143 = _2149;
    }
    int _2151 = _2143;
    int _2153 = _2151 + 30719;
    float _2155 = float(_2153);
    float _2157 = fma(_2155, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2159 = abs(_2157);
    float _2161 = -_2159;
    float _2163 = _2161 + 1.0;
    float _2165 = abs(_2157);
    float _2167 = fma(_2165, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2169 = as_type<int>(_2163) + (-218103808);
    float _2171 = abs(_2157);
    float _2173 = fma(_2171, _2167, -0.212114393711090087890625);
    bool _2175 = uint(_2169) >= 1920991232u;
    float _2177 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2179 = _2157 < 0.0;
    float _2181 = float(_2179);
    float _2183 = _2177 * _2044;
    float _2185 = abs(_2157);
    float _2187 = fma(_2185, _2173, 1.570728778839111328125);
    bool _2189 = !_2175;
    float _2211;
    if (!_2189)
    {
        int _2191 = as_type<int>(_2163);
        int _2193 = as_type<int>(_1944);
        int _2195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[182].x);
        int _2197 = 11088;
        int _2199;
        int _2201;
        int _2203;
        int _2205;
        int _2207;
        int _2209;
        _94(_2191, _2193, _2195, _2197, _2199, _2201, _2203, _2205, _2207, _2209, out.gl_Position, out.gl_PointSize);
        _2211 = as_type<float>(_2203);
        _1972 = _2205;
        _2213 = true;
    }
    else
    {
        float _2215 = rsqrt(_2163);
        float _2217 = _2163 * _2215;
        float _2219 = _2215 * 0.5;
        float _2221 = -_2217;
        float _2223 = 0.0 + _2221;
        float _2225 = fma(_2219, _2223, 0.5);
        float _2227 = fma(_2217, _2225, _2217);
        float _2229 = -_2227;
        float _2231 = 0.0 + _2229;
        float _2233 = fma(_2227, _2231, _2163);
        float _2235 = fma(_2219, _2233, _2227);
        _2211 = _2235;
    }
    _2213 = false;
    float _2237 = _2211;
    int _2239 = _1972;
    int _2241 = _2106;
    int _2243 = 0;
    int _2245 = _97(_2241, _2243, (*spvDescriptorSet0.support_buffer));
    int _2247 = _1673;
    int _2249 = 0;
    int _2251 = _97(_2247, _2249, (*spvDescriptorSet0.support_buffer));
    float4 _2253 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2245, _2251)), 0).xyzw;
    float _2255 = _2253.x;
    float _2257 = _2253.y;
    float _2259 = _2253.z;
    float _2261 = _2253.w;
    float _2263 = _2187 * _2237;
    float _2265 = _2181 * 2.0;
    float _2267 = _2155 * 3.883221149444580078125;
    float _2269 = floor(_1679);
    float _2271 = -_2265;
    float _2273 = fma(_2263, _2271, _2263);
    float _2275 = _2267 * 0.15915493667125701904296875;
    float _2277 = fma(_2181, 3.1415927410125732421875, _2273);
    float _2279 = _2275 * 6.283185482025146484375;
    float _2281 = cos(_2279);
    float _2283 = _2277 * 0.15915493667125701904296875;
    float _2285 = _2283 * 6.283185482025146484375;
    float _2287 = sin(_2285);
    float _2289 = -_2269;
    float _2291 = _1679 + _2289;
    float _2293 = _2275 * 6.283185482025146484375;
    float _2295 = sin(_2293);
    float _2297 = _2287 * _2281;
    float _2299 = _2287 * _2295;
    uint _2301 = as_type<uint>(half2(float2(_2261, 0.0)));
    float _2303 = -_1700;
    float _2305 = _2303 + _2255;
    float _2307 = -_1704;
    float _2309 = _2307 + _2259;
    uint _2311 = extract_bits(_2301, 0u, 8u);
    int _2313 = int(_2311) & 255;
    uint _2315 = extract_bits(_2301, 8u, 8u);
    int _2317 = int(_2315) & 255;
    int _2319 = _2317 << 8;
    int _2321 = _2313 | _2319;
    float _2323 = fma(_2291, _2305, _1700);
    float _2325 = fma(_2291, _2309, _1704);
    bool _2327 = _2321 >= 32768;
    int _2329 = _2321 + (-1024);
    int _2331 = _2329;
    if (_2327)
    {
        int _2333 = ~_2321;
        int _2335 = _2333 + 33792;
        int _2337 = _2335 + 1;
        _2331 = _2337;
    }
    int _2339 = _2331;
    int _2341 = _2339 + 30719;
    float _2343 = float(_2341);
    float _2345 = fma(_2343, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2347 = abs(_2345);
    float _2349 = -_2347;
    float _2351 = _2349 + 1.0;
    float _2353 = abs(_2345);
    float _2355 = fma(_2353, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _2357 = -_1702;
    float _2359 = _2357 + _2257;
    int _2361 = as_type<int>(_2351) + (-218103808);
    float _2363 = abs(_2345);
    float _2365 = fma(_2363, _2355, -0.212114393711090087890625);
    float _2367 = fma(_2291, _2359, _1702);
    bool _2369 = _2345 < 0.0;
    float _2371 = float(_2369);
    bool _2373 = uint(_2361) >= 1920991232u;
    float _2375 = abs(_2345);
    float _2377 = fma(_2375, _2365, 1.570728778839111328125);
    bool _2379 = !_2373;
    float _2401;
    if (!_2379)
    {
        int _2381 = as_type<int>(_2351);
        int _2383 = as_type<int>(_2351);
        int _2385 = _2239;
        int _2387 = 11984;
        int _2389;
        int _2391;
        int _2393;
        int _2395;
        int _2397;
        int _2399;
        _94(_2381, _2383, _2385, _2387, _2389, _2391, _2393, _2395, _2397, _2399, out.gl_Position, out.gl_PointSize);
        _2401 = as_type<float>(_2393);
        _2403 = true;
    }
    else
    {
        float _2405 = rsqrt(_2351);
        float _2407 = _2351 * _2405;
        float _2409 = _2405 * 0.5;
        float _2411 = -_2407;
        float _2413 = 0.0 + _2411;
        float _2415 = fma(_2409, _2413, 0.5);
        float _2417 = fma(_2407, _2415, _2407);
        float _2419 = -_2417;
        float _2421 = 0.0 + _2419;
        float _2423 = fma(_2417, _2421, _2351);
        float _2425 = fma(_2409, _2423, _2417);
        _2401 = _2425;
    }
    _2403 = false;
    float _2427 = _2401;
    float _2429 = in.m_55.x;
    float _2431 = in.m_55.y;
    float _2433 = in.m_55.z;
    float _2435 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2437 = log2(_2435);
    float _2439 = _613 * _613;
    float _2441 = _2377 * _2427;
    int _2443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2445 = _2443 != 0;
    int _2447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2449 = _2447 != 0;
    int _2451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2453 = _2451 != 0;
    float _2455 = fma(_615, _615, _2439);
    float _2457 = _999 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2459 = _2343 * 3.883221149444580078125;
    float _2461 = fma(_617, _617, _2455);
    float _2463 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2465 = _2459 * 0.15915493667125701904296875;
    float _2467 = rsqrt(_2461);
    float _2469 = -_2157;
    float _2471 = _2469 + _2345;
    float _2473 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2475 = _2433 * 2.0;
    float _2477 = _2429 * 2.0;
    float _2479 = _2431 * 2.0;
    float _2481 = floor(_2477);
    float _2483 = _2467 * _615;
    float _2485 = _2467 * _613;
    float _2487 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2489 = _2483 * _2487;
    float _2491 = floor(_2475);
    float _2493 = _2429 + _2433;
    float _2495 = _2493 + (-1.0);
    float _2497 = floor(_2479);
    bool _2499 = _2481 >= 0.0;
    bool _2501 = isnan(_2481);
    bool _2503 = _2499 || _2501;
    bool _2505 = isnan(0.0);
    bool _2507 = _2503 || _2505;
    int _2509 = _2507 ? 0 : 1;
    bool _2511 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2513 = isnan(0.0);
    bool _2515 = _2511 || _2513;
    bool _2517 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2519 = _2515 || _2517;
    bool _2521 = _2491 > 0.0;
    float _2523 = _2437 * _139;
    bool _2525 = _2491 >= 0.0;
    bool _2527 = isnan(_2491);
    bool _2529 = _2525 || _2527;
    bool _2531 = isnan(0.0);
    bool _2533 = _2529 || _2531;
    float _2535 = _2431 + _2429;
    float _2537 = fma(_2495, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2539 = _2535 + (-1.0);
    int _2541 = _2533 ? 0 : 1;
    bool _2543 = _2481 > 0.0;
    float _2545 = fma(_2539, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2547 = ~_2541;
    int _2549 = _2547 + 1;
    int _2551 = _2549 + 1;
    float _2553 = exp2(_2523);
    int _2555 = _2551;
    if (!_2521)
    {
        int _2557 = ~_2541;
        int _2559 = _2557 + 1;
        _2555 = _2559;
    }
    int _2561 = _2555;
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2565 = 1.0 + _2563;
    bool _2567 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2569 = isnan(1.0);
    bool _2571 = _2567 || _2569;
    bool _2573 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2575 = _2571 || _2573;
    bool _2577 = !_2445;
    int _2579 = _2577 ? 0 : 1;
    bool _2581 = _2497 > 0.0;
    float _2583 = 1.0 / _2565;
    bool _2585 = _2497 >= 0.0;
    bool _2587 = isnan(_2497);
    bool _2589 = _2585 || _2587;
    bool _2591 = isnan(0.0);
    bool _2593 = _2589 || _2591;
    float _2595 = _2467 * _617;
    int _2597 = abs(_2579);
    float _2599 = float(_2561);
    float _2601 = float(_2597);
    float _2603 = -_2553;
    float _2605 = _2603 + 1.0;
    int _2607 = _2593 ? 0 : 1;
    float _2609 = in.m_65.x;
    float _2611 = in.m_65.y;
    float _2613 = in.m_65.z;
    bool _2615 = !_2453;
    int _2617 = _2615 ? 0 : 1;
    float _2619 = _2601 * _2599;
    float _2621 = _2519 ? _2605 : 0.0;
    float _2623 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2625 = _2485 * _2623;
    int _2627 = ~_2509;
    int _2629 = _2627 + 1;
    int _2631 = _2629 + 1;
    float _2633 = _2619 * (-2.0);
    int _2635 = ~_2607;
    int _2637 = _2635 + 1;
    int _2639 = _2637 + 1;
    int _2641 = _2631;
    int _2643 = _2639;
    if (_2575)
    {
        float _2645 = _2621 * _2583;
        _145 = _2645;
    }
    float _2647 = _145;
    if (!_2543)
    {
        int _2649 = ~_2509;
        int _2651 = _2649 + 1;
        _2641 = _2651;
    }
    int _2653 = _2641;
    float _2655 = _2429 + (-0.5);
    if (!_2581)
    {
        int _2657 = ~_2607;
        int _2659 = _2657 + 1;
        _2643 = _2659;
    }
    int _2661 = _2643;
    float _2663 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2665 = _2595 * _2663;
    int _2667 = abs(_2617);
    float _2669 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2671 = -_2625;
    float _2673 = fma(_2595, _2669, _2671);
    float _2675 = float(_2661);
    float _2677 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2679 = -_2665;
    float _2681 = fma(_2483, _2677, _2679);
    float _2683 = float(_2667);
    float _2685 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2687 = -_2489;
    float _2689 = fma(_2485, _2685, _2687);
    bool _2691 = !_2449;
    int _2693 = _2691 ? 0 : 1;
    float _2695 = _2681 * _2681;
    float _2697 = float(_2653);
    float _2699 = _2683 * _2675;
    bool _2701 = _2367 != 0.0;
    bool _2703 = isnan(_2367);
    bool _2705 = _2701 || _2703;
    bool _2707 = isnan(0.0);
    bool _2709 = _2705 || _2707;
    float _2711 = fma(_2633, _2609, _2609);
    float _2713 = fma(_2545, _2633, _2545);
    int _2715 = abs(_2693);
    float _2717 = _2699 * (-2.0);
    float _2719 = fma(_2655, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2711);
    float _2721 = fma(_2673, _2673, _2695);
    bool _2723 = _2323 == 0.0;
    bool _2725 = !_2709;
    bool _2727 = _2723 && _2725;
    float _2729 = fma(_2537, _2717, _2537);
    float _2731 = fma(_2713, _2647, _2719);
    float _2733 = _2433 + (-0.5);
    float _2735 = fma(_2689, _2689, _2721);
    bool _2737 = _2325 == 0.0;
    bool _2739 = _2737 && _2727;
    float _2741 = _2731 * 0.15915493667125701904296875;
    float _2743 = float(_2715);
    float _2745 = fma(_2717, _2613, _2613);
    float _2747 = rsqrt(_2735);
    float _2749 = fma(_2733, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2745);
    float _2751 = _2743 * _2697;
    float _2753 = _2431 + _2433;
    float _2755 = _2431 + (-0.5);
    float _2757 = _2751 * (-2.0);
    float _2759 = _2753 + (-1.0);
    float _2761 = fma(_2729, _2647, _2749);
    float _2763 = _2741 * 6.283185482025146484375;
    float _2765 = sin(_2763);
    float _2767 = fma(_2757, _2611, _2611);
    float _2769 = fma(_2759, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2771 = _2761 * 0.15915493667125701904296875;
    float _2773 = fma(_2755, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2767);
    float _2775 = fma(_2769, _2757, _2769);
    float _2777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2367);
    float _2779 = _2741 * 6.283185482025146484375;
    float _2781 = cos(_2779);
    float _2783 = _2689 * _2747;
    float _2785 = fma(_2775, _2647, _2773);
    float _2787 = _981 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2789 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2325);
    float _2791 = _2371 * 2.0;
    float _2793 = _2785 * 0.15915493667125701904296875;
    float _2795 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2797 = _2771 * 6.283185482025146484375;
    float _2799 = sin(_2797);
    float _2801 = _2457 * _2789;
    float _2803 = _2681 * _2747;
    float _2805 = -_2791;
    float _2807 = fma(_2441, _2805, _2441);
    float _2809 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2323);
    float _2811 = _2787 * _2777;
    float _2813 = _2673 * _2747;
    float _2815 = fma(_2371, 3.1415927410125732421875, _2807);
    float _2817 = _2771 * 6.283185482025146484375;
    float _2819 = cos(_2817);
    float _2821 = _2795 * _2809;
    float _2823 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2825 = _2793 * 6.283185482025146484375;
    float _2827 = sin(_2825);
    float _2829 = _2781 * _2799;
    float _2831 = _2765 * _2799;
    float _2833 = _2793 * 6.283185482025146484375;
    float _2835 = cos(_2833);
    float _2837 = _2781 * _2819;
    float _2839 = _2765 * _2819;
    float _2841 = -_2829;
    float _2843 = fma(_2827, _2839, _2841);
    float _2845 = fma(_2827, _2831, _2837);
    float _2847 = -_2839;
    float _2849 = fma(_2827, _2829, _2847);
    float _2851 = fma(_2827, _2837, _2831);
    float _2853 = _2485 * _2783;
    float _2855 = _2845 * _2483;
    float _2857 = _2849 * _2483;
    float _2859 = _2845 * _2595;
    float _2861 = _2835 * _2799;
    float _2863 = _2781 * _2835;
    float _2865 = _2835 * _2819;
    float _2867 = _2765 * _2835;
    float _2869 = _2861 * _2483;
    float _2871 = -_2853;
    float _2873 = fma(_2595, _2803, _2871);
    float _2875 = fma(_2843, _2813, _2855);
    float _2877 = fma(_2851, _2813, _2857);
    float _2879 = fma(_2865, _2813, _2869);
    float _2881 = _2849 * _2595;
    float _2883 = fma(_2867, _2873, _2875);
    float _2885 = fma(_2863, _2873, _2877);
    float _2887 = -_2827;
    float _2889 = fma(_2887, _2873, _2879);
    float _2891 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2463);
    float _2893 = _2483 * _2803;
    float _2895 = _2861 * _2595;
    float _2897 = fma(_2851, _2783, _2881);
    float _2899 = _2815 * 0.15915493667125701904296875;
    float _2901 = -_2893;
    float _2903 = fma(_2485, _2813, _2901);
    float _2905 = fma(_2843, _2783, _2859);
    float _2907 = fma(_2865, _2783, _2895);
    float _2909 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2823);
    float _2911 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2891);
    float _2913 = fma(_2867, _2903, _2905);
    float _2915 = fma(_2863, _2903, _2897);
    float _2917 = -_2827;
    float _2919 = fma(_2917, _2903, _2907);
    float _2921 = _2811 * _2883;
    float _2923 = _2811 * _2913;
    float _2925 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2909);
    float _2927 = _2465 * 6.283185482025146484375;
    float _2929 = sin(_2927);
    float _2931 = fma(_2821, _2889, _2921);
    float _2933 = fma(_2821, _2919, _2923);
    float _2935 = _2911 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2937 = _2925 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2939 = fma(_2801, _2885, _2931);
    float _2941 = fma(_2801, _2915, _2933);
    float _2943 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2473);
    float _2945 = _2899 * 6.283185482025146484375;
    float _2947 = sin(_2945);
    float _2949 = _2935 + _2939;
    float _2951 = _2937 + _2941;
    float _2953 = _2595 * _2813;
    float _2955 = _2845 * _2485;
    float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2959 = _2949 + _2957;
    float _2961 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2963 = _2951 + _2961;
    float _2965 = _2861 * _2485;
    float _2967 = -_2953;
    float _2969 = fma(_2483, _2783, _2967);
    float _2971 = _2959 * _2959;
    float _2973 = _2963 * _2963;
    float _2975 = fma(_2843, _2803, _2955);
    float _2977 = fma(_2865, _2803, _2965);
    float _2979 = _2849 * _2485;
    float _2981 = _2971 + _2973;
    float _2983 = fma(_2867, _2969, _2975);
    float _2985 = -_2299;
    float _2987 = fma(_2947, _2929, _2985);
    float _2989 = fma(_2291, _2471, _2157);
    float _2991 = _2465 * 6.283185482025146484375;
    float _2993 = cos(_2991);
    float _2995 = fma(_2851, _2803, _2979);
    float _2997 = fma(_2291, _2987, _2299);
    float _2999 = fma(_2367, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2989);
    float _3001 = -_2827;
    float _3003 = fma(_3001, _2969, _2977);
    float _3005 = _2811 * _2983;
    float _3007 = fma(_2325, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2997);
    float _3009 = fma(_2863, _2969, _2995);
    float _3011 = sqrt(_2981);
    float _3013 = _2739 ? _2989 : _2999;
    float _3015 = fma(_2821, _3003, _3005);
    float _3017 = _2739 ? _2997 : _3007;
    float _3019 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2943);
    float _3021 = _3013 * _3013;
    float _3023 = fma(_2801, _3009, _3015);
    float _3025 = _3019 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3027 = -_2297;
    float _3029 = fma(_2947, _2993, _3027);
    float _3031 = fma(_3017, _3017, _3021);
    float _3033 = _3025 + _3023;
    float _3035 = fma(_2291, _3029, _2297);
    float _3037 = rsqrt(_3031);
    bool _3039 = _3011 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3041 = _2971;
    float _3043 = _2973;
    float _3045 = _2981;
    float _3047 = _2949;
    float _3049 = _2951;
    float _3051 = _2989;
    float _3053 = _3035;
    if (!_3039)
    {
        _443 = _3033;
    }
    float _3055 = _443;
    bool _3057 = !_3039;
    float _3059 = _3055;
    if (!_3057)
    {
        float _3061 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3063 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3065 = _3011 + _3063;
        float _3067 = rsqrt(_2981);
        float _3069 = _3065 * _3061;
        float _3071 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3073 = _3069 * 0.15915493667125701904296875;
        float _3075 = _3073 * 6.283185482025146484375;
        float _3077 = sin(_3075);
        float _3079 = _3073 * 6.283185482025146484375;
        float _3081 = cos(_3079);
        float _3083 = fma(_3077, _3071, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3085 = _3067 * _3083;
        float _3087 = _3081 + (-1.0);
        float _3089 = _2959 * _3085;
        float _3091 = _2963 * _3085;
        float _3093 = _3087 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3095 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3097 = _3089 * _3089;
        float _3099 = _3091 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3101 = fma(_3033, _3081, _3093);
        float _3103 = _3091 * _3091;
        _3059 = _3101;
        _3041 = _3097;
        _3043 = _3103;
        _3045 = _3067;
        _3047 = _3095;
        _3049 = _3099;
    }
    float _3105 = _3059;
    float _3107 = _3041;
    float _3109 = _3043;
    float _3111 = _3045;
    float _3113 = _3047;
    float _3115 = _3049;
    float _3117 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3119 = _3105 + _3117;
    float _3121 = _3111;
    if (!_2739)
    {
        _3051 = _2999;
    }
    float _3123 = _3051;
    if (!_2739)
    {
        float _3125 = fma(_2323, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3035);
        _3053 = _3125;
    }
    float _3127 = _3053;
    if (_2739)
    {
        _3121 = _2997;
    }
    float _3129 = _3121;
    float _3131 = fma(_3119, _3119, _3107);
    float _3133 = _3013 * _3037;
    float _3135 = _3129;
    if (!_2739)
    {
        _3135 = _3007;
    }
    float _3137 = _3135;
    float _3139 = _2983 * _3123;
    float _3141 = _3131 + _3109;
    float _3143 = _2883 * _3123;
    float _3145 = _2913 * _3123;
    float _3147 = _3017 * _3037;
    float _3149 = -_3133;
    float _3151 = _2915 * _3149;
    float _3153 = fma(_3003, _3127, _3139);
    float _3155 = sqrt(_3141);
    float _3157 = -_3133;
    float _3159 = _2885 * _3157;
    float _3161 = -_3133;
    float _3163 = _3009 * _3161;
    float _3165 = fma(_2889, _3127, _3143);
    float _3167 = fma(_2919, _3127, _3145);
    float _3169 = fma(_2913, _3147, _3151);
    float _3171 = fma(_3009, _3137, _3153);
    float _3173 = fma(_2883, _3147, _3159);
    float _3175 = fma(_2983, _3147, _3163);
    float _3177 = fma(_2885, _3137, _3165);
    float _3179 = fma(_2915, _3137, _3167);
    out.m_67.x = _2183;
    out.m_67.y = _2116;
    out.m_67.z = _2120;
    out.m_67.w = _2122;
    out.m_69.x = _2889;
    out.m_69.y = _3003;
    out.m_69.z = _2919;
    bool _3181 = _3155 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3183 = isnan(_3155);
    bool _3185 = _3181 || _3183;
    bool _3187 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3189 = _3185 || _3187;
    out.m_71.x = _3173;
    out.m_71.y = _3175;
    out.m_71.z = _3169;
    out.m_73.x = _3177;
    out.m_73.y = _3171;
    out.m_73.z = _3179;
    float _3191 = _3147;
    float _3193 = _3173;
    float _3195 = _3177;
    if (!_3189)
    {
        _3191 = 1.0;
    }
    float _3197 = _3191;
    bool _3199 = !_3189;
    float _3201 = _3197;
    if (!_3199)
    {
        bool _3203 = _3155 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3205 = isnan(_3155);
        bool _3207 = _3203 || _3205;
        bool _3209 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3211 = _3207 || _3209;
        if (!_3211)
        {
            float _3213 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3215 = _3155 + _3213;
            float _3217 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3219 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3217;
            float _3221 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3223 = _3221 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3225 = 1.0 / _3219;
            float _3227 = _3215 * _3225;
            float _3229 = fma(_3227, _3223, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3201 = _3229;
            _3231 = true;
        }
        else
        {
            bool _3233 = _3155 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3235 = isnan(_3155);
            bool _3237 = _3233 || _3235;
            bool _3239 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3241 = _3237 || _3239;
            if (!_3241)
            {
                float _3243 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3245 = _3155 + _3243;
                float _3247 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3249 = _3247 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3251 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3253 = _3251 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3255 = 1.0 / _3249;
                float _3257 = _3245 * _3255;
                float _3259 = fma(_3257, _3253, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3201 = _3259;
                _3231 = true;
            }
            else
            {
                _3201 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3231 = false;
    float _3261 = _3201;
    float _3263 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3265 = _3105 + _3263;
    float _3267 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3269 = _3113 + _3267;
    float _3271 = fma(_3265, _3261, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3273 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3275 = _3115 + _3273;
    float _3277 = fma(_3269, _3261, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3279 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3281 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3283 = _3271 + _3281;
    float _3285 = fma(_3275, _3261, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3287 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3289 = _3277 + _3287;
    float _3291 = _3283 * _3283;
    float _3293 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3295 = _3285 + _3293;
    float _3297 = fma(_3289, _3289, _3291);
    float _3299 = fma(_3295, _3295, _3297);
    float _3301 = rsqrt(_3299);
    float _3303 = _3301 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3305 = _3289 * _3303;
    float _3307 = _3295 * _3303;
    float _3309 = _3305 * _3305;
    float _3311 = _3307 * _3307;
    float _3313 = _3309 + _3311;
    float _3315 = sqrt(_3313);
    bool _3317 = _3315 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3321 = _3315 + _3319;
    float _3323 = _3295;
    float _3325 = _3261;
    float _3327 = _3321;
    float _3329 = _3305;
    if (_3317)
    {
        float _3331 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3323 = _3331;
    }
    float _3333 = _3323;
    if (_3317)
    {
        float _3335 = rsqrt(_3313);
        _3325 = _3335;
    }
    float _3337 = _3325;
    float _3339 = _3337;
    if (_3317)
    {
        float _3341 = _3321 * _3333;
        _3327 = _3341;
    }
    float _3343 = _3327;
    float _3345 = _3271 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3317)
    {
        float _3347 = _3343 * 0.15915493667125701904296875;
        _3193 = _3347;
    }
    float _3349 = _3193;
    float _3351 = fma(_3277, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3345);
    float _3353 = _3301;
    if (_3317)
    {
        float _3355 = _3349 * 6.283185482025146484375;
        float _3357 = sin(_3355);
        _3353 = _3357;
    }
    float _3359 = _3353;
    float _3361 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3363 = precise::max(0.0, _3361);
    float _3365 = _3291;
    float _3367 = _3363;
    float _3369 = _3361;
    if (_3317)
    {
        float _3371 = _3349 * 6.283185482025146484375;
        float _3373 = cos(_3371);
        _3365 = _3373;
    }
    float _3375 = _3365;
    float _3377 = -_3303;
    float _3379 = -_3363;
    float _3381 = fma(_3283, _3377, _3379);
    if (_3317)
    {
        float _3383 = _3381 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3367 = _3383;
    }
    float _3385 = _3367;
    float _3387 = sqrt(_3299);
    float _3389 = _3385;
    float _3391 = _3359;
    if (_3317)
    {
        float _3393 = fma(_3359, _3385, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3389 = _3393;
    }
    float _3395 = _3389;
    float _3397 = _3395;
    if (!_3317)
    {
        _3391 = _3307;
    }
    float _3399 = _3391;
    float _3401 = _3399;
    if (_3317)
    {
        float _3403 = _3375 + (-1.0);
        _3369 = _3403;
    }
    float _3405 = _3369;
    float _3407 = _3405;
    if (_3317)
    {
        float _3409 = _3337 * _3395;
        _3195 = _3409;
    }
    float _3411 = _3195;
    if (!_3317)
    {
        _3339 = _3381;
    }
    float _3413 = _3339;
    float _3415 = _3413;
    if (_3317)
    {
        float _3417 = _3405 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3407 = _3417;
    }
    float _3419 = _3407;
    float _3421 = _3419;
    if (_3317)
    {
        float _3423 = _3305 * _3411;
        _3329 = _3423;
    }
    float _3425 = _3329;
    if (!_3317)
    {
        _3397 = _3309;
    }
    float _3427 = _3397;
    float _3429 = _3427;
    if (_3317)
    {
        float _3431 = _3307 * _3411;
        _3401 = _3431;
    }
    float _3433 = _3401;
    if (_3317)
    {
        float _3435 = fma(_3381, _3375, _3419);
        _3415 = _3435;
    }
    float _3437 = _3415;
    if (_3317)
    {
        float _3439 = _3425 * _3425;
        _3429 = _3439;
    }
    float _3441 = _3429;
    if (!_3317)
    {
        _3421 = _3311;
    }
    float _3443 = _3421;
    float _3445 = _3443;
    if (_3317)
    {
        float _3447 = _3433 * _3433;
        _3445 = _3447;
    }
    float _3449 = _3445;
    float _3451 = fma(_3437, _3437, _3441);
    float _3453 = _3271 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3455 = _3451 + _3449;
    float _3457 = _3271 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3461 = fma(_3387, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3459);
    float _3463 = precise::clamp(_3461, 0.0, 1.0);
    float _3465 = fma(_3277, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3453);
    float _3467 = rsqrt(_3455);
    float _3469 = fma(_3277, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3457);
    float _3471 = _3271 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3473 = -_3463;
    float _3475 = _3473 + 1.0;
    float _3477 = fma(_3285, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3465);
    float _3479 = fma(_3285, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3469);
    float _3481 = fma(_3277, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3471);
    float _3483 = _3477 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3485 = _3479 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3487 = fma(_3285, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3481);
    float _3489 = abs(_3475);
    float _3491 = log2(_3489);
    float _3493 = _3485 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3495 = _3487 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3497 = _3467 * _3425;
    float _3499 = _3467 * _3437;
    float _3501 = _3495 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3503 = -_3493;
    float _3505 = fma(_3503, _3279, 1.0);
    float _3507 = _3497 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3509 = fma(_3285, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3351);
    float _3511 = fma(_3483, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3501);
    float _3513 = _3467 * _3433;
    float _3515 = -_3507;
    float _3517 = fma(_3499, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3515);
    float _3519 = _3509 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3521 = fma(_3485, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3511);
    float _3523 = _3491 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3525 = -_3513;
    float _3527 = fma(_3525, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3517);
    float _3529 = _3495 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3531 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3521);
    float _3533 = exp2(_3523);
    float _3535 = fma(_3527, -0.5, 0.5);
    float _3537 = _3495 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3539 = fma(_3483, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3529);
    float _3541 = fma(_3527, 0.5, 0.5);
    float _3543 = fma(_3483, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3537);
    float _3545 = _3499 + 1.0;
    float _3547 = log2(_3505);
    float _3549 = fma(_3485, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3539);
    float _3551 = fma(_3485, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3543);
    float _3553 = fma(_3541, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3555 = fma(_3541, _3553, -0.212114393711090087890625);
    float _3557 = 1.0 / _3531;
    float _3559 = -_3499;
    float _3561 = fma(_3533, _3545, _3559);
    float _3563 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3549);
    float _3565 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3551);
    float _3567 = fma(_3541, _3555, 1.570728778839111328125);
    float _3569 = fma(_3561, 0.5, 0.5);
    float _3571 = sqrt(_3535);
    float _3573 = _3547 * 0.693147182464599609375;
    float _3575 = _3573 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3577 = _3563 * _3557;
    float _3579 = _3565 * _3557;
    float _3581 = fma(_3577, 0.5, 0.5);
    float _3583 = fma(_3579, -0.5, 0.5);
    float _3585 = _3571 * 0.636619746685028076171875;
    float3 _9052 = float3(_3581, _3583, _3575);
    float _3587 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9052, float3(0.0), isnan(_9052)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9052, float3(0.0), isnan(_9052)), level(0.0)).x;
    float3 _9063 = float3(_3581, _3583, _3575);
    float4 _3589 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9063, float3(0.0), isnan(_9063)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9063, float3(0.0), isnan(_9063)), level(0.0)).xyzw;
    float _3591 = _3589.x;
    float _3593 = _3589.y;
    float _3595 = _3589.z;
    float _3597 = _3589.w;
    float _3599 = -_3567;
    float _3601 = fma(_3585, _3599, 1.0);
    float2 _9084 = float2(_3601, _3569);
    float3 _3605 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9084, float2(0.0), isnan(_9084)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9084, float2(0.0), isnan(_9084)), level(0.0)).xyz;
    float _3607 = _3605.x;
    float _3609 = _3605.y;
    float _3611 = _3605.z;
    float _3613 = _3491 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3615 = _3495 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2935;
    out.m_75.y = _3025;
    out.m_75.z = _2937;
    float _3617 = fma(_3483, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3615);
    float _3619 = exp2(_3613);
    out.m_77.x = _3277;
    out.m_77.y = _3271;
    out.m_77.z = _3285;
    float _3621 = fma(_3485, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3617);
    float _3623 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3621);
    float _3625 = _3623 + _3531;
    out.gl_Position.x = _3563;
    out.gl_Position.y = _3565;
    out.gl_Position.z = _3623;
    out.gl_Position.w = _3531;
    float _3627 = -_3619;
    float _3629 = _3627 + 1.0;
    float _3631 = _3625 * 0.5;
    float _3633 = _3629 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3635 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3637 = -_3633;
    float _3639 = _3637 + 1.0;
    out.m_79.z = _3631;
    out.m_79.w = _3531;
    out.m_49.x = _3635;
    float _3641 = _3633 * _3587;
    float _3643 = _3597 * _3641;
    float _3645 = _3611 * _3641;
    float _3647 = fma(_3607, _3643, _3591);
    float _3649 = fma(_3609, _3643, _3593);
    float _3651 = _3597 * _3639;
    float _3653 = fma(_3597, _3645, _3595);
    out.m_81.x = _3647;
    out.m_81.y = _3649;
    out.m_81.z = _3653;
    out.m_81.w = _3651;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3231 = false;
    bool _2403 = false;
    bool _2213 = false;
    bool _1651 = false;
    bool _1331 = false;
    bool _1201 = false;
    bool _1097 = false;
    bool _917 = false;
    bool _641 = false;
    bool _491 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _105 = int(_103);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3710 = as_type<float>(_121);
        out.gl_Position.z = _3710;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = 0.0;
    float _145 = _139;
    if (_135)
    {
        float _147 = float(_105);
        _115 = _147;
    }
    float _149 = _115;
    bool _151 = _139 >= _149;
    bool _153 = !_135;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _123 = as_type<int>(_161);
    }
    int _163 = _123;
    float _165 = as_type<float>(_163);
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3782 = as_type<float>(_163);
        out.gl_Position.z = _3782;
    }
    if (_155)
    {
        return out;
    }
    float _167 = in.m_51.x;
    float _169 = in.m_51.y;
    float _171 = in.m_51.z;
    float _173 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = _173;
    if (!_183)
    {
        float _187 = _173 * _173;
        float _189 = _187 * 0.5;
        _165 = _189;
    }
    float _191 = _165;
    float _193 = 0.0;
    float _195 = _191;
    if (!_183)
    {
        float _197 = _139 * _139;
        float _199 = _197 * 0.5;
        _193 = _199;
    }
    float _201 = _193;
    if (!_183)
    {
        float _203 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _203;
    }
    float _205 = _195;
    bool _207 = !_183;
    float _209 = _205;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _173 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _173);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _141 = _225;
        _209 = _239;
        _143 = _227;
    }
    float _241 = _141;
    float _243 = _209;
    float _245 = _143;
    bool _247 = !_183;
    float _249 = _241;
    float _251 = _245;
    if (!_247)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _173 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _249 = _265;
        _251 = _259;
        _185 = _271;
    }
    float _273 = _249;
    float _275 = _251;
    float _277 = _185;
    float _279 = _275;
    float _281 = _273;
    if (!_183)
    {
        _279 = _139;
    }
    float _283 = _279;
    float _285 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _283;
    if (!_183)
    {
        float _289 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _281 = _289;
    }
    float _291 = _281;
    bool _293 = !_183;
    float _295 = _291;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _139 * _299;
        float _305 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _307 = _305 + 1.0;
        float _309 = 1.0 / _307;
        float _311 = _301 * 0.693147182464599609375;
        float _313 = exp2(_303);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _139);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
    }
    float _327 = _295;
    bool _329 = !_183;
    if (!_329)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _337 = _335 + 1.0;
        float _339 = 1.0 / _337;
        float _341 = _139 * _333;
        float _343 = exp2(_341);
        float _345 = -_343;
        float _347 = _345 + 1.0;
        float _349 = _347 * _339;
        _287 = _349;
    }
    float _351 = _287;
    float _353 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _355 = fma(_277, _169, _285);
    float _357 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _359 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = fma(_351, _169, _353);
    float _363 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _365 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _367 = fma(_277, _167, _357);
    float _369 = fma(_351, _167, _359);
    float _371 = -_361;
    float _373 = _355 + _371;
    float _375 = fma(_277, _171, _363);
    float _377 = fma(_351, _171, _365);
    float _379 = -_369;
    float _381 = _367 + _379;
    float _383 = _373 * _373;
    float _385 = in.m_53.w;
    float _387 = -_377;
    float _389 = _375 + _387;
    float _391 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _393 = fma(_381, _381, _383);
    float _395 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _397 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _399 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _391);
    float _401 = fma(_389, _389, _393);
    float _403 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _395);
    float _405 = in.m_46.x;
    float _407 = in.m_46.y;
    float _409 = in.m_46.z;
    float _411 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _397);
    float _413 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _399);
    float _415 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _403);
    float _417 = sqrt(_401);
    float _419 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
    bool _421 = _417 >= 9.9999999747524270787835121154785e-07;
    bool _423 = isnan(_417);
    bool _425 = _421 || _423;
    bool _427 = isnan(9.9999999747524270787835121154785e-07);
    bool _429 = _425 || _427;
    float _431 = fma(_375, _385, _409);
    float _433 = fma(_367, _385, _405);
    float _435 = fma(_355, _385, _407);
    float _437 = _375;
    float _439 = _413;
    float _441 = _415;
    float _443 = _431;
    if (_429)
    {
        _437 = _413;
    }
    float _445 = _437;
    float _447 = _445;
    if (_429)
    {
        _439 = _419;
    }
    float _449 = _439;
    float _451 = _449;
    if (!_429)
    {
        bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _455 = !_453;
        if (!_455)
        {
            float _457 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _459 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _461 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _459);
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _467);
            float _475 = _469 * _469;
            float _477 = fma(_471, _471, _475);
            float _479 = fma(_473, _473, _477);
            float _481 = rsqrt(_479);
            float _483 = _481 * 9.9999999747524270787835121154785e-07;
            float _485 = _471 * _483;
            float _487 = _469 * _483;
            float _489 = _473 * _483;
            _441 = _487;
            _447 = _485;
            _451 = _489;
            _491 = true;
        }
        else
        {
            float _493 = _169 * _169;
            float _495 = fma(_167, _167, _493);
            float _497 = fma(_171, _171, _495);
            float _499 = sqrt(_497);
            bool _501 = _499 >= 9.9999999747524270787835121154785e-07;
            bool _503 = isnan(_499);
            bool _505 = _501 || _503;
            bool _507 = isnan(9.9999999747524270787835121154785e-07);
            bool _509 = _505 || _507;
            if (!_509)
            {
                float _511 = _407 * _407;
                float _513 = fma(_405, _405, _511);
                float _515 = fma(_409, _409, _513);
                float _517 = sqrt(_515);
                bool _519 = _517 >= 9.9999999747524270787835121154785e-07;
                bool _521 = isnan(_517);
                bool _523 = _519 || _521;
                bool _525 = isnan(9.9999999747524270787835121154785e-07);
                bool _527 = _523 || _525;
                if (!_527)
                {
                    float _529 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _531 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _529);
                    float _533 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _531);
                    float _535 = rsqrt(_533);
                    float _537 = _535 * 9.9999999747524270787835121154785e-07;
                    float _539 = _537 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _541 = _537 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _543 = _537 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _441 = _541;
                    _447 = _539;
                    _451 = _543;
                    _491 = true;
                }
                else
                {
                    float _545 = _407 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _547 = _407 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _549 = _407 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _551 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].x, _545);
                    float _553 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].x, _547);
                    float _555 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].x, _549);
                    float _557 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _551);
                    float _559 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _553);
                    float _561 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _555);
                    float _563 = _557 * _557;
                    float _565 = fma(_559, _559, _563);
                    float _567 = fma(_561, _561, _565);
                    float _569 = rsqrt(_567);
                    float _571 = _569 * 9.9999999747524270787835121154785e-07;
                    float _573 = _559 * _571;
                    float _575 = _557 * _571;
                    float _577 = _561 * _571;
                    _441 = _575;
                    _447 = _573;
                    _451 = _577;
                    _491 = true;
                }
            }
            else
            {
                float _579 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _581 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _583 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _585 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _579);
                float _587 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
                float _589 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _583);
                float _591 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _585);
                float _593 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _587);
                float _595 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _589);
                float _597 = _591 * _591;
                float _599 = fma(_593, _593, _597);
                float _601 = fma(_595, _595, _599);
                float _603 = rsqrt(_601);
                float _605 = _603 * 9.9999999747524270787835121154785e-07;
                float _607 = _593 * _605;
                float _609 = _591 * _605;
                float _611 = _595 * _605;
                _441 = _609;
                _447 = _607;
                _451 = _611;
            }
        }
    }
    _491 = false;
    float _613 = _441;
    float _615 = _447;
    float _617 = _451;
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _621 = !_619;
    float _639;
    if (!_621)
    {
        float _623 = in.m_55.x;
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        float _643 = float(_105);
        float _645 = 1.0 / _643;
        float _647 = _139 * _645;
        _639 = _647;
    }
    _641 = false;
    float _649 = _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _653 = _649 + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _657 = _649 + _655;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _659;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _675 = 1.0 / _661;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _679 = _649 + _677;
    float _681 = 1.0 / _669;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _685 = _649 + _683;
    bool _687 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _689 = 1.0 / _665;
    float _691 = _679 * _675;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _693;
    float _697 = fma(_695, _691, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _699 = 1.0 / _673;
    float _701 = _653 * _681;
    bool _703 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _705 = isnan(_649);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _715;
    float _719 = -_713;
    float _721 = _719 + 1.0;
    float _723 = _657 * _689;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _725;
    float _729 = fma(_717, _691, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _731 = fma(_727, _691, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _733 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _735 = isnan(_649);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = _685 * _699;
    bool _747 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _749 = isnan(_649);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    bool _759 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _761 = isnan(_649);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = -_757;
    float _773 = _771 + 1.0;
    float _775 = _769 * _721;
    float _777 = -_769;
    float _779 = _777 + 1.0;
    float _781 = _713 * _773;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _787 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _789 = isnan(_649);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = _743 * _779;
    float _801 = -_743;
    float _803 = _801 + 1.0;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _807 = _805 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _813 = fma(_785, _723, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _815 = _797 * _803;
    float _817 = fma(_807, _723, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _819 = fma(_811, _723, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _821 = _731 * _815;
    float _823 = _697 * _815;
    float _825 = -_797;
    float _827 = _825 + 1.0;
    float _829 = _729 * _815;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _831;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _835;
    float _839 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[143].x, _821);
    float _841 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[143].y, _823);
    float _843 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[143].z, _829);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _845;
    float _849 = fma(_817, _799, _839);
    float _851 = fma(_833, _701, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _853 = fma(_819, _799, _841);
    float _855 = fma(_813, _799, _843);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _865 = fma(_837, _701, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _867 = fma(_847, _701, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _873 = fma(_851, _775, _849);
    float _875 = fma(_859, _745, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _877 = fma(_863, _745, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _879 = fma(_871, _745, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _881 = fma(_865, _775, _853);
    float _883 = fma(_867, _775, _855);
    float _885 = fma(_875, _781, _873);
    float _887 = fma(_877, _781, _881);
    float _889 = fma(_879, _781, _883);
    float _891 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[147].x, _885);
    float _893 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[147].y, _887);
    float _895 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[147].z, _889);
    bool _897 = !_687;
    float _915;
    if (!_897)
    {
        float _899 = in.m_55.x;
        float _901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _903 = _899 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _905 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[11].x, _139);
        float _907 = _905 * _901;
        float _909 = floor(_907);
        float _911 = -_909;
        float _913 = _907 + _911;
        _915 = _913;
        _917 = true;
    }
    else
    {
        float _919 = float(_105);
        float _921 = 1.0 / _919;
        float _923 = _139 * _921;
        _915 = _923;
    }
    _917 = false;
    float _925 = _915;
    float _927 = in.m_53.x;
    float _929 = in.m_53.y;
    float _931 = in.m_53.z;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _935 = _925 + _933;
    bool _937 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _939 = isnan(_925);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _949;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _957 = 1.0 / _951;
    bool _959 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _961 = 1.0 / _955;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _963;
    float _967 = _935 * _957;
    bool _969 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _971 = isnan(_925);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    float _981 = _893 * _929;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _985 = _925 + _983;
    bool _987 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _989 = isnan(_925);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = _895 * _931;
    float _1001 = -_979;
    float _1003 = _1001 + 1.0;
    float _1005 = fma(_965, _967, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1007 = _985 * _961;
    float _1009 = _997 * _1003;
    float _1011 = -_997;
    float _1013 = _1011 + 1.0;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1015;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1019;
    float _1023 = _891 * _927;
    float _1025 = _947 * _1013;
    float _1027 = fma(_1017, _967, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1029 = fma(_1021, _967, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1031 = -_947;
    float _1033 = _1031 + 1.0;
    float _1035 = _1005 * _1025;
    float _1037 = _1027 * _1025;
    float _1039 = _1029 * _1025;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1043 = _1041 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1047 = _1045 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1051 = _1049 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1053 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1037);
    float _1055 = fma(_1043, _1007, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1057 = fma(_1047, _1007, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1059 = fma(_1051, _1007, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1061 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1035);
    float _1063 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1039);
    float _1065 = fma(_1055, _1009, _1053);
    float _1067 = fma(_1057, _1009, _1061);
    float _1069 = fma(_1059, _1009, _1063);
    float _1071 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1065);
    float _1073 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1067);
    float _1075 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1069);
    bool _1077 = !_959;
    float _1095;
    if (!_1077)
    {
        float _1079 = in.m_55.x;
        float _1081 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1083 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _1087 = _1085 * _1081;
        float _1089 = floor(_1087);
        float _1091 = -_1089;
        float _1093 = _1087 + _1091;
        _1095 = _1093;
        _1097 = true;
    }
    else
    {
        float _1099 = float(_105);
        float _1101 = 1.0 / _1099;
        float _1103 = _139 * _1101;
        _1095 = _1103;
    }
    _1097 = false;
    float _1105 = _1095;
    bool _1107 = _1105 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1109 = isnan(_1105);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1121 = _1119 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1123 = _1105 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1125 = isnan(_1105);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1131 = _1127 || _1129;
    float _1133 = float(_1131);
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1141 = _1105 + _1139;
    float _1143 = -_1117;
    float _1145 = _1143 + 1.0;
    bool _1147 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1149 = 1.0 / _1121;
    float _1151 = _1133 * _1145;
    float _1153 = -_1133;
    float _1155 = _1153 + 1.0;
    float _1157 = _1137 * _1149;
    float _1159 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1161 = fma(_1157, _1141, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1163 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1165 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1167 = _1161 * _1151;
    float _1169 = _1071 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1171 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1173 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1167);
    float _1175 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1177 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1173);
    float _1179 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _1175;
    out.m_57.y = _1171;
    out.m_57.z = _1165;
    out.m_57.w = _1179;
    bool _1181 = !_1147;
    float _1199;
    if (!_1181)
    {
        float _1183 = in.m_55.x;
        float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1187 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _1191 = _1189 * _1185;
        float _1193 = floor(_1191);
        float _1195 = -_1193;
        float _1197 = _1191 + _1195;
        _1199 = _1197;
        _1201 = true;
    }
    else
    {
        float _1203 = float(_105);
        float _1205 = 1.0 / _1203;
        float _1207 = _139 * _1205;
        _1199 = _1207;
    }
    _1201 = false;
    float _1209 = _1199;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1213 = _1209 + _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1217 = _1215 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1219 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1221 = isnan(_1209);
    bool _1223 = _1219 || _1221;
    bool _1225 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1227 = _1223 || _1225;
    float _1229 = float(_1227);
    float _1231 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1233 = _1231 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1235 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1237 = isnan(_1209);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1243 = _1239 || _1241;
    float _1245 = float(_1243);
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1247;
    bool _1251 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1253 = isnan(_1209);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1259 = _1255 || _1257;
    float _1261 = float(_1259);
    float _1263 = 1.0 / _1217;
    float _1265 = -_1229;
    float _1267 = _1265 + 1.0;
    bool _1269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1271 = 1.0 / _1233;
    float _1273 = _1249 * _1263;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1277 = _1275 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1279 = fma(_1273, _1213, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1281 = _1245 * _1267;
    float _1283 = -_1261;
    float _1285 = _1283 + 1.0;
    float _1287 = -_1245;
    float _1289 = _1287 + 1.0;
    float _1291 = _1277 * _1271;
    float _1293 = _1279 * _1281;
    float _1295 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1297 = _1209 + _1295;
    float _1299 = _1229 * _1285;
    float _1301 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1293);
    float _1303 = fma(_1291, _1297, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1305 = fma(_1303, _1299, _1301);
    float _1307 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1305);
    float _1309 = _1307 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.w = _1309;
    bool _1311 = !_1269;
    float _1329;
    if (!_1311)
    {
        float _1313 = in.m_55.x;
        float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1317 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1319 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[14].x, _139);
        float _1321 = _1319 * _1315;
        float _1323 = floor(_1321);
        float _1325 = -_1323;
        float _1327 = _1321 + _1325;
        _1329 = _1327;
        _1331 = true;
    }
    else
    {
        float _1333 = float(_105);
        float _1335 = 1.0 / _1333;
        float _1337 = _139 * _1335;
        _1329 = _1337;
    }
    _1331 = false;
    float _1339 = _1329;
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1343 = _1339 + _1341;
    bool _1345 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1347 = isnan(_1339);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1353 = _1349 || _1351;
    float _1355 = float(_1353);
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1361 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1363 = isnan(_1339);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1369 = _1365 || _1367;
    float _1371 = float(_1369);
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1373;
    bool _1377 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1379 = isnan(_1339);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1385 = _1381 || _1383;
    float _1387 = float(_1385);
    float _1389 = -_1355;
    float _1391 = _1389 + 1.0;
    float _1393 = 1.0 / _1359;
    bool _1395 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1397 = isnan(_1339);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1403 = _1399 || _1401;
    float _1405 = float(_1403);
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1411 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1413 = 1.0 / _1409;
    float _1415 = _1375 * _1393;
    float _1417 = -_1371;
    float _1419 = _1417 + 1.0;
    float _1421 = _1371 * _1391;
    bool _1423 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1425 = isnan(_1339);
    bool _1427 = _1423 || _1425;
    bool _1429 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1431 = _1427 || _1429;
    float _1433 = float(_1431);
    float _1435 = fma(_1415, _1343, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1437 = _1387 * _1419;
    float _1439 = -_1387;
    float _1441 = _1439 + 1.0;
    float _1443 = -_1433;
    float _1445 = _1443 + 1.0;
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1449 = _1447 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1451 = _1433 * _1441;
    bool _1453 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1455 = isnan(_1339);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1461 = _1457 || _1459;
    float _1463 = float(_1461);
    float _1465 = -_1405;
    float _1467 = _1465 + 1.0;
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1473 = _1405 * _1445;
    bool _1475 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1477 = isnan(_1339);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1483 = _1479 || _1481;
    float _1485 = float(_1483);
    float _1487 = _1463 * _1467;
    float _1489 = -_1463;
    float _1491 = _1489 + 1.0;
    float _1493 = 1.0 / _1471;
    float _1495 = _1485 * _1491;
    float _1497 = -_1485;
    float _1499 = _1497 + 1.0;
    float _1501 = _1435 * _1495;
    float _1503 = 1.0 / _1449;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1507 = _1505 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1511 = _1509 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1515 = _1513 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1517;
    float _1521 = _1511 * _1413;
    float _1523 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1501);
    float _1525 = 1.0 / _1507;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1529 = _1339 + _1527;
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1533 = _1531 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1535 = _1519 * _1493;
    float _1537 = fma(_1521, _1529, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1541 = _1339 + _1539;
    float _1543 = 1.0 / _1515;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1549 = fma(_1535, _1541, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1551 = fma(_1537, _1487, _1523);
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1553;
    float _1557 = _1547 * _1503;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1561 = _1339 + _1559;
    float _1563 = fma(_1549, _1473, _1551);
    float _1565 = 1.0 / _1533;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1569 = _1567 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1571 = _1555 * _1525;
    float _1573 = fma(_1557, _1561, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1577 = _1339 + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1581 = _1339 + _1579;
    float _1583 = _1569 * _1543;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1585;
    bool _1589 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1591 = isnan(_1339);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1597 = _1593 || _1595;
    float _1599 = float(_1597);
    float _1601 = fma(_1571, _1577, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1603 = fma(_1573, _1451, _1563);
    float _1605 = fma(_1583, _1581, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1609 = _1339 + _1607;
    float _1611 = -_1599;
    float _1613 = _1611 + 1.0;
    float _1615 = _1587 * _1565;
    float _1617 = fma(_1601, _1437, _1603);
    float _1619 = _1355 * _1613;
    float _1621 = fma(_1615, _1609, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1623 = fma(_1605, _1421, _1617);
    float _1625 = fma(_1621, _1619, _1623);
    float _1627 = fma(_1599, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1625);
    float _1629 = precise::clamp(_1627, 0.0, 1.0);
    bool _1631 = !_1411;
    float _1649;
    if (!_1631)
    {
        float _1633 = in.m_55.x;
        float _1635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1637 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[14].z, _139);
        float _1641 = _1639 * _1635;
        float _1643 = floor(_1641);
        float _1645 = -_1643;
        float _1647 = _1641 + _1645;
        _1649 = _1647;
        _1651 = true;
    }
    else
    {
        float _1653 = float(_105);
        float _1655 = 1.0 / _1653;
        float _1657 = _139 * _1655;
        _1649 = _1657;
    }
    _1651 = false;
    float _1659 = _1649;
    int _1661 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1663 = _1661;
    int _1665 = 0;
    int _1667 = _96(_1663, _1665, (*spvDescriptorSet0.support_buffer));
    float _1669 = in.m_61.z;
    float _1671 = trunc(_1669);
    int _1673 = int(_1671);
    int _1675 = _1667 + (-1);
    float _1677 = float(_1675);
    float _1679 = _1629 * _1677;
    float _1681 = trunc(_1679);
    int _1683 = int(_1681);
    int _1685 = _1683;
    int _1687 = 0;
    int _1689 = _97(_1685, _1687, (*spvDescriptorSet0.support_buffer));
    int _1691 = _1673;
    int _1693 = 0;
    int _1695 = _97(_1691, _1693, (*spvDescriptorSet0.support_buffer));
    float4 _1698 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1689, _1695)), 0).xyzw;
    float _1700 = _1698.x;
    float _1702 = _1698.y;
    float _1704 = _1698.z;
    float _1706 = _1698.w;
    float _1708 = in.m_55.w;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1712 = _1710 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1722 = 1.0 / _1712;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    int _1728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1730 = _1728 != 0;
    float _1732 = 1.0 / _1716;
    bool _1734 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1736 = isnan(_1659);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1742 = _1738 || _1740;
    float _1744 = float(_1742);
    int _1746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1748 = _1746 != 0;
    int _1750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1752 = _1750 != 0;
    float _1754 = -_1744;
    float _1756 = _1754 + 1.0;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1760 = _1758 != 0;
    float _1762 = 1.0 / _1720;
    bool _1764 = _1708 > 0.5;
    bool _1766 = _1764 && _1730;
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1768;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1774 = _1772 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _1776 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1778 = isnan(_1659);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1788;
    float _1792 = _1770 * _1722;
    float _1794 = 1.0 / _1726;
    bool _1796 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1798 = isnan(_1659);
    bool _1800 = _1796 || _1798;
    bool _1802 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1804 = _1800 || _1802;
    float _1806 = float(_1804);
    float _1808 = _1774 * _1732;
    float _1810 = _1786 * _1756;
    float _1812 = -_1786;
    float _1814 = _1812 + 1.0;
    bool _1816 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1818 = isnan(_1659);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1824 = _1820 || _1822;
    float _1826 = float(_1824);
    float _1828 = -_1806;
    float _1830 = _1828 + 1.0;
    bool _1832 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1834 = isnan(_1659);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    float _1844 = _1790 * _1762;
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1848 = _1846 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1850 = _1806 * _1814;
    float _1852 = _1826 * _1830;
    float _1854 = -_1826;
    float _1856 = _1854 + 1.0;
    float _1858 = -_1842;
    float _1860 = _1858 + 1.0;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1864 = _1862 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1866 = _1848 * _1794;
    bool _1868 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1870 = isnan(_1659);
    bool _1872 = _1868 || _1870;
    bool _1874 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1876 = _1872 || _1874;
    float _1878 = float(_1876);
    float _1880 = _1842 * _1856;
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1884 = _1659 + _1882;
    bool _1886 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1888 = isnan(_1659);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1894 = _1890 || _1892;
    float _1896 = float(_1894);
    float _1898 = _1878 * _1860;
    float _1900 = -_1878;
    float _1902 = _1900 + 1.0;
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1906 = _1904 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1908 = fma(_1792, _1884, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1912 = _1659 + _1910;
    float _1914 = _1896 * _1902;
    float _1916 = 1.0 / _1906;
    float _1918 = fma(_1808, _1912, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1920 = _1908 * _1914;
    float _1922 = -_1896;
    float _1924 = _1922 + 1.0;
    float _1926 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1928 = _1926 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1930 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1932 = _1930 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1934 = in.m_61.x;
    float _1936 = 1.0 / _1864;
    float _1938 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1920);
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1942 = _1659 + _1940;
    float _1944 = in.m_61.y;
    float _1946 = fma(_1844, _1942, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1948 = fma(_1918, _1898, _1938);
    float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1952 = _1659 + _1950;
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1954;
    float _1958 = 1.0 / _1928;
    float _1960 = _1932 * _1916;
    float _1962 = fma(_1866, _1952, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1964 = _1916;
    float _1966 = _1744;
    float _1968 = _1810;
    int _1970 = as_type<int>(_1659);
    int _1972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[182].x);
    if (_1748)
    {
        float _1974 = in.m_55.x;
        _1964 = _1974;
    }
    float _1976 = _1964;
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1978;
    float _1982 = fma(_1946, _1880, _1948);
    float _1984 = _1956 * _1936;
    float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1988 = _1659 + _1986;
    float _1990 = _1938;
    if (_1752)
    {
        float _1992 = in.m_55.z;
        _1990 = _1992;
    }
    float _1994 = _1990;
    bool _1996 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1998 = isnan(_1659);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2004 = _2000 || _2002;
    float _2006 = float(_2004);
    float _2008 = fma(_1962, _1852, _1982);
    float _2010 = fma(_1984, _1988, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2012 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2014 = _1659 + _2012;
    float _2016 = in.m_55.y;
    float _2018 = -_2006;
    float _2020 = _2018 + 1.0;
    float _2022 = fma(_2010, _1850, _2008);
    float _2024 = _1980 * _1958;
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2028 = _1659 + _2026;
    float _2030 = _1744 * _2020;
    int _2032 = as_type<int>(_2022);
    if (!_1748)
    {
        _1966 = _1934;
    }
    float _2034 = _1966;
    float _2036 = -_1944;
    float _2038 = _2036 + 1.0;
    float _2040 = fma(_1960, _2028, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2042 = fma(_2024, _2014, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2044 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2046 = fma(_2040, _1810, _2022);
    float _2048 = _2034;
    if (!_1748)
    {
        _1968 = _2034;
    }
    float _2050 = _1968;
    float _2052 = _2050;
    if (_1748)
    {
        _2048 = _1934;
    }
    float _2054 = _2048;
    float _2056 = fma(_2042, _2030, _2046);
    float _2058 = _1766 ? _2038 : _1944;
    bool _2060 = false;
    float _2062 = _2054;
    if (_1748)
    {
        bool _2064 = _1976 > 0.5;
        _2060 = _2064;
    }
    bool _2066 = _2060;
    if (_1748)
    {
        float _2068 = -_2054;
        float _2070 = _2068 + 1.0;
        _1970 = as_type<int>(_2070);
    }
    int _2072 = _1970;
    if (_1752)
    {
        float _2074 = -_2054;
        float _2076 = _2074 + 1.0;
        _2032 = as_type<int>(_2076);
    }
    int _2078 = _2032;
    bool _2080 = false;
    if (_1752)
    {
        bool _2082 = _1994 > 0.5;
        _2080 = _2082;
    }
    bool _2084 = _2080;
    float _2086 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2056);
    bool _2088 = _2016 > 0.5;
    bool _2090 = _2088 && _1760;
    float _2092 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1748)
    {
        float _2094 = _2066 ? as_type<float>(_2072) : _2054;
        _2052 = _2094;
    }
    float _2096 = _2052;
    float _2098 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2100 = _1683 + 1;
    out.m_63.x = _2086;
    if (_1752)
    {
        float _2102 = _2084 ? as_type<float>(_2078) : _2054;
        _2062 = _2102;
    }
    float _2104 = _2062;
    int _2106 = min(_1675, _2100);
    float _2108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2110 = _2090 ? _2038 : _1944;
    float _2112 = _2110 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2116 = _2112 * _2108;
    float _2118 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2120 = _2118 * _2092;
    float _2122 = _2098 * _2114;
    uint _2125 = as_type<uint>(half2(float2(_1706, 0.0)));
    uint _2127 = extract_bits(_2125, 0u, 8u);
    int _2129 = int(_2127) & 255;
    uint _2131 = extract_bits(_2125, 8u, 8u);
    int _2133 = int(_2131) & 255;
    int _2135 = _2133 << 8;
    int _2137 = _2129 | _2135;
    bool _2139 = _2137 >= 32768;
    int _2141 = _2137 + (-1024);
    int _2143 = _2141;
    if (_2139)
    {
        int _2145 = ~_2137;
        int _2147 = _2145 + 33792;
        int _2149 = _2147 + 1;
        _2143 = _2149;
    }
    int _2151 = _2143;
    int _2153 = _2151 + 30719;
    float _2155 = float(_2153);
    float _2157 = fma(_2155, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2159 = abs(_2157);
    float _2161 = -_2159;
    float _2163 = _2161 + 1.0;
    float _2165 = abs(_2157);
    float _2167 = fma(_2165, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2169 = as_type<int>(_2163) + (-218103808);
    float _2171 = abs(_2157);
    float _2173 = fma(_2171, _2167, -0.212114393711090087890625);
    bool _2175 = uint(_2169) >= 1920991232u;
    float _2177 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2179 = _2157 < 0.0;
    float _2181 = float(_2179);
    float _2183 = _2177 * _2044;
    float _2185 = abs(_2157);
    float _2187 = fma(_2185, _2173, 1.570728778839111328125);
    bool _2189 = !_2175;
    float _2211;
    if (!_2189)
    {
        int _2191 = as_type<int>(_2163);
        int _2193 = as_type<int>(_1944);
        int _2195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[182].x);
        int _2197 = 11088;
        int _2199;
        int _2201;
        int _2203;
        int _2205;
        int _2207;
        int _2209;
        _94(_2191, _2193, _2195, _2197, _2199, _2201, _2203, _2205, _2207, _2209, out.gl_Position, out.gl_PointSize);
        _2211 = as_type<float>(_2203);
        _1972 = _2205;
        _2213 = true;
    }
    else
    {
        float _2215 = rsqrt(_2163);
        float _2217 = _2163 * _2215;
        float _2219 = _2215 * 0.5;
        float _2221 = -_2217;
        float _2223 = 0.0 + _2221;
        float _2225 = fma(_2219, _2223, 0.5);
        float _2227 = fma(_2217, _2225, _2217);
        float _2229 = -_2227;
        float _2231 = 0.0 + _2229;
        float _2233 = fma(_2227, _2231, _2163);
        float _2235 = fma(_2219, _2233, _2227);
        _2211 = _2235;
    }
    _2213 = false;
    float _2237 = _2211;
    int _2239 = _1972;
    int _2241 = _2106;
    int _2243 = 0;
    int _2245 = _97(_2241, _2243, (*spvDescriptorSet0.support_buffer));
    int _2247 = _1673;
    int _2249 = 0;
    int _2251 = _97(_2247, _2249, (*spvDescriptorSet0.support_buffer));
    float4 _2253 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2245, _2251)), 0).xyzw;
    float _2255 = _2253.x;
    float _2257 = _2253.y;
    float _2259 = _2253.z;
    float _2261 = _2253.w;
    float _2263 = _2187 * _2237;
    float _2265 = _2181 * 2.0;
    float _2267 = _2155 * 3.883221149444580078125;
    float _2269 = floor(_1679);
    float _2271 = -_2265;
    float _2273 = fma(_2263, _2271, _2263);
    float _2275 = _2267 * 0.15915493667125701904296875;
    float _2277 = fma(_2181, 3.1415927410125732421875, _2273);
    float _2279 = _2275 * 6.283185482025146484375;
    float _2281 = cos(_2279);
    float _2283 = _2277 * 0.15915493667125701904296875;
    float _2285 = _2283 * 6.283185482025146484375;
    float _2287 = sin(_2285);
    float _2289 = -_2269;
    float _2291 = _1679 + _2289;
    float _2293 = _2275 * 6.283185482025146484375;
    float _2295 = sin(_2293);
    float _2297 = _2287 * _2281;
    float _2299 = _2287 * _2295;
    uint _2301 = as_type<uint>(half2(float2(_2261, 0.0)));
    float _2303 = -_1700;
    float _2305 = _2303 + _2255;
    float _2307 = -_1704;
    float _2309 = _2307 + _2259;
    uint _2311 = extract_bits(_2301, 0u, 8u);
    int _2313 = int(_2311) & 255;
    uint _2315 = extract_bits(_2301, 8u, 8u);
    int _2317 = int(_2315) & 255;
    int _2319 = _2317 << 8;
    int _2321 = _2313 | _2319;
    float _2323 = fma(_2291, _2305, _1700);
    float _2325 = fma(_2291, _2309, _1704);
    bool _2327 = _2321 >= 32768;
    int _2329 = _2321 + (-1024);
    int _2331 = _2329;
    if (_2327)
    {
        int _2333 = ~_2321;
        int _2335 = _2333 + 33792;
        int _2337 = _2335 + 1;
        _2331 = _2337;
    }
    int _2339 = _2331;
    int _2341 = _2339 + 30719;
    float _2343 = float(_2341);
    float _2345 = fma(_2343, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2347 = abs(_2345);
    float _2349 = -_2347;
    float _2351 = _2349 + 1.0;
    float _2353 = abs(_2345);
    float _2355 = fma(_2353, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _2357 = -_1702;
    float _2359 = _2357 + _2257;
    int _2361 = as_type<int>(_2351) + (-218103808);
    float _2363 = abs(_2345);
    float _2365 = fma(_2363, _2355, -0.212114393711090087890625);
    float _2367 = fma(_2291, _2359, _1702);
    bool _2369 = _2345 < 0.0;
    float _2371 = float(_2369);
    bool _2373 = uint(_2361) >= 1920991232u;
    float _2375 = abs(_2345);
    float _2377 = fma(_2375, _2365, 1.570728778839111328125);
    bool _2379 = !_2373;
    float _2401;
    if (!_2379)
    {
        int _2381 = as_type<int>(_2351);
        int _2383 = as_type<int>(_2351);
        int _2385 = _2239;
        int _2387 = 11984;
        int _2389;
        int _2391;
        int _2393;
        int _2395;
        int _2397;
        int _2399;
        _94(_2381, _2383, _2385, _2387, _2389, _2391, _2393, _2395, _2397, _2399, out.gl_Position, out.gl_PointSize);
        _2401 = as_type<float>(_2393);
        _2403 = true;
    }
    else
    {
        float _2405 = rsqrt(_2351);
        float _2407 = _2351 * _2405;
        float _2409 = _2405 * 0.5;
        float _2411 = -_2407;
        float _2413 = 0.0 + _2411;
        float _2415 = fma(_2409, _2413, 0.5);
        float _2417 = fma(_2407, _2415, _2407);
        float _2419 = -_2417;
        float _2421 = 0.0 + _2419;
        float _2423 = fma(_2417, _2421, _2351);
        float _2425 = fma(_2409, _2423, _2417);
        _2401 = _2425;
    }
    _2403 = false;
    float _2427 = _2401;
    float _2429 = in.m_55.x;
    float _2431 = in.m_55.y;
    float _2433 = in.m_55.z;
    float _2435 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2437 = log2(_2435);
    float _2439 = _613 * _613;
    float _2441 = _2377 * _2427;
    int _2443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2445 = _2443 != 0;
    int _2447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2449 = _2447 != 0;
    int _2451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2453 = _2451 != 0;
    float _2455 = fma(_615, _615, _2439);
    float _2457 = _999 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2459 = _2343 * 3.883221149444580078125;
    float _2461 = fma(_617, _617, _2455);
    float _2463 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2465 = _2459 * 0.15915493667125701904296875;
    float _2467 = rsqrt(_2461);
    float _2469 = -_2157;
    float _2471 = _2469 + _2345;
    float _2473 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2475 = _2433 * 2.0;
    float _2477 = _2429 * 2.0;
    float _2479 = _2431 * 2.0;
    float _2481 = floor(_2477);
    float _2483 = _2467 * _615;
    float _2485 = _2467 * _613;
    float _2487 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2489 = _2483 * _2487;
    float _2491 = floor(_2475);
    float _2493 = _2429 + _2433;
    float _2495 = _2493 + (-1.0);
    float _2497 = floor(_2479);
    bool _2499 = _2481 >= 0.0;
    bool _2501 = isnan(_2481);
    bool _2503 = _2499 || _2501;
    bool _2505 = isnan(0.0);
    bool _2507 = _2503 || _2505;
    int _2509 = _2507 ? 0 : 1;
    bool _2511 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2513 = isnan(0.0);
    bool _2515 = _2511 || _2513;
    bool _2517 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2519 = _2515 || _2517;
    bool _2521 = _2491 > 0.0;
    float _2523 = _2437 * _139;
    bool _2525 = _2491 >= 0.0;
    bool _2527 = isnan(_2491);
    bool _2529 = _2525 || _2527;
    bool _2531 = isnan(0.0);
    bool _2533 = _2529 || _2531;
    float _2535 = _2431 + _2429;
    float _2537 = fma(_2495, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2539 = _2535 + (-1.0);
    int _2541 = _2533 ? 0 : 1;
    bool _2543 = _2481 > 0.0;
    float _2545 = fma(_2539, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2547 = ~_2541;
    int _2549 = _2547 + 1;
    int _2551 = _2549 + 1;
    float _2553 = exp2(_2523);
    int _2555 = _2551;
    if (!_2521)
    {
        int _2557 = ~_2541;
        int _2559 = _2557 + 1;
        _2555 = _2559;
    }
    int _2561 = _2555;
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2565 = 1.0 + _2563;
    bool _2567 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2569 = isnan(1.0);
    bool _2571 = _2567 || _2569;
    bool _2573 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2575 = _2571 || _2573;
    bool _2577 = !_2445;
    int _2579 = _2577 ? 0 : 1;
    bool _2581 = _2497 > 0.0;
    float _2583 = 1.0 / _2565;
    bool _2585 = _2497 >= 0.0;
    bool _2587 = isnan(_2497);
    bool _2589 = _2585 || _2587;
    bool _2591 = isnan(0.0);
    bool _2593 = _2589 || _2591;
    float _2595 = _2467 * _617;
    int _2597 = abs(_2579);
    float _2599 = float(_2561);
    float _2601 = float(_2597);
    float _2603 = -_2553;
    float _2605 = _2603 + 1.0;
    int _2607 = _2593 ? 0 : 1;
    float _2609 = in.m_65.x;
    float _2611 = in.m_65.y;
    float _2613 = in.m_65.z;
    bool _2615 = !_2453;
    int _2617 = _2615 ? 0 : 1;
    float _2619 = _2601 * _2599;
    float _2621 = _2519 ? _2605 : 0.0;
    float _2623 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2625 = _2485 * _2623;
    int _2627 = ~_2509;
    int _2629 = _2627 + 1;
    int _2631 = _2629 + 1;
    float _2633 = _2619 * (-2.0);
    int _2635 = ~_2607;
    int _2637 = _2635 + 1;
    int _2639 = _2637 + 1;
    int _2641 = _2631;
    int _2643 = _2639;
    if (_2575)
    {
        float _2645 = _2621 * _2583;
        _145 = _2645;
    }
    float _2647 = _145;
    if (!_2543)
    {
        int _2649 = ~_2509;
        int _2651 = _2649 + 1;
        _2641 = _2651;
    }
    int _2653 = _2641;
    float _2655 = _2429 + (-0.5);
    if (!_2581)
    {
        int _2657 = ~_2607;
        int _2659 = _2657 + 1;
        _2643 = _2659;
    }
    int _2661 = _2643;
    float _2663 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2665 = _2595 * _2663;
    int _2667 = abs(_2617);
    float _2669 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2671 = -_2625;
    float _2673 = fma(_2595, _2669, _2671);
    float _2675 = float(_2661);
    float _2677 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2679 = -_2665;
    float _2681 = fma(_2483, _2677, _2679);
    float _2683 = float(_2667);
    float _2685 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2687 = -_2489;
    float _2689 = fma(_2485, _2685, _2687);
    bool _2691 = !_2449;
    int _2693 = _2691 ? 0 : 1;
    float _2695 = _2681 * _2681;
    float _2697 = float(_2653);
    float _2699 = _2683 * _2675;
    bool _2701 = _2367 != 0.0;
    bool _2703 = isnan(_2367);
    bool _2705 = _2701 || _2703;
    bool _2707 = isnan(0.0);
    bool _2709 = _2705 || _2707;
    float _2711 = fma(_2633, _2609, _2609);
    float _2713 = fma(_2545, _2633, _2545);
    int _2715 = abs(_2693);
    float _2717 = _2699 * (-2.0);
    float _2719 = fma(_2655, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2711);
    float _2721 = fma(_2673, _2673, _2695);
    bool _2723 = _2323 == 0.0;
    bool _2725 = !_2709;
    bool _2727 = _2723 && _2725;
    float _2729 = fma(_2537, _2717, _2537);
    float _2731 = fma(_2713, _2647, _2719);
    float _2733 = _2433 + (-0.5);
    float _2735 = fma(_2689, _2689, _2721);
    bool _2737 = _2325 == 0.0;
    bool _2739 = _2737 && _2727;
    float _2741 = _2731 * 0.15915493667125701904296875;
    float _2743 = float(_2715);
    float _2745 = fma(_2717, _2613, _2613);
    float _2747 = rsqrt(_2735);
    float _2749 = fma(_2733, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2745);
    float _2751 = _2743 * _2697;
    float _2753 = _2431 + _2433;
    float _2755 = _2431 + (-0.5);
    float _2757 = _2751 * (-2.0);
    float _2759 = _2753 + (-1.0);
    float _2761 = fma(_2729, _2647, _2749);
    float _2763 = _2741 * 6.283185482025146484375;
    float _2765 = sin(_2763);
    float _2767 = fma(_2757, _2611, _2611);
    float _2769 = fma(_2759, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2771 = _2761 * 0.15915493667125701904296875;
    float _2773 = fma(_2755, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2767);
    float _2775 = fma(_2769, _2757, _2769);
    float _2777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2367);
    float _2779 = _2741 * 6.283185482025146484375;
    float _2781 = cos(_2779);
    float _2783 = _2689 * _2747;
    float _2785 = fma(_2775, _2647, _2773);
    float _2787 = _981 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2789 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2325);
    float _2791 = _2371 * 2.0;
    float _2793 = _2785 * 0.15915493667125701904296875;
    float _2795 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2797 = _2771 * 6.283185482025146484375;
    float _2799 = sin(_2797);
    float _2801 = _2457 * _2789;
    float _2803 = _2681 * _2747;
    float _2805 = -_2791;
    float _2807 = fma(_2441, _2805, _2441);
    float _2809 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2323);
    float _2811 = _2787 * _2777;
    float _2813 = _2673 * _2747;
    float _2815 = fma(_2371, 3.1415927410125732421875, _2807);
    float _2817 = _2771 * 6.283185482025146484375;
    float _2819 = cos(_2817);
    float _2821 = _2795 * _2809;
    float _2823 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2825 = _2793 * 6.283185482025146484375;
    float _2827 = sin(_2825);
    float _2829 = _2781 * _2799;
    float _2831 = _2765 * _2799;
    float _2833 = _2793 * 6.283185482025146484375;
    float _2835 = cos(_2833);
    float _2837 = _2781 * _2819;
    float _2839 = _2765 * _2819;
    float _2841 = -_2829;
    float _2843 = fma(_2827, _2839, _2841);
    float _2845 = fma(_2827, _2831, _2837);
    float _2847 = -_2839;
    float _2849 = fma(_2827, _2829, _2847);
    float _2851 = fma(_2827, _2837, _2831);
    float _2853 = _2485 * _2783;
    float _2855 = _2845 * _2483;
    float _2857 = _2849 * _2483;
    float _2859 = _2845 * _2595;
    float _2861 = _2835 * _2799;
    float _2863 = _2781 * _2835;
    float _2865 = _2835 * _2819;
    float _2867 = _2765 * _2835;
    float _2869 = _2861 * _2483;
    float _2871 = -_2853;
    float _2873 = fma(_2595, _2803, _2871);
    float _2875 = fma(_2843, _2813, _2855);
    float _2877 = fma(_2851, _2813, _2857);
    float _2879 = fma(_2865, _2813, _2869);
    float _2881 = _2849 * _2595;
    float _2883 = fma(_2867, _2873, _2875);
    float _2885 = fma(_2863, _2873, _2877);
    float _2887 = -_2827;
    float _2889 = fma(_2887, _2873, _2879);
    float _2891 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2463);
    float _2893 = _2483 * _2803;
    float _2895 = _2861 * _2595;
    float _2897 = fma(_2851, _2783, _2881);
    float _2899 = _2815 * 0.15915493667125701904296875;
    float _2901 = -_2893;
    float _2903 = fma(_2485, _2813, _2901);
    float _2905 = fma(_2843, _2783, _2859);
    float _2907 = fma(_2865, _2783, _2895);
    float _2909 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2823);
    float _2911 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2891);
    float _2913 = fma(_2867, _2903, _2905);
    float _2915 = fma(_2863, _2903, _2897);
    float _2917 = -_2827;
    float _2919 = fma(_2917, _2903, _2907);
    float _2921 = _2811 * _2883;
    float _2923 = _2811 * _2913;
    float _2925 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2909);
    float _2927 = _2465 * 6.283185482025146484375;
    float _2929 = sin(_2927);
    float _2931 = fma(_2821, _2889, _2921);
    float _2933 = fma(_2821, _2919, _2923);
    float _2935 = _2911 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2937 = _2925 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2939 = fma(_2801, _2885, _2931);
    float _2941 = fma(_2801, _2915, _2933);
    float _2943 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2473);
    float _2945 = _2899 * 6.283185482025146484375;
    float _2947 = sin(_2945);
    float _2949 = _2935 + _2939;
    float _2951 = _2937 + _2941;
    float _2953 = _2595 * _2813;
    float _2955 = _2845 * _2485;
    float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2959 = _2949 + _2957;
    float _2961 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2963 = _2951 + _2961;
    float _2965 = _2861 * _2485;
    float _2967 = -_2953;
    float _2969 = fma(_2483, _2783, _2967);
    float _2971 = _2959 * _2959;
    float _2973 = _2963 * _2963;
    float _2975 = fma(_2843, _2803, _2955);
    float _2977 = fma(_2865, _2803, _2965);
    float _2979 = _2849 * _2485;
    float _2981 = _2971 + _2973;
    float _2983 = fma(_2867, _2969, _2975);
    float _2985 = -_2299;
    float _2987 = fma(_2947, _2929, _2985);
    float _2989 = fma(_2291, _2471, _2157);
    float _2991 = _2465 * 6.283185482025146484375;
    float _2993 = cos(_2991);
    float _2995 = fma(_2851, _2803, _2979);
    float _2997 = fma(_2291, _2987, _2299);
    float _2999 = fma(_2367, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2989);
    float _3001 = -_2827;
    float _3003 = fma(_3001, _2969, _2977);
    float _3005 = _2811 * _2983;
    float _3007 = fma(_2325, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2997);
    float _3009 = fma(_2863, _2969, _2995);
    float _3011 = sqrt(_2981);
    float _3013 = _2739 ? _2989 : _2999;
    float _3015 = fma(_2821, _3003, _3005);
    float _3017 = _2739 ? _2997 : _3007;
    float _3019 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2943);
    float _3021 = _3013 * _3013;
    float _3023 = fma(_2801, _3009, _3015);
    float _3025 = _3019 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3027 = -_2297;
    float _3029 = fma(_2947, _2993, _3027);
    float _3031 = fma(_3017, _3017, _3021);
    float _3033 = _3025 + _3023;
    float _3035 = fma(_2291, _3029, _2297);
    float _3037 = rsqrt(_3031);
    bool _3039 = _3011 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3041 = _2971;
    float _3043 = _2973;
    float _3045 = _2981;
    float _3047 = _2949;
    float _3049 = _2951;
    float _3051 = _2989;
    float _3053 = _3035;
    if (!_3039)
    {
        _443 = _3033;
    }
    float _3055 = _443;
    bool _3057 = !_3039;
    float _3059 = _3055;
    if (!_3057)
    {
        float _3061 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3063 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3065 = _3011 + _3063;
        float _3067 = rsqrt(_2981);
        float _3069 = _3065 * _3061;
        float _3071 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3073 = _3069 * 0.15915493667125701904296875;
        float _3075 = _3073 * 6.283185482025146484375;
        float _3077 = sin(_3075);
        float _3079 = _3073 * 6.283185482025146484375;
        float _3081 = cos(_3079);
        float _3083 = fma(_3077, _3071, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3085 = _3067 * _3083;
        float _3087 = _3081 + (-1.0);
        float _3089 = _2959 * _3085;
        float _3091 = _2963 * _3085;
        float _3093 = _3087 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3095 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3097 = _3089 * _3089;
        float _3099 = _3091 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3101 = fma(_3033, _3081, _3093);
        float _3103 = _3091 * _3091;
        _3059 = _3101;
        _3041 = _3097;
        _3043 = _3103;
        _3045 = _3067;
        _3047 = _3095;
        _3049 = _3099;
    }
    float _3105 = _3059;
    float _3107 = _3041;
    float _3109 = _3043;
    float _3111 = _3045;
    float _3113 = _3047;
    float _3115 = _3049;
    float _3117 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3119 = _3105 + _3117;
    float _3121 = _3111;
    if (!_2739)
    {
        _3051 = _2999;
    }
    float _3123 = _3051;
    if (!_2739)
    {
        float _3125 = fma(_2323, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3035);
        _3053 = _3125;
    }
    float _3127 = _3053;
    if (_2739)
    {
        _3121 = _2997;
    }
    float _3129 = _3121;
    float _3131 = fma(_3119, _3119, _3107);
    float _3133 = _3013 * _3037;
    float _3135 = _3129;
    if (!_2739)
    {
        _3135 = _3007;
    }
    float _3137 = _3135;
    float _3139 = _2983 * _3123;
    float _3141 = _3131 + _3109;
    float _3143 = _2883 * _3123;
    float _3145 = _2913 * _3123;
    float _3147 = _3017 * _3037;
    float _3149 = -_3133;
    float _3151 = _2915 * _3149;
    float _3153 = fma(_3003, _3127, _3139);
    float _3155 = sqrt(_3141);
    float _3157 = -_3133;
    float _3159 = _2885 * _3157;
    float _3161 = -_3133;
    float _3163 = _3009 * _3161;
    float _3165 = fma(_2889, _3127, _3143);
    float _3167 = fma(_2919, _3127, _3145);
    float _3169 = fma(_2913, _3147, _3151);
    float _3171 = fma(_3009, _3137, _3153);
    float _3173 = fma(_2883, _3147, _3159);
    float _3175 = fma(_2983, _3147, _3163);
    float _3177 = fma(_2885, _3137, _3165);
    float _3179 = fma(_2915, _3137, _3167);
    out.m_67.x = _2183;
    out.m_67.y = _2116;
    out.m_67.z = _2120;
    out.m_67.w = _2122;
    out.m_69.x = _2889;
    out.m_69.y = _3003;
    out.m_69.z = _2919;
    bool _3181 = _3155 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3183 = isnan(_3155);
    bool _3185 = _3181 || _3183;
    bool _3187 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3189 = _3185 || _3187;
    out.m_71.x = _3173;
    out.m_71.y = _3175;
    out.m_71.z = _3169;
    out.m_73.x = _3177;
    out.m_73.y = _3171;
    out.m_73.z = _3179;
    float _3191 = _3147;
    float _3193 = _3173;
    float _3195 = _3177;
    if (!_3189)
    {
        _3191 = 1.0;
    }
    float _3197 = _3191;
    bool _3199 = !_3189;
    float _3201 = _3197;
    if (!_3199)
    {
        bool _3203 = _3155 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3205 = isnan(_3155);
        bool _3207 = _3203 || _3205;
        bool _3209 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3211 = _3207 || _3209;
        if (!_3211)
        {
            float _3213 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3215 = _3155 + _3213;
            float _3217 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3219 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3217;
            float _3221 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3223 = _3221 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3225 = 1.0 / _3219;
            float _3227 = _3215 * _3225;
            float _3229 = fma(_3227, _3223, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3201 = _3229;
            _3231 = true;
        }
        else
        {
            bool _3233 = _3155 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3235 = isnan(_3155);
            bool _3237 = _3233 || _3235;
            bool _3239 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3241 = _3237 || _3239;
            if (!_3241)
            {
                float _3243 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3245 = _3155 + _3243;
                float _3247 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3249 = _3247 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3251 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3253 = _3251 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3255 = 1.0 / _3249;
                float _3257 = _3245 * _3255;
                float _3259 = fma(_3257, _3253, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3201 = _3259;
                _3231 = true;
            }
            else
            {
                _3201 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3231 = false;
    float _3261 = _3201;
    float _3263 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3265 = _3105 + _3263;
    float _3267 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3269 = _3113 + _3267;
    float _3271 = fma(_3265, _3261, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3273 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3275 = _3115 + _3273;
    float _3277 = fma(_3269, _3261, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3279 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3281 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3283 = _3271 + _3281;
    float _3285 = fma(_3275, _3261, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3287 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3289 = _3277 + _3287;
    float _3291 = _3283 * _3283;
    float _3293 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3295 = _3285 + _3293;
    float _3297 = fma(_3289, _3289, _3291);
    float _3299 = fma(_3295, _3295, _3297);
    float _3301 = rsqrt(_3299);
    float _3303 = _3301 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3305 = _3289 * _3303;
    float _3307 = _3295 * _3303;
    float _3309 = _3305 * _3305;
    float _3311 = _3307 * _3307;
    float _3313 = _3309 + _3311;
    float _3315 = sqrt(_3313);
    bool _3317 = _3315 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3321 = _3315 + _3319;
    float _3323 = _3295;
    float _3325 = _3261;
    float _3327 = _3321;
    float _3329 = _3305;
    if (_3317)
    {
        float _3331 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3323 = _3331;
    }
    float _3333 = _3323;
    if (_3317)
    {
        float _3335 = rsqrt(_3313);
        _3325 = _3335;
    }
    float _3337 = _3325;
    float _3339 = _3337;
    if (_3317)
    {
        float _3341 = _3321 * _3333;
        _3327 = _3341;
    }
    float _3343 = _3327;
    float _3345 = _3271 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3317)
    {
        float _3347 = _3343 * 0.15915493667125701904296875;
        _3193 = _3347;
    }
    float _3349 = _3193;
    float _3351 = fma(_3277, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3345);
    float _3353 = _3301;
    if (_3317)
    {
        float _3355 = _3349 * 6.283185482025146484375;
        float _3357 = sin(_3355);
        _3353 = _3357;
    }
    float _3359 = _3353;
    float _3361 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3363 = precise::max(0.0, _3361);
    float _3365 = _3291;
    float _3367 = _3363;
    float _3369 = _3361;
    if (_3317)
    {
        float _3371 = _3349 * 6.283185482025146484375;
        float _3373 = cos(_3371);
        _3365 = _3373;
    }
    float _3375 = _3365;
    float _3377 = -_3303;
    float _3379 = -_3363;
    float _3381 = fma(_3283, _3377, _3379);
    if (_3317)
    {
        float _3383 = _3381 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3367 = _3383;
    }
    float _3385 = _3367;
    float _3387 = sqrt(_3299);
    float _3389 = _3385;
    float _3391 = _3359;
    if (_3317)
    {
        float _3393 = fma(_3359, _3385, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3389 = _3393;
    }
    float _3395 = _3389;
    float _3397 = _3395;
    if (!_3317)
    {
        _3391 = _3307;
    }
    float _3399 = _3391;
    float _3401 = _3399;
    if (_3317)
    {
        float _3403 = _3375 + (-1.0);
        _3369 = _3403;
    }
    float _3405 = _3369;
    float _3407 = _3405;
    if (_3317)
    {
        float _3409 = _3337 * _3395;
        _3195 = _3409;
    }
    float _3411 = _3195;
    if (!_3317)
    {
        _3339 = _3381;
    }
    float _3413 = _3339;
    float _3415 = _3413;
    if (_3317)
    {
        float _3417 = _3405 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3407 = _3417;
    }
    float _3419 = _3407;
    float _3421 = _3419;
    if (_3317)
    {
        float _3423 = _3305 * _3411;
        _3329 = _3423;
    }
    float _3425 = _3329;
    if (!_3317)
    {
        _3397 = _3309;
    }
    float _3427 = _3397;
    float _3429 = _3427;
    if (_3317)
    {
        float _3431 = _3307 * _3411;
        _3401 = _3431;
    }
    float _3433 = _3401;
    if (_3317)
    {
        float _3435 = fma(_3381, _3375, _3419);
        _3415 = _3435;
    }
    float _3437 = _3415;
    if (_3317)
    {
        float _3439 = _3425 * _3425;
        _3429 = _3439;
    }
    float _3441 = _3429;
    if (!_3317)
    {
        _3421 = _3311;
    }
    float _3443 = _3421;
    float _3445 = _3443;
    if (_3317)
    {
        float _3447 = _3433 * _3433;
        _3445 = _3447;
    }
    float _3449 = _3445;
    float _3451 = fma(_3437, _3437, _3441);
    float _3453 = _3271 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3455 = _3451 + _3449;
    float _3457 = _3271 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3461 = fma(_3387, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3459);
    float _3463 = precise::clamp(_3461, 0.0, 1.0);
    float _3465 = fma(_3277, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3453);
    float _3467 = rsqrt(_3455);
    float _3469 = fma(_3277, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3457);
    float _3471 = _3271 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3473 = -_3463;
    float _3475 = _3473 + 1.0;
    float _3477 = fma(_3285, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3465);
    float _3479 = fma(_3285, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3469);
    float _3481 = fma(_3277, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3471);
    float _3483 = _3477 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3485 = _3479 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3487 = fma(_3285, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3481);
    float _3489 = abs(_3475);
    float _3491 = log2(_3489);
    float _3493 = _3485 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3495 = _3487 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3497 = _3467 * _3425;
    float _3499 = _3467 * _3437;
    float _3501 = _3495 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3503 = -_3493;
    float _3505 = fma(_3503, _3279, 1.0);
    float _3507 = _3497 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3509 = fma(_3285, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3351);
    float _3511 = fma(_3483, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3501);
    float _3513 = _3467 * _3433;
    float _3515 = -_3507;
    float _3517 = fma(_3499, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3515);
    float _3519 = _3509 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3521 = fma(_3485, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3511);
    float _3523 = _3491 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3525 = -_3513;
    float _3527 = fma(_3525, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3517);
    float _3529 = _3495 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3531 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3521);
    float _3533 = exp2(_3523);
    float _3535 = fma(_3527, -0.5, 0.5);
    float _3537 = _3495 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3539 = fma(_3483, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3529);
    float _3541 = fma(_3527, 0.5, 0.5);
    float _3543 = fma(_3483, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3537);
    float _3545 = _3499 + 1.0;
    float _3547 = log2(_3505);
    float _3549 = fma(_3485, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3539);
    float _3551 = fma(_3485, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3543);
    float _3553 = fma(_3541, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3555 = fma(_3541, _3553, -0.212114393711090087890625);
    float _3557 = 1.0 / _3531;
    float _3559 = -_3499;
    float _3561 = fma(_3533, _3545, _3559);
    float _3563 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3549);
    float _3565 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3551);
    float _3567 = fma(_3541, _3555, 1.570728778839111328125);
    float _3569 = fma(_3561, 0.5, 0.5);
    float _3571 = sqrt(_3535);
    float _3573 = _3547 * 0.693147182464599609375;
    float _3575 = _3573 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3577 = _3563 * _3557;
    float _3579 = _3565 * _3557;
    float _3581 = fma(_3577, 0.5, 0.5);
    float _3583 = fma(_3579, -0.5, 0.5);
    float _3585 = _3571 * 0.636619746685028076171875;
    float3 _9052 = float3(_3581, _3583, _3575);
    float _3587 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9052, float3(0.0), isnan(_9052)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9052, float3(0.0), isnan(_9052)), level(0.0)).x;
    float3 _9063 = float3(_3581, _3583, _3575);
    float4 _3589 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9063, float3(0.0), isnan(_9063)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9063, float3(0.0), isnan(_9063)), level(0.0)).xyzw;
    float _3591 = _3589.x;
    float _3593 = _3589.y;
    float _3595 = _3589.z;
    float _3597 = _3589.w;
    float _3599 = -_3567;
    float _3601 = fma(_3585, _3599, 1.0);
    float2 _9084 = float2(_3601, _3569);
    float3 _3605 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9084, float2(0.0), isnan(_9084)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9084, float2(0.0), isnan(_9084)), level(0.0)).xyz;
    float _3607 = _3605.x;
    float _3609 = _3605.y;
    float _3611 = _3605.z;
    float _3613 = _3491 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3615 = _3495 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2935;
    out.m_75.y = _3025;
    out.m_75.z = _2937;
    float _3617 = fma(_3483, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3615);
    float _3619 = exp2(_3613);
    out.m_77.x = _3277;
    out.m_77.y = _3271;
    out.m_77.z = _3285;
    float _3621 = fma(_3485, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3617);
    float _3623 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3621);
    float _3625 = _3623 + _3531;
    out.gl_Position.x = _3563;
    out.gl_Position.y = _3565;
    out.gl_Position.z = _3623;
    out.gl_Position.w = _3531;
    float _3627 = -_3619;
    float _3629 = _3627 + 1.0;
    float _3631 = _3625 * 0.5;
    float _3633 = _3629 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3635 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3637 = -_3633;
    float _3639 = _3637 + 1.0;
    out.m_79.z = _3631;
    out.m_79.w = _3531;
    out.m_49.x = _3635;
    float _3641 = _3633 * _3587;
    float _3643 = _3597 * _3641;
    float _3645 = _3611 * _3641;
    float _3647 = fma(_3607, _3643, _3591);
    float _3649 = fma(_3609, _3643, _3593);
    float _3651 = _3597 * _3639;
    float _3653 = fma(_3597, _3645, _3595);
    out.m_81.x = _3647;
    out.m_81.y = _3649;
    out.m_81.z = _3653;
    out.m_81.w = _3651;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3231 = false;
    bool _2403 = false;
    bool _2213 = false;
    bool _1651 = false;
    bool _1331 = false;
    bool _1201 = false;
    bool _1097 = false;
    bool _917 = false;
    bool _641 = false;
    bool _491 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_46.w;
    float _103 = trunc(_101);
    int _105 = int(_103);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3710 = as_type<float>(_121);
        out.gl_Position.z = _3710;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = 0.0;
    float _145 = _139;
    if (_135)
    {
        float _147 = float(_105);
        _115 = _147;
    }
    float _149 = _115;
    bool _151 = _139 >= _149;
    bool _153 = !_135;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_49.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _123 = as_type<int>(_161);
    }
    int _163 = _123;
    float _165 = as_type<float>(_163);
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3782 = as_type<float>(_163);
        out.gl_Position.z = _3782;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = in.m_51.x;
    float _169 = in.m_51.y;
    float _171 = in.m_51.z;
    float _173 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = _173;
    if (!_183)
    {
        float _187 = _173 * _173;
        float _189 = _187 * 0.5;
        _165 = _189;
    }
    float _191 = _165;
    float _193 = 0.0;
    float _195 = _191;
    if (!_183)
    {
        float _197 = _139 * _139;
        float _199 = _197 * 0.5;
        _193 = _199;
    }
    float _201 = _193;
    if (!_183)
    {
        float _203 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _203;
    }
    float _205 = _195;
    bool _207 = !_183;
    float _209 = _205;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _173 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _173);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _141 = _225;
        _209 = _239;
        _143 = _227;
    }
    float _241 = _141;
    float _243 = _209;
    float _245 = _143;
    bool _247 = !_183;
    float _249 = _241;
    float _251 = _245;
    if (!_247)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _173 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _249 = _265;
        _251 = _259;
        _185 = _271;
    }
    float _273 = _249;
    float _275 = _251;
    float _277 = _185;
    float _279 = _275;
    float _281 = _273;
    if (!_183)
    {
        _279 = _139;
    }
    float _283 = _279;
    float _285 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _283;
    if (!_183)
    {
        float _289 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _281 = _289;
    }
    float _291 = _281;
    bool _293 = !_183;
    float _295 = _291;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _139 * _299;
        float _305 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _307 = _305 + 1.0;
        float _309 = 1.0 / _307;
        float _311 = _301 * 0.693147182464599609375;
        float _313 = exp2(_303);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _139);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
    }
    float _327 = _295;
    bool _329 = !_183;
    if (!_329)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _337 = _335 + 1.0;
        float _339 = 1.0 / _337;
        float _341 = _139 * _333;
        float _343 = exp2(_341);
        float _345 = -_343;
        float _347 = _345 + 1.0;
        float _349 = _347 * _339;
        _287 = _349;
    }
    float _351 = _287;
    float _353 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _355 = fma(_277, _169, _285);
    float _357 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _359 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _361 = fma(_351, _169, _353);
    float _363 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _365 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _367 = fma(_277, _167, _357);
    float _369 = fma(_351, _167, _359);
    float _371 = -_361;
    float _373 = _355 + _371;
    float _375 = fma(_277, _171, _363);
    float _377 = fma(_351, _171, _365);
    float _379 = -_369;
    float _381 = _367 + _379;
    float _383 = _373 * _373;
    float _385 = in.m_53.w;
    float _387 = -_377;
    float _389 = _375 + _387;
    float _391 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _393 = fma(_381, _381, _383);
    float _395 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _397 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _399 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _391);
    float _401 = fma(_389, _389, _393);
    float _403 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _395);
    float _405 = in.m_46.x;
    float _407 = in.m_46.y;
    float _409 = in.m_46.z;
    float _411 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _397);
    float _413 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].z, _399);
    float _415 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].z, _403);
    float _417 = sqrt(_401);
    float _419 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].z, _411);
    bool _421 = _417 >= 9.9999999747524270787835121154785e-07;
    bool _423 = isnan(_417);
    bool _425 = _421 || _423;
    bool _427 = isnan(9.9999999747524270787835121154785e-07);
    bool _429 = _425 || _427;
    float _431 = fma(_375, _385, _409);
    float _433 = fma(_367, _385, _405);
    float _435 = fma(_355, _385, _407);
    float _437 = _375;
    float _439 = _413;
    float _441 = _415;
    float _443 = _431;
    if (_429)
    {
        _437 = _413;
    }
    float _445 = _437;
    float _447 = _445;
    if (_429)
    {
        _439 = _419;
    }
    float _449 = _439;
    float _451 = _449;
    if (!_429)
    {
        bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _455 = !_453;
        if (!_455)
        {
            float _457 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _459 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _461 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _459);
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _467);
            float _475 = _469 * _469;
            float _477 = fma(_471, _471, _475);
            float _479 = fma(_473, _473, _477);
            float _481 = rsqrt(_479);
            float _483 = _481 * 9.9999999747524270787835121154785e-07;
            float _485 = _471 * _483;
            float _487 = _469 * _483;
            float _489 = _473 * _483;
            _441 = _487;
            _447 = _485;
            _451 = _489;
            _491 = true;
        }
        else
        {
            float _493 = _169 * _169;
            float _495 = fma(_167, _167, _493);
            float _497 = fma(_171, _171, _495);
            float _499 = sqrt(_497);
            bool _501 = _499 >= 9.9999999747524270787835121154785e-07;
            bool _503 = isnan(_499);
            bool _505 = _501 || _503;
            bool _507 = isnan(9.9999999747524270787835121154785e-07);
            bool _509 = _505 || _507;
            if (!_509)
            {
                float _511 = _407 * _407;
                float _513 = fma(_405, _405, _511);
                float _515 = fma(_409, _409, _513);
                float _517 = sqrt(_515);
                bool _519 = _517 >= 9.9999999747524270787835121154785e-07;
                bool _521 = isnan(_517);
                bool _523 = _519 || _521;
                bool _525 = isnan(9.9999999747524270787835121154785e-07);
                bool _527 = _523 || _525;
                if (!_527)
                {
                    float _529 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _531 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _529);
                    float _533 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _531);
                    float _535 = rsqrt(_533);
                    float _537 = _535 * 9.9999999747524270787835121154785e-07;
                    float _539 = _537 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _541 = _537 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _543 = _537 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _441 = _541;
                    _447 = _539;
                    _451 = _543;
                    _491 = true;
                }
                else
                {
                    float _545 = _407 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _547 = _407 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _549 = _407 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _551 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].x, _545);
                    float _553 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].x, _547);
                    float _555 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].x, _549);
                    float _557 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _551);
                    float _559 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _553);
                    float _561 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _555);
                    float _563 = _557 * _557;
                    float _565 = fma(_559, _559, _563);
                    float _567 = fma(_561, _561, _565);
                    float _569 = rsqrt(_567);
                    float _571 = _569 * 9.9999999747524270787835121154785e-07;
                    float _573 = _559 * _571;
                    float _575 = _557 * _571;
                    float _577 = _561 * _571;
                    _441 = _575;
                    _447 = _573;
                    _451 = _577;
                    _491 = true;
                }
            }
            else
            {
                float _579 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _581 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _583 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _585 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _579);
                float _587 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
                float _589 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _583);
                float _591 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _585);
                float _593 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _587);
                float _595 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _589);
                float _597 = _591 * _591;
                float _599 = fma(_593, _593, _597);
                float _601 = fma(_595, _595, _599);
                float _603 = rsqrt(_601);
                float _605 = _603 * 9.9999999747524270787835121154785e-07;
                float _607 = _593 * _605;
                float _609 = _591 * _605;
                float _611 = _595 * _605;
                _441 = _609;
                _447 = _607;
                _451 = _611;
            }
        }
    }
    _491 = false;
    float _613 = _441;
    float _615 = _447;
    float _617 = _451;
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _621 = !_619;
    float _639;
    if (!_621)
    {
        float _623 = in.m_55.x;
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        float _643 = float(_105);
        float _645 = 1.0 / _643;
        float _647 = _139 * _645;
        _639 = _647;
    }
    _641 = false;
    float _649 = _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _653 = _649 + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _657 = _649 + _655;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _659;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _665 = _663 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _675 = 1.0 / _661;
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _679 = _649 + _677;
    float _681 = 1.0 / _669;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _685 = _649 + _683;
    bool _687 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _689 = 1.0 / _665;
    float _691 = _679 * _675;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _693;
    float _697 = fma(_695, _691, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _699 = 1.0 / _673;
    float _701 = _653 * _681;
    bool _703 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _705 = isnan(_649);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _711 = _707 || _709;
    float _713 = float(_711);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _715;
    float _719 = -_713;
    float _721 = _719 + 1.0;
    float _723 = _657 * _689;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _725;
    float _729 = fma(_717, _691, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _731 = fma(_727, _691, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _733 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _735 = isnan(_649);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = _685 * _699;
    bool _747 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _749 = isnan(_649);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    bool _759 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _761 = isnan(_649);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = -_757;
    float _773 = _771 + 1.0;
    float _775 = _769 * _721;
    float _777 = -_769;
    float _779 = _777 + 1.0;
    float _781 = _713 * _773;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _785 = _783 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _787 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _789 = isnan(_649);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = _743 * _779;
    float _801 = -_743;
    float _803 = _801 + 1.0;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _807 = _805 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _813 = fma(_785, _723, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _815 = _797 * _803;
    float _817 = fma(_807, _723, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _819 = fma(_811, _723, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _821 = _731 * _815;
    float _823 = _697 * _815;
    float _825 = -_797;
    float _827 = _825 + 1.0;
    float _829 = _729 * _815;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _831;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _835;
    float _839 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[143].x, _821);
    float _841 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[143].y, _823);
    float _843 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[143].z, _829);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _845;
    float _849 = fma(_817, _799, _839);
    float _851 = fma(_833, _701, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _853 = fma(_819, _799, _841);
    float _855 = fma(_813, _799, _843);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _865 = fma(_837, _701, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _867 = fma(_847, _701, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _873 = fma(_851, _775, _849);
    float _875 = fma(_859, _745, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _877 = fma(_863, _745, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _879 = fma(_871, _745, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _881 = fma(_865, _775, _853);
    float _883 = fma(_867, _775, _855);
    float _885 = fma(_875, _781, _873);
    float _887 = fma(_877, _781, _881);
    float _889 = fma(_879, _781, _883);
    float _891 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[147].x, _885);
    float _893 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[147].y, _887);
    float _895 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[147].z, _889);
    bool _897 = !_687;
    float _915;
    if (!_897)
    {
        float _899 = in.m_55.x;
        float _901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _903 = _899 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _905 = fma(_903, (*spvDescriptorSet0.vp_c9)._m0[11].x, _139);
        float _907 = _905 * _901;
        float _909 = floor(_907);
        float _911 = -_909;
        float _913 = _907 + _911;
        _915 = _913;
        _917 = true;
    }
    else
    {
        float _919 = float(_105);
        float _921 = 1.0 / _919;
        float _923 = _139 * _921;
        _915 = _923;
    }
    _917 = false;
    float _925 = _915;
    float _927 = in.m_53.x;
    float _929 = in.m_53.y;
    float _931 = in.m_53.z;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _935 = _925 + _933;
    bool _937 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _939 = isnan(_925);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _949;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _957 = 1.0 / _951;
    bool _959 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _961 = 1.0 / _955;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _963;
    float _967 = _935 * _957;
    bool _969 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _971 = isnan(_925);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    float _981 = _893 * _929;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _985 = _925 + _983;
    bool _987 = _925 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _989 = isnan(_925);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = _895 * _931;
    float _1001 = -_979;
    float _1003 = _1001 + 1.0;
    float _1005 = fma(_965, _967, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1007 = _985 * _961;
    float _1009 = _997 * _1003;
    float _1011 = -_997;
    float _1013 = _1011 + 1.0;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1015;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1019;
    float _1023 = _891 * _927;
    float _1025 = _947 * _1013;
    float _1027 = fma(_1017, _967, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1029 = fma(_1021, _967, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1031 = -_947;
    float _1033 = _1031 + 1.0;
    float _1035 = _1005 * _1025;
    float _1037 = _1027 * _1025;
    float _1039 = _1029 * _1025;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1043 = _1041 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1047 = _1045 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1051 = _1049 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1053 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1037);
    float _1055 = fma(_1043, _1007, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1057 = fma(_1047, _1007, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1059 = fma(_1051, _1007, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1061 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1035);
    float _1063 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1039);
    float _1065 = fma(_1055, _1009, _1053);
    float _1067 = fma(_1057, _1009, _1061);
    float _1069 = fma(_1059, _1009, _1063);
    float _1071 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1065);
    float _1073 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1067);
    float _1075 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1069);
    bool _1077 = !_959;
    float _1095;
    if (!_1077)
    {
        float _1079 = in.m_55.x;
        float _1081 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1083 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _1087 = _1085 * _1081;
        float _1089 = floor(_1087);
        float _1091 = -_1089;
        float _1093 = _1087 + _1091;
        _1095 = _1093;
        _1097 = true;
    }
    else
    {
        float _1099 = float(_105);
        float _1101 = 1.0 / _1099;
        float _1103 = _139 * _1101;
        _1095 = _1103;
    }
    _1097 = false;
    float _1105 = _1095;
    bool _1107 = _1105 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1109 = isnan(_1105);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1115 = _1111 || _1113;
    float _1117 = float(_1115);
    float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1121 = _1119 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1123 = _1105 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1125 = isnan(_1105);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1131 = _1127 || _1129;
    float _1133 = float(_1131);
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1141 = _1105 + _1139;
    float _1143 = -_1117;
    float _1145 = _1143 + 1.0;
    bool _1147 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1149 = 1.0 / _1121;
    float _1151 = _1133 * _1145;
    float _1153 = -_1133;
    float _1155 = _1153 + 1.0;
    float _1157 = _1137 * _1149;
    float _1159 = _1075 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1161 = fma(_1157, _1141, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1163 = _1073 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1165 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1167 = _1161 * _1151;
    float _1169 = _1071 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1171 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1173 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1167);
    float _1175 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1177 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1173);
    float _1179 = _1177 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _1175;
    out.m_57.y = _1171;
    out.m_57.z = _1165;
    out.m_57.w = _1179;
    bool _1181 = !_1147;
    float _1199;
    if (!_1181)
    {
        float _1183 = in.m_55.x;
        float _1185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1187 = _1183 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _1191 = _1189 * _1185;
        float _1193 = floor(_1191);
        float _1195 = -_1193;
        float _1197 = _1191 + _1195;
        _1199 = _1197;
        _1201 = true;
    }
    else
    {
        float _1203 = float(_105);
        float _1205 = 1.0 / _1203;
        float _1207 = _139 * _1205;
        _1199 = _1207;
    }
    _1201 = false;
    float _1209 = _1199;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1213 = _1209 + _1211;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1217 = _1215 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1219 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1221 = isnan(_1209);
    bool _1223 = _1219 || _1221;
    bool _1225 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1227 = _1223 || _1225;
    float _1229 = float(_1227);
    float _1231 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1233 = _1231 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1235 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1237 = isnan(_1209);
    bool _1239 = _1235 || _1237;
    bool _1241 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1243 = _1239 || _1241;
    float _1245 = float(_1243);
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1249 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1247;
    bool _1251 = _1209 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1253 = isnan(_1209);
    bool _1255 = _1251 || _1253;
    bool _1257 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1259 = _1255 || _1257;
    float _1261 = float(_1259);
    float _1263 = 1.0 / _1217;
    float _1265 = -_1229;
    float _1267 = _1265 + 1.0;
    bool _1269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1271 = 1.0 / _1233;
    float _1273 = _1249 * _1263;
    float _1275 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1277 = _1275 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1279 = fma(_1273, _1213, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1281 = _1245 * _1267;
    float _1283 = -_1261;
    float _1285 = _1283 + 1.0;
    float _1287 = -_1245;
    float _1289 = _1287 + 1.0;
    float _1291 = _1277 * _1271;
    float _1293 = _1279 * _1281;
    float _1295 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1297 = _1209 + _1295;
    float _1299 = _1229 * _1285;
    float _1301 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1293);
    float _1303 = fma(_1291, _1297, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1305 = fma(_1303, _1299, _1301);
    float _1307 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1305);
    float _1309 = _1307 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.w = _1309;
    bool _1311 = !_1269;
    float _1329;
    if (!_1311)
    {
        float _1313 = in.m_55.x;
        float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1317 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1319 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[14].x, _139);
        float _1321 = _1319 * _1315;
        float _1323 = floor(_1321);
        float _1325 = -_1323;
        float _1327 = _1321 + _1325;
        _1329 = _1327;
        _1331 = true;
    }
    else
    {
        float _1333 = float(_105);
        float _1335 = 1.0 / _1333;
        float _1337 = _139 * _1335;
        _1329 = _1337;
    }
    _1331 = false;
    float _1339 = _1329;
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1343 = _1339 + _1341;
    bool _1345 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1347 = isnan(_1339);
    bool _1349 = _1345 || _1347;
    bool _1351 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1353 = _1349 || _1351;
    float _1355 = float(_1353);
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1359 = _1357 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1361 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1363 = isnan(_1339);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1369 = _1365 || _1367;
    float _1371 = float(_1369);
    float _1373 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1375 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1373;
    bool _1377 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1379 = isnan(_1339);
    bool _1381 = _1377 || _1379;
    bool _1383 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1385 = _1381 || _1383;
    float _1387 = float(_1385);
    float _1389 = -_1355;
    float _1391 = _1389 + 1.0;
    float _1393 = 1.0 / _1359;
    bool _1395 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1397 = isnan(_1339);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1403 = _1399 || _1401;
    float _1405 = float(_1403);
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1411 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1413 = 1.0 / _1409;
    float _1415 = _1375 * _1393;
    float _1417 = -_1371;
    float _1419 = _1417 + 1.0;
    float _1421 = _1371 * _1391;
    bool _1423 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1425 = isnan(_1339);
    bool _1427 = _1423 || _1425;
    bool _1429 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1431 = _1427 || _1429;
    float _1433 = float(_1431);
    float _1435 = fma(_1415, _1343, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1437 = _1387 * _1419;
    float _1439 = -_1387;
    float _1441 = _1439 + 1.0;
    float _1443 = -_1433;
    float _1445 = _1443 + 1.0;
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1449 = _1447 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1451 = _1433 * _1441;
    bool _1453 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1455 = isnan(_1339);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1461 = _1457 || _1459;
    float _1463 = float(_1461);
    float _1465 = -_1405;
    float _1467 = _1465 + 1.0;
    float _1469 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1471 = _1469 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1473 = _1405 * _1445;
    bool _1475 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1477 = isnan(_1339);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1483 = _1479 || _1481;
    float _1485 = float(_1483);
    float _1487 = _1463 * _1467;
    float _1489 = -_1463;
    float _1491 = _1489 + 1.0;
    float _1493 = 1.0 / _1471;
    float _1495 = _1485 * _1491;
    float _1497 = -_1485;
    float _1499 = _1497 + 1.0;
    float _1501 = _1435 * _1495;
    float _1503 = 1.0 / _1449;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1507 = _1505 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1511 = _1509 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1515 = _1513 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1519 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1517;
    float _1521 = _1511 * _1413;
    float _1523 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1501);
    float _1525 = 1.0 / _1507;
    float _1527 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1529 = _1339 + _1527;
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1533 = _1531 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1535 = _1519 * _1493;
    float _1537 = fma(_1521, _1529, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1541 = _1339 + _1539;
    float _1543 = 1.0 / _1515;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1549 = fma(_1535, _1541, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1551 = fma(_1537, _1487, _1523);
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1553;
    float _1557 = _1547 * _1503;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1561 = _1339 + _1559;
    float _1563 = fma(_1549, _1473, _1551);
    float _1565 = 1.0 / _1533;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1569 = _1567 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1571 = _1555 * _1525;
    float _1573 = fma(_1557, _1561, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1577 = _1339 + _1575;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1581 = _1339 + _1579;
    float _1583 = _1569 * _1543;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1585;
    bool _1589 = _1339 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1591 = isnan(_1339);
    bool _1593 = _1589 || _1591;
    bool _1595 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1597 = _1593 || _1595;
    float _1599 = float(_1597);
    float _1601 = fma(_1571, _1577, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1603 = fma(_1573, _1451, _1563);
    float _1605 = fma(_1583, _1581, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1609 = _1339 + _1607;
    float _1611 = -_1599;
    float _1613 = _1611 + 1.0;
    float _1615 = _1587 * _1565;
    float _1617 = fma(_1601, _1437, _1603);
    float _1619 = _1355 * _1613;
    float _1621 = fma(_1615, _1609, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1623 = fma(_1605, _1421, _1617);
    float _1625 = fma(_1621, _1619, _1623);
    float _1627 = fma(_1599, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1625);
    float _1629 = precise::clamp(_1627, 0.0, 1.0);
    bool _1631 = !_1411;
    float _1649;
    if (!_1631)
    {
        float _1633 = in.m_55.x;
        float _1635 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1637 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[14].z, _139);
        float _1641 = _1639 * _1635;
        float _1643 = floor(_1641);
        float _1645 = -_1643;
        float _1647 = _1641 + _1645;
        _1649 = _1647;
        _1651 = true;
    }
    else
    {
        float _1653 = float(_105);
        float _1655 = 1.0 / _1653;
        float _1657 = _139 * _1655;
        _1649 = _1657;
    }
    _1651 = false;
    float _1659 = _1649;
    int _1661 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1663 = _1661;
    int _1665 = 0;
    int _1667 = _96(_1663, _1665, (*spvDescriptorSet0.support_buffer));
    float _1669 = in.m_61.z;
    float _1671 = trunc(_1669);
    int _1673 = int(_1671);
    int _1675 = _1667 + (-1);
    float _1677 = float(_1675);
    float _1679 = _1629 * _1677;
    float _1681 = trunc(_1679);
    int _1683 = int(_1681);
    int _1685 = _1683;
    int _1687 = 0;
    int _1689 = _97(_1685, _1687, (*spvDescriptorSet0.support_buffer));
    int _1691 = _1673;
    int _1693 = 0;
    int _1695 = _97(_1691, _1693, (*spvDescriptorSet0.support_buffer));
    float4 _1698 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1689, _1695)), 0).xyzw;
    float _1700 = _1698.x;
    float _1702 = _1698.y;
    float _1704 = _1698.z;
    float _1706 = _1698.w;
    float _1708 = in.m_55.w;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1712 = _1710 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1722 = 1.0 / _1712;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    int _1728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1730 = _1728 != 0;
    float _1732 = 1.0 / _1716;
    bool _1734 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1736 = isnan(_1659);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1742 = _1738 || _1740;
    float _1744 = float(_1742);
    int _1746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1748 = _1746 != 0;
    int _1750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1752 = _1750 != 0;
    float _1754 = -_1744;
    float _1756 = _1754 + 1.0;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1760 = _1758 != 0;
    float _1762 = 1.0 / _1720;
    bool _1764 = _1708 > 0.5;
    bool _1766 = _1764 && _1730;
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1768;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1774 = _1772 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _1776 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1778 = isnan(_1659);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1788;
    float _1792 = _1770 * _1722;
    float _1794 = 1.0 / _1726;
    bool _1796 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1798 = isnan(_1659);
    bool _1800 = _1796 || _1798;
    bool _1802 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1804 = _1800 || _1802;
    float _1806 = float(_1804);
    float _1808 = _1774 * _1732;
    float _1810 = _1786 * _1756;
    float _1812 = -_1786;
    float _1814 = _1812 + 1.0;
    bool _1816 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1818 = isnan(_1659);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1824 = _1820 || _1822;
    float _1826 = float(_1824);
    float _1828 = -_1806;
    float _1830 = _1828 + 1.0;
    bool _1832 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1834 = isnan(_1659);
    bool _1836 = _1832 || _1834;
    bool _1838 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1840 = _1836 || _1838;
    float _1842 = float(_1840);
    float _1844 = _1790 * _1762;
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1848 = _1846 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1850 = _1806 * _1814;
    float _1852 = _1826 * _1830;
    float _1854 = -_1826;
    float _1856 = _1854 + 1.0;
    float _1858 = -_1842;
    float _1860 = _1858 + 1.0;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1864 = _1862 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1866 = _1848 * _1794;
    bool _1868 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1870 = isnan(_1659);
    bool _1872 = _1868 || _1870;
    bool _1874 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1876 = _1872 || _1874;
    float _1878 = float(_1876);
    float _1880 = _1842 * _1856;
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1884 = _1659 + _1882;
    bool _1886 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1888 = isnan(_1659);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1894 = _1890 || _1892;
    float _1896 = float(_1894);
    float _1898 = _1878 * _1860;
    float _1900 = -_1878;
    float _1902 = _1900 + 1.0;
    float _1904 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1906 = _1904 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1908 = fma(_1792, _1884, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1912 = _1659 + _1910;
    float _1914 = _1896 * _1902;
    float _1916 = 1.0 / _1906;
    float _1918 = fma(_1808, _1912, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1920 = _1908 * _1914;
    float _1922 = -_1896;
    float _1924 = _1922 + 1.0;
    float _1926 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1928 = _1926 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1930 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1932 = _1930 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1934 = in.m_61.x;
    float _1936 = 1.0 / _1864;
    float _1938 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1920);
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1942 = _1659 + _1940;
    float _1944 = in.m_61.y;
    float _1946 = fma(_1844, _1942, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1948 = fma(_1918, _1898, _1938);
    float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1952 = _1659 + _1950;
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1954;
    float _1958 = 1.0 / _1928;
    float _1960 = _1932 * _1916;
    float _1962 = fma(_1866, _1952, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1964 = _1916;
    float _1966 = _1744;
    float _1968 = _1810;
    int _1970 = as_type<int>(_1659);
    int _1972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[182].x);
    if (_1748)
    {
        float _1974 = in.m_55.x;
        _1964 = _1974;
    }
    float _1976 = _1964;
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1978;
    float _1982 = fma(_1946, _1880, _1948);
    float _1984 = _1956 * _1936;
    float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1988 = _1659 + _1986;
    float _1990 = _1938;
    if (_1752)
    {
        float _1992 = in.m_55.z;
        _1990 = _1992;
    }
    float _1994 = _1990;
    bool _1996 = _1659 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1998 = isnan(_1659);
    bool _2000 = _1996 || _1998;
    bool _2002 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2004 = _2000 || _2002;
    float _2006 = float(_2004);
    float _2008 = fma(_1962, _1852, _1982);
    float _2010 = fma(_1984, _1988, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2012 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2014 = _1659 + _2012;
    float _2016 = in.m_55.y;
    float _2018 = -_2006;
    float _2020 = _2018 + 1.0;
    float _2022 = fma(_2010, _1850, _2008);
    float _2024 = _1980 * _1958;
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2028 = _1659 + _2026;
    float _2030 = _1744 * _2020;
    int _2032 = as_type<int>(_2022);
    if (!_1748)
    {
        _1966 = _1934;
    }
    float _2034 = _1966;
    float _2036 = -_1944;
    float _2038 = _2036 + 1.0;
    float _2040 = fma(_1960, _2028, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2042 = fma(_2024, _2014, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2044 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2046 = fma(_2040, _1810, _2022);
    float _2048 = _2034;
    if (!_1748)
    {
        _1968 = _2034;
    }
    float _2050 = _1968;
    float _2052 = _2050;
    if (_1748)
    {
        _2048 = _1934;
    }
    float _2054 = _2048;
    float _2056 = fma(_2042, _2030, _2046);
    float _2058 = _1766 ? _2038 : _1944;
    bool _2060 = false;
    float _2062 = _2054;
    if (_1748)
    {
        bool _2064 = _1976 > 0.5;
        _2060 = _2064;
    }
    bool _2066 = _2060;
    if (_1748)
    {
        float _2068 = -_2054;
        float _2070 = _2068 + 1.0;
        _1970 = as_type<int>(_2070);
    }
    int _2072 = _1970;
    if (_1752)
    {
        float _2074 = -_2054;
        float _2076 = _2074 + 1.0;
        _2032 = as_type<int>(_2076);
    }
    int _2078 = _2032;
    bool _2080 = false;
    if (_1752)
    {
        bool _2082 = _1994 > 0.5;
        _2080 = _2082;
    }
    bool _2084 = _2080;
    float _2086 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2056);
    bool _2088 = _2016 > 0.5;
    bool _2090 = _2088 && _1760;
    float _2092 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1748)
    {
        float _2094 = _2066 ? as_type<float>(_2072) : _2054;
        _2052 = _2094;
    }
    float _2096 = _2052;
    float _2098 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2100 = _1683 + 1;
    out.m_63.x = _2086;
    if (_1752)
    {
        float _2102 = _2084 ? as_type<float>(_2078) : _2054;
        _2062 = _2102;
    }
    float _2104 = _2062;
    int _2106 = min(_1675, _2100);
    float _2108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2110 = _2090 ? _2038 : _1944;
    float _2112 = _2110 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2116 = _2112 * _2108;
    float _2118 = _2104 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2120 = _2118 * _2092;
    float _2122 = _2098 * _2114;
    uint _2125 = as_type<uint>(half2(float2(_1706, 0.0)));
    uint _2127 = extract_bits(_2125, 0u, 8u);
    int _2129 = int(_2127) & 255;
    uint _2131 = extract_bits(_2125, 8u, 8u);
    int _2133 = int(_2131) & 255;
    int _2135 = _2133 << 8;
    int _2137 = _2129 | _2135;
    bool _2139 = _2137 >= 32768;
    int _2141 = _2137 + (-1024);
    int _2143 = _2141;
    if (_2139)
    {
        int _2145 = ~_2137;
        int _2147 = _2145 + 33792;
        int _2149 = _2147 + 1;
        _2143 = _2149;
    }
    int _2151 = _2143;
    int _2153 = _2151 + 30719;
    float _2155 = float(_2153);
    float _2157 = fma(_2155, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2159 = abs(_2157);
    float _2161 = -_2159;
    float _2163 = _2161 + 1.0;
    float _2165 = abs(_2157);
    float _2167 = fma(_2165, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2169 = as_type<int>(_2163) + (-218103808);
    float _2171 = abs(_2157);
    float _2173 = fma(_2171, _2167, -0.212114393711090087890625);
    bool _2175 = uint(_2169) >= 1920991232u;
    float _2177 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2179 = _2157 < 0.0;
    float _2181 = float(_2179);
    float _2183 = _2177 * _2044;
    float _2185 = abs(_2157);
    float _2187 = fma(_2185, _2173, 1.570728778839111328125);
    bool _2189 = !_2175;
    float _2211;
    if (!_2189)
    {
        int _2191 = as_type<int>(_2163);
        int _2193 = as_type<int>(_1944);
        int _2195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[182].x);
        int _2197 = 11088;
        int _2199;
        int _2201;
        int _2203;
        int _2205;
        int _2207;
        int _2209;
        _94(_2191, _2193, _2195, _2197, _2199, _2201, _2203, _2205, _2207, _2209, out.gl_Position, out.gl_PointSize);
        _2211 = as_type<float>(_2203);
        _1972 = _2205;
        _2213 = true;
    }
    else
    {
        float _2215 = rsqrt(_2163);
        float _2217 = _2163 * _2215;
        float _2219 = _2215 * 0.5;
        float _2221 = -_2217;
        float _2223 = 0.0 + _2221;
        float _2225 = fma(_2219, _2223, 0.5);
        float _2227 = fma(_2217, _2225, _2217);
        float _2229 = -_2227;
        float _2231 = 0.0 + _2229;
        float _2233 = fma(_2227, _2231, _2163);
        float _2235 = fma(_2219, _2233, _2227);
        _2211 = _2235;
    }
    _2213 = false;
    float _2237 = _2211;
    int _2239 = _1972;
    int _2241 = _2106;
    int _2243 = 0;
    int _2245 = _97(_2241, _2243, (*spvDescriptorSet0.support_buffer));
    int _2247 = _1673;
    int _2249 = 0;
    int _2251 = _97(_2247, _2249, (*spvDescriptorSet0.support_buffer));
    float4 _2253 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2245, _2251)), 0).xyzw;
    float _2255 = _2253.x;
    float _2257 = _2253.y;
    float _2259 = _2253.z;
    float _2261 = _2253.w;
    float _2263 = _2187 * _2237;
    float _2265 = _2181 * 2.0;
    float _2267 = _2155 * 3.883221149444580078125;
    float _2269 = floor(_1679);
    float _2271 = -_2265;
    float _2273 = fma(_2263, _2271, _2263);
    float _2275 = _2267 * 0.15915493667125701904296875;
    float _2277 = fma(_2181, 3.1415927410125732421875, _2273);
    float _2279 = _2275 * 6.283185482025146484375;
    float _2281 = cos(_2279);
    float _2283 = _2277 * 0.15915493667125701904296875;
    float _2285 = _2283 * 6.283185482025146484375;
    float _2287 = sin(_2285);
    float _2289 = -_2269;
    float _2291 = _1679 + _2289;
    float _2293 = _2275 * 6.283185482025146484375;
    float _2295 = sin(_2293);
    float _2297 = _2287 * _2281;
    float _2299 = _2287 * _2295;
    uint _2301 = as_type<uint>(half2(float2(_2261, 0.0)));
    float _2303 = -_1700;
    float _2305 = _2303 + _2255;
    float _2307 = -_1704;
    float _2309 = _2307 + _2259;
    uint _2311 = extract_bits(_2301, 0u, 8u);
    int _2313 = int(_2311) & 255;
    uint _2315 = extract_bits(_2301, 8u, 8u);
    int _2317 = int(_2315) & 255;
    int _2319 = _2317 << 8;
    int _2321 = _2313 | _2319;
    float _2323 = fma(_2291, _2305, _1700);
    float _2325 = fma(_2291, _2309, _1704);
    bool _2327 = _2321 >= 32768;
    int _2329 = _2321 + (-1024);
    int _2331 = _2329;
    if (_2327)
    {
        int _2333 = ~_2321;
        int _2335 = _2333 + 33792;
        int _2337 = _2335 + 1;
        _2331 = _2337;
    }
    int _2339 = _2331;
    int _2341 = _2339 + 30719;
    float _2343 = float(_2341);
    float _2345 = fma(_2343, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2347 = abs(_2345);
    float _2349 = -_2347;
    float _2351 = _2349 + 1.0;
    float _2353 = abs(_2345);
    float _2355 = fma(_2353, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _2357 = -_1702;
    float _2359 = _2357 + _2257;
    int _2361 = as_type<int>(_2351) + (-218103808);
    float _2363 = abs(_2345);
    float _2365 = fma(_2363, _2355, -0.212114393711090087890625);
    float _2367 = fma(_2291, _2359, _1702);
    bool _2369 = _2345 < 0.0;
    float _2371 = float(_2369);
    bool _2373 = uint(_2361) >= 1920991232u;
    float _2375 = abs(_2345);
    float _2377 = fma(_2375, _2365, 1.570728778839111328125);
    bool _2379 = !_2373;
    float _2401;
    if (!_2379)
    {
        int _2381 = as_type<int>(_2351);
        int _2383 = as_type<int>(_2351);
        int _2385 = _2239;
        int _2387 = 11984;
        int _2389;
        int _2391;
        int _2393;
        int _2395;
        int _2397;
        int _2399;
        _94(_2381, _2383, _2385, _2387, _2389, _2391, _2393, _2395, _2397, _2399, out.gl_Position, out.gl_PointSize);
        _2401 = as_type<float>(_2393);
        _2403 = true;
    }
    else
    {
        float _2405 = rsqrt(_2351);
        float _2407 = _2351 * _2405;
        float _2409 = _2405 * 0.5;
        float _2411 = -_2407;
        float _2413 = 0.0 + _2411;
        float _2415 = fma(_2409, _2413, 0.5);
        float _2417 = fma(_2407, _2415, _2407);
        float _2419 = -_2417;
        float _2421 = 0.0 + _2419;
        float _2423 = fma(_2417, _2421, _2351);
        float _2425 = fma(_2409, _2423, _2417);
        _2401 = _2425;
    }
    _2403 = false;
    float _2427 = _2401;
    float _2429 = in.m_55.x;
    float _2431 = in.m_55.y;
    float _2433 = in.m_55.z;
    float _2435 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2437 = log2(_2435);
    float _2439 = _613 * _613;
    float _2441 = _2377 * _2427;
    int _2443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2445 = _2443 != 0;
    int _2447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2449 = _2447 != 0;
    int _2451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2453 = _2451 != 0;
    float _2455 = fma(_615, _615, _2439);
    float _2457 = _999 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2459 = _2343 * 3.883221149444580078125;
    float _2461 = fma(_617, _617, _2455);
    float _2463 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2465 = _2459 * 0.15915493667125701904296875;
    float _2467 = rsqrt(_2461);
    float _2469 = -_2157;
    float _2471 = _2469 + _2345;
    float _2473 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2475 = _2433 * 2.0;
    float _2477 = _2429 * 2.0;
    float _2479 = _2431 * 2.0;
    float _2481 = floor(_2477);
    float _2483 = _2467 * _615;
    float _2485 = _2467 * _613;
    float _2487 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2489 = _2483 * _2487;
    float _2491 = floor(_2475);
    float _2493 = _2429 + _2433;
    float _2495 = _2493 + (-1.0);
    float _2497 = floor(_2479);
    bool _2499 = _2481 >= 0.0;
    bool _2501 = isnan(_2481);
    bool _2503 = _2499 || _2501;
    bool _2505 = isnan(0.0);
    bool _2507 = _2503 || _2505;
    int _2509 = _2507 ? 0 : 1;
    bool _2511 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2513 = isnan(0.0);
    bool _2515 = _2511 || _2513;
    bool _2517 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2519 = _2515 || _2517;
    bool _2521 = _2491 > 0.0;
    float _2523 = _2437 * _139;
    bool _2525 = _2491 >= 0.0;
    bool _2527 = isnan(_2491);
    bool _2529 = _2525 || _2527;
    bool _2531 = isnan(0.0);
    bool _2533 = _2529 || _2531;
    float _2535 = _2431 + _2429;
    float _2537 = fma(_2495, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2539 = _2535 + (-1.0);
    int _2541 = _2533 ? 0 : 1;
    bool _2543 = _2481 > 0.0;
    float _2545 = fma(_2539, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2547 = ~_2541;
    int _2549 = _2547 + 1;
    int _2551 = _2549 + 1;
    float _2553 = exp2(_2523);
    int _2555 = _2551;
    if (!_2521)
    {
        int _2557 = ~_2541;
        int _2559 = _2557 + 1;
        _2555 = _2559;
    }
    int _2561 = _2555;
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2565 = 1.0 + _2563;
    bool _2567 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2569 = isnan(1.0);
    bool _2571 = _2567 || _2569;
    bool _2573 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2575 = _2571 || _2573;
    bool _2577 = !_2445;
    int _2579 = _2577 ? 0 : 1;
    bool _2581 = _2497 > 0.0;
    float _2583 = 1.0 / _2565;
    bool _2585 = _2497 >= 0.0;
    bool _2587 = isnan(_2497);
    bool _2589 = _2585 || _2587;
    bool _2591 = isnan(0.0);
    bool _2593 = _2589 || _2591;
    float _2595 = _2467 * _617;
    int _2597 = abs(_2579);
    float _2599 = float(_2561);
    float _2601 = float(_2597);
    float _2603 = -_2553;
    float _2605 = _2603 + 1.0;
    int _2607 = _2593 ? 0 : 1;
    float _2609 = in.m_65.x;
    float _2611 = in.m_65.y;
    float _2613 = in.m_65.z;
    bool _2615 = !_2453;
    int _2617 = _2615 ? 0 : 1;
    float _2619 = _2601 * _2599;
    float _2621 = _2519 ? _2605 : 0.0;
    float _2623 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2625 = _2485 * _2623;
    int _2627 = ~_2509;
    int _2629 = _2627 + 1;
    int _2631 = _2629 + 1;
    float _2633 = _2619 * (-2.0);
    int _2635 = ~_2607;
    int _2637 = _2635 + 1;
    int _2639 = _2637 + 1;
    int _2641 = _2631;
    int _2643 = _2639;
    if (_2575)
    {
        float _2645 = _2621 * _2583;
        _145 = _2645;
    }
    float _2647 = _145;
    if (!_2543)
    {
        int _2649 = ~_2509;
        int _2651 = _2649 + 1;
        _2641 = _2651;
    }
    int _2653 = _2641;
    float _2655 = _2429 + (-0.5);
    if (!_2581)
    {
        int _2657 = ~_2607;
        int _2659 = _2657 + 1;
        _2643 = _2659;
    }
    int _2661 = _2643;
    float _2663 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2665 = _2595 * _2663;
    int _2667 = abs(_2617);
    float _2669 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2671 = -_2625;
    float _2673 = fma(_2595, _2669, _2671);
    float _2675 = float(_2661);
    float _2677 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _2679 = -_2665;
    float _2681 = fma(_2483, _2677, _2679);
    float _2683 = float(_2667);
    float _2685 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _2687 = -_2489;
    float _2689 = fma(_2485, _2685, _2687);
    bool _2691 = !_2449;
    int _2693 = _2691 ? 0 : 1;
    float _2695 = _2681 * _2681;
    float _2697 = float(_2653);
    float _2699 = _2683 * _2675;
    bool _2701 = _2367 != 0.0;
    bool _2703 = isnan(_2367);
    bool _2705 = _2701 || _2703;
    bool _2707 = isnan(0.0);
    bool _2709 = _2705 || _2707;
    float _2711 = fma(_2633, _2609, _2609);
    float _2713 = fma(_2545, _2633, _2545);
    int _2715 = abs(_2693);
    float _2717 = _2699 * (-2.0);
    float _2719 = fma(_2655, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2711);
    float _2721 = fma(_2673, _2673, _2695);
    bool _2723 = _2323 == 0.0;
    bool _2725 = !_2709;
    bool _2727 = _2723 && _2725;
    float _2729 = fma(_2537, _2717, _2537);
    float _2731 = fma(_2713, _2647, _2719);
    float _2733 = _2433 + (-0.5);
    float _2735 = fma(_2689, _2689, _2721);
    bool _2737 = _2325 == 0.0;
    bool _2739 = _2737 && _2727;
    float _2741 = _2731 * 0.15915493667125701904296875;
    float _2743 = float(_2715);
    float _2745 = fma(_2717, _2613, _2613);
    float _2747 = rsqrt(_2735);
    float _2749 = fma(_2733, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2745);
    float _2751 = _2743 * _2697;
    float _2753 = _2431 + _2433;
    float _2755 = _2431 + (-0.5);
    float _2757 = _2751 * (-2.0);
    float _2759 = _2753 + (-1.0);
    float _2761 = fma(_2729, _2647, _2749);
    float _2763 = _2741 * 6.283185482025146484375;
    float _2765 = sin(_2763);
    float _2767 = fma(_2757, _2611, _2611);
    float _2769 = fma(_2759, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2771 = _2761 * 0.15915493667125701904296875;
    float _2773 = fma(_2755, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2767);
    float _2775 = fma(_2769, _2757, _2769);
    float _2777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2367);
    float _2779 = _2741 * 6.283185482025146484375;
    float _2781 = cos(_2779);
    float _2783 = _2689 * _2747;
    float _2785 = fma(_2775, _2647, _2773);
    float _2787 = _981 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2789 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2325);
    float _2791 = _2371 * 2.0;
    float _2793 = _2785 * 0.15915493667125701904296875;
    float _2795 = _1023 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2797 = _2771 * 6.283185482025146484375;
    float _2799 = sin(_2797);
    float _2801 = _2457 * _2789;
    float _2803 = _2681 * _2747;
    float _2805 = -_2791;
    float _2807 = fma(_2441, _2805, _2441);
    float _2809 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2323);
    float _2811 = _2787 * _2777;
    float _2813 = _2673 * _2747;
    float _2815 = fma(_2371, 3.1415927410125732421875, _2807);
    float _2817 = _2771 * 6.283185482025146484375;
    float _2819 = cos(_2817);
    float _2821 = _2795 * _2809;
    float _2823 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2825 = _2793 * 6.283185482025146484375;
    float _2827 = sin(_2825);
    float _2829 = _2781 * _2799;
    float _2831 = _2765 * _2799;
    float _2833 = _2793 * 6.283185482025146484375;
    float _2835 = cos(_2833);
    float _2837 = _2781 * _2819;
    float _2839 = _2765 * _2819;
    float _2841 = -_2829;
    float _2843 = fma(_2827, _2839, _2841);
    float _2845 = fma(_2827, _2831, _2837);
    float _2847 = -_2839;
    float _2849 = fma(_2827, _2829, _2847);
    float _2851 = fma(_2827, _2837, _2831);
    float _2853 = _2485 * _2783;
    float _2855 = _2845 * _2483;
    float _2857 = _2849 * _2483;
    float _2859 = _2845 * _2595;
    float _2861 = _2835 * _2799;
    float _2863 = _2781 * _2835;
    float _2865 = _2835 * _2819;
    float _2867 = _2765 * _2835;
    float _2869 = _2861 * _2483;
    float _2871 = -_2853;
    float _2873 = fma(_2595, _2803, _2871);
    float _2875 = fma(_2843, _2813, _2855);
    float _2877 = fma(_2851, _2813, _2857);
    float _2879 = fma(_2865, _2813, _2869);
    float _2881 = _2849 * _2595;
    float _2883 = fma(_2867, _2873, _2875);
    float _2885 = fma(_2863, _2873, _2877);
    float _2887 = -_2827;
    float _2889 = fma(_2887, _2873, _2879);
    float _2891 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2463);
    float _2893 = _2483 * _2803;
    float _2895 = _2861 * _2595;
    float _2897 = fma(_2851, _2783, _2881);
    float _2899 = _2815 * 0.15915493667125701904296875;
    float _2901 = -_2893;
    float _2903 = fma(_2485, _2813, _2901);
    float _2905 = fma(_2843, _2783, _2859);
    float _2907 = fma(_2865, _2783, _2895);
    float _2909 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2823);
    float _2911 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2891);
    float _2913 = fma(_2867, _2903, _2905);
    float _2915 = fma(_2863, _2903, _2897);
    float _2917 = -_2827;
    float _2919 = fma(_2917, _2903, _2907);
    float _2921 = _2811 * _2883;
    float _2923 = _2811 * _2913;
    float _2925 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2909);
    float _2927 = _2465 * 6.283185482025146484375;
    float _2929 = sin(_2927);
    float _2931 = fma(_2821, _2889, _2921);
    float _2933 = fma(_2821, _2919, _2923);
    float _2935 = _2911 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2937 = _2925 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2939 = fma(_2801, _2885, _2931);
    float _2941 = fma(_2801, _2915, _2933);
    float _2943 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2473);
    float _2945 = _2899 * 6.283185482025146484375;
    float _2947 = sin(_2945);
    float _2949 = _2935 + _2939;
    float _2951 = _2937 + _2941;
    float _2953 = _2595 * _2813;
    float _2955 = _2845 * _2485;
    float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2959 = _2949 + _2957;
    float _2961 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2963 = _2951 + _2961;
    float _2965 = _2861 * _2485;
    float _2967 = -_2953;
    float _2969 = fma(_2483, _2783, _2967);
    float _2971 = _2959 * _2959;
    float _2973 = _2963 * _2963;
    float _2975 = fma(_2843, _2803, _2955);
    float _2977 = fma(_2865, _2803, _2965);
    float _2979 = _2849 * _2485;
    float _2981 = _2971 + _2973;
    float _2983 = fma(_2867, _2969, _2975);
    float _2985 = -_2299;
    float _2987 = fma(_2947, _2929, _2985);
    float _2989 = fma(_2291, _2471, _2157);
    float _2991 = _2465 * 6.283185482025146484375;
    float _2993 = cos(_2991);
    float _2995 = fma(_2851, _2803, _2979);
    float _2997 = fma(_2291, _2987, _2299);
    float _2999 = fma(_2367, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2989);
    float _3001 = -_2827;
    float _3003 = fma(_3001, _2969, _2977);
    float _3005 = _2811 * _2983;
    float _3007 = fma(_2325, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2997);
    float _3009 = fma(_2863, _2969, _2995);
    float _3011 = sqrt(_2981);
    float _3013 = _2739 ? _2989 : _2999;
    float _3015 = fma(_2821, _3003, _3005);
    float _3017 = _2739 ? _2997 : _3007;
    float _3019 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2943);
    float _3021 = _3013 * _3013;
    float _3023 = fma(_2801, _3009, _3015);
    float _3025 = _3019 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3027 = -_2297;
    float _3029 = fma(_2947, _2993, _3027);
    float _3031 = fma(_3017, _3017, _3021);
    float _3033 = _3025 + _3023;
    float _3035 = fma(_2291, _3029, _2297);
    float _3037 = rsqrt(_3031);
    bool _3039 = _3011 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3041 = _2971;
    float _3043 = _2973;
    float _3045 = _2981;
    float _3047 = _2949;
    float _3049 = _2951;
    float _3051 = _2989;
    float _3053 = _3035;
    if (!_3039)
    {
        _443 = _3033;
    }
    float _3055 = _443;
    bool _3057 = !_3039;
    float _3059 = _3055;
    if (!_3057)
    {
        float _3061 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3063 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3065 = _3011 + _3063;
        float _3067 = rsqrt(_2981);
        float _3069 = _3065 * _3061;
        float _3071 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3073 = _3069 * 0.15915493667125701904296875;
        float _3075 = _3073 * 6.283185482025146484375;
        float _3077 = sin(_3075);
        float _3079 = _3073 * 6.283185482025146484375;
        float _3081 = cos(_3079);
        float _3083 = fma(_3077, _3071, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3085 = _3067 * _3083;
        float _3087 = _3081 + (-1.0);
        float _3089 = _2959 * _3085;
        float _3091 = _2963 * _3085;
        float _3093 = _3087 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3095 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3097 = _3089 * _3089;
        float _3099 = _3091 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3101 = fma(_3033, _3081, _3093);
        float _3103 = _3091 * _3091;
        _3059 = _3101;
        _3041 = _3097;
        _3043 = _3103;
        _3045 = _3067;
        _3047 = _3095;
        _3049 = _3099;
    }
    float _3105 = _3059;
    float _3107 = _3041;
    float _3109 = _3043;
    float _3111 = _3045;
    float _3113 = _3047;
    float _3115 = _3049;
    float _3117 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3119 = _3105 + _3117;
    float _3121 = _3111;
    if (!_2739)
    {
        _3051 = _2999;
    }
    float _3123 = _3051;
    if (!_2739)
    {
        float _3125 = fma(_2323, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3035);
        _3053 = _3125;
    }
    float _3127 = _3053;
    if (_2739)
    {
        _3121 = _2997;
    }
    float _3129 = _3121;
    float _3131 = fma(_3119, _3119, _3107);
    float _3133 = _3013 * _3037;
    float _3135 = _3129;
    if (!_2739)
    {
        _3135 = _3007;
    }
    float _3137 = _3135;
    float _3139 = _2983 * _3123;
    float _3141 = _3131 + _3109;
    float _3143 = _2883 * _3123;
    float _3145 = _2913 * _3123;
    float _3147 = _3017 * _3037;
    float _3149 = -_3133;
    float _3151 = _2915 * _3149;
    float _3153 = fma(_3003, _3127, _3139);
    float _3155 = sqrt(_3141);
    float _3157 = -_3133;
    float _3159 = _2885 * _3157;
    float _3161 = -_3133;
    float _3163 = _3009 * _3161;
    float _3165 = fma(_2889, _3127, _3143);
    float _3167 = fma(_2919, _3127, _3145);
    float _3169 = fma(_2913, _3147, _3151);
    float _3171 = fma(_3009, _3137, _3153);
    float _3173 = fma(_2883, _3147, _3159);
    float _3175 = fma(_2983, _3147, _3163);
    float _3177 = fma(_2885, _3137, _3165);
    float _3179 = fma(_2915, _3137, _3167);
    out.m_67.x = _2183;
    out.m_67.y = _2116;
    out.m_67.z = _2120;
    out.m_67.w = _2122;
    out.m_69.x = _2889;
    out.m_69.y = _3003;
    out.m_69.z = _2919;
    bool _3181 = _3155 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3183 = isnan(_3155);
    bool _3185 = _3181 || _3183;
    bool _3187 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3189 = _3185 || _3187;
    out.m_71.x = _3173;
    out.m_71.y = _3175;
    out.m_71.z = _3169;
    out.m_73.x = _3177;
    out.m_73.y = _3171;
    out.m_73.z = _3179;
    float _3191 = _3147;
    float _3193 = _3173;
    float _3195 = _3177;
    if (!_3189)
    {
        _3191 = 1.0;
    }
    float _3197 = _3191;
    bool _3199 = !_3189;
    float _3201 = _3197;
    if (!_3199)
    {
        bool _3203 = _3155 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3205 = isnan(_3155);
        bool _3207 = _3203 || _3205;
        bool _3209 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3211 = _3207 || _3209;
        if (!_3211)
        {
            float _3213 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3215 = _3155 + _3213;
            float _3217 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3219 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3217;
            float _3221 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3223 = _3221 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3225 = 1.0 / _3219;
            float _3227 = _3215 * _3225;
            float _3229 = fma(_3227, _3223, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3201 = _3229;
            _3231 = true;
        }
        else
        {
            bool _3233 = _3155 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3235 = isnan(_3155);
            bool _3237 = _3233 || _3235;
            bool _3239 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3241 = _3237 || _3239;
            if (!_3241)
            {
                float _3243 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3245 = _3155 + _3243;
                float _3247 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3249 = _3247 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3251 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3253 = _3251 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3255 = 1.0 / _3249;
                float _3257 = _3245 * _3255;
                float _3259 = fma(_3257, _3253, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3201 = _3259;
                _3231 = true;
            }
            else
            {
                _3201 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3231 = false;
    float _3261 = _3201;
    float _3263 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3265 = _3105 + _3263;
    float _3267 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3269 = _3113 + _3267;
    float _3271 = fma(_3265, _3261, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3273 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3275 = _3115 + _3273;
    float _3277 = fma(_3269, _3261, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3279 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3281 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3283 = _3271 + _3281;
    float _3285 = fma(_3275, _3261, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3287 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3289 = _3277 + _3287;
    float _3291 = _3283 * _3283;
    float _3293 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3295 = _3285 + _3293;
    float _3297 = fma(_3289, _3289, _3291);
    float _3299 = fma(_3295, _3295, _3297);
    float _3301 = rsqrt(_3299);
    float _3303 = _3301 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3305 = _3289 * _3303;
    float _3307 = _3295 * _3303;
    float _3309 = _3305 * _3305;
    float _3311 = _3307 * _3307;
    float _3313 = _3309 + _3311;
    float _3315 = sqrt(_3313);
    bool _3317 = _3315 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3321 = _3315 + _3319;
    float _3323 = _3295;
    float _3325 = _3261;
    float _3327 = _3321;
    float _3329 = _3305;
    if (_3317)
    {
        float _3331 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3323 = _3331;
    }
    float _3333 = _3323;
    if (_3317)
    {
        float _3335 = rsqrt(_3313);
        _3325 = _3335;
    }
    float _3337 = _3325;
    float _3339 = _3337;
    if (_3317)
    {
        float _3341 = _3321 * _3333;
        _3327 = _3341;
    }
    float _3343 = _3327;
    float _3345 = _3271 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3317)
    {
        float _3347 = _3343 * 0.15915493667125701904296875;
        _3193 = _3347;
    }
    float _3349 = _3193;
    float _3351 = fma(_3277, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3345);
    float _3353 = _3301;
    if (_3317)
    {
        float _3355 = _3349 * 6.283185482025146484375;
        float _3357 = sin(_3355);
        _3353 = _3357;
    }
    float _3359 = _3353;
    float _3361 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3363 = precise::max(0.0, _3361);
    float _3365 = _3291;
    float _3367 = _3363;
    float _3369 = _3361;
    if (_3317)
    {
        float _3371 = _3349 * 6.283185482025146484375;
        float _3373 = cos(_3371);
        _3365 = _3373;
    }
    float _3375 = _3365;
    float _3377 = -_3303;
    float _3379 = -_3363;
    float _3381 = fma(_3283, _3377, _3379);
    if (_3317)
    {
        float _3383 = _3381 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3367 = _3383;
    }
    float _3385 = _3367;
    float _3387 = sqrt(_3299);
    float _3389 = _3385;
    float _3391 = _3359;
    if (_3317)
    {
        float _3393 = fma(_3359, _3385, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3389 = _3393;
    }
    float _3395 = _3389;
    float _3397 = _3395;
    if (!_3317)
    {
        _3391 = _3307;
    }
    float _3399 = _3391;
    float _3401 = _3399;
    if (_3317)
    {
        float _3403 = _3375 + (-1.0);
        _3369 = _3403;
    }
    float _3405 = _3369;
    float _3407 = _3405;
    if (_3317)
    {
        float _3409 = _3337 * _3395;
        _3195 = _3409;
    }
    float _3411 = _3195;
    if (!_3317)
    {
        _3339 = _3381;
    }
    float _3413 = _3339;
    float _3415 = _3413;
    if (_3317)
    {
        float _3417 = _3405 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3407 = _3417;
    }
    float _3419 = _3407;
    float _3421 = _3419;
    if (_3317)
    {
        float _3423 = _3305 * _3411;
        _3329 = _3423;
    }
    float _3425 = _3329;
    if (!_3317)
    {
        _3397 = _3309;
    }
    float _3427 = _3397;
    float _3429 = _3427;
    if (_3317)
    {
        float _3431 = _3307 * _3411;
        _3401 = _3431;
    }
    float _3433 = _3401;
    if (_3317)
    {
        float _3435 = fma(_3381, _3375, _3419);
        _3415 = _3435;
    }
    float _3437 = _3415;
    if (_3317)
    {
        float _3439 = _3425 * _3425;
        _3429 = _3439;
    }
    float _3441 = _3429;
    if (!_3317)
    {
        _3421 = _3311;
    }
    float _3443 = _3421;
    float _3445 = _3443;
    if (_3317)
    {
        float _3447 = _3433 * _3433;
        _3445 = _3447;
    }
    float _3449 = _3445;
    float _3451 = fma(_3437, _3437, _3441);
    float _3453 = _3271 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3455 = _3451 + _3449;
    float _3457 = _3271 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3461 = fma(_3387, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3459);
    float _3463 = precise::clamp(_3461, 0.0, 1.0);
    float _3465 = fma(_3277, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3453);
    float _3467 = rsqrt(_3455);
    float _3469 = fma(_3277, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3457);
    float _3471 = _3271 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3473 = -_3463;
    float _3475 = _3473 + 1.0;
    float _3477 = fma(_3285, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3465);
    float _3479 = fma(_3285, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3469);
    float _3481 = fma(_3277, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3471);
    float _3483 = _3477 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3485 = _3479 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3487 = fma(_3285, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3481);
    float _3489 = abs(_3475);
    float _3491 = log2(_3489);
    float _3493 = _3485 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3495 = _3487 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3497 = _3467 * _3425;
    float _3499 = _3467 * _3437;
    float _3501 = _3495 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3503 = -_3493;
    float _3505 = fma(_3503, _3279, 1.0);
    float _3507 = _3497 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3509 = fma(_3285, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3351);
    float _3511 = fma(_3483, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3501);
    float _3513 = _3467 * _3433;
    float _3515 = -_3507;
    float _3517 = fma(_3499, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3515);
    float _3519 = _3509 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3521 = fma(_3485, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3511);
    float _3523 = _3491 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3525 = -_3513;
    float _3527 = fma(_3525, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3517);
    float _3529 = _3495 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3531 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3521);
    float _3533 = exp2(_3523);
    float _3535 = fma(_3527, -0.5, 0.5);
    float _3537 = _3495 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3539 = fma(_3483, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3529);
    float _3541 = fma(_3527, 0.5, 0.5);
    float _3543 = fma(_3483, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3537);
    float _3545 = _3499 + 1.0;
    float _3547 = log2(_3505);
    float _3549 = fma(_3485, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3539);
    float _3551 = fma(_3485, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3543);
    float _3553 = fma(_3541, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3555 = fma(_3541, _3553, -0.212114393711090087890625);
    float _3557 = 1.0 / _3531;
    float _3559 = -_3499;
    float _3561 = fma(_3533, _3545, _3559);
    float _3563 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3549);
    float _3565 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3551);
    float _3567 = fma(_3541, _3555, 1.570728778839111328125);
    float _3569 = fma(_3561, 0.5, 0.5);
    float _3571 = sqrt(_3535);
    float _3573 = _3547 * 0.693147182464599609375;
    float _3575 = _3573 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3577 = _3563 * _3557;
    float _3579 = _3565 * _3557;
    float _3581 = fma(_3577, 0.5, 0.5);
    float _3583 = fma(_3579, -0.5, 0.5);
    float _3585 = _3571 * 0.636619746685028076171875;
    float3 _9052 = float3(_3581, _3583, _3575);
    float _3587 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9052, float3(0.0), isnan(_9052)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9052, float3(0.0), isnan(_9052)), level(0.0)).x;
    float3 _9063 = float3(_3581, _3583, _3575);
    float4 _3589 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9063, float3(0.0), isnan(_9063)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9063, float3(0.0), isnan(_9063)), level(0.0)).xyzw;
    float _3591 = _3589.x;
    float _3593 = _3589.y;
    float _3595 = _3589.z;
    float _3597 = _3589.w;
    float _3599 = -_3567;
    float _3601 = fma(_3585, _3599, 1.0);
    float2 _9084 = float2(_3601, _3569);
    float3 _3605 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9084, float2(0.0), isnan(_9084)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9084, float2(0.0), isnan(_9084)), level(0.0)).xyz;
    float _3607 = _3605.x;
    float _3609 = _3605.y;
    float _3611 = _3605.z;
    float _3613 = _3491 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3615 = _3495 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _2935;
    out.m_75.y = _3025;
    out.m_75.z = _2937;
    float _3617 = fma(_3483, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3615);
    float _3619 = exp2(_3613);
    out.m_77.x = _3277;
    out.m_77.y = _3271;
    out.m_77.z = _3285;
    float _3621 = fma(_3485, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3617);
    float _3623 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3621);
    float _3625 = _3623 + _3531;
    out.gl_Position.x = _3563;
    out.gl_Position.y = _3565;
    out.gl_Position.z = _3623;
    out.gl_Position.w = _3531;
    float _3627 = -_3619;
    float _3629 = _3627 + 1.0;
    float _3631 = _3625 * 0.5;
    float _3633 = _3629 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3635 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3637 = -_3633;
    float _3639 = _3637 + 1.0;
    out.m_79.z = _3631;
    out.m_79.w = _3531;
    out.m_49.x = _3635;
    float _3641 = _3633 * _3587;
    float _3643 = _3597 * _3641;
    float _3645 = _3611 * _3641;
    float _3647 = fma(_3607, _3643, _3591);
    float _3649 = fma(_3609, _3643, _3593);
    float _3651 = _3597 * _3639;
    float _3653 = fma(_3597, _3645, _3595);
    out.m_81.x = _3647;
    out.m_81.y = _3649;
    out.m_81.z = _3653;
    out.m_81.w = _3651;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

