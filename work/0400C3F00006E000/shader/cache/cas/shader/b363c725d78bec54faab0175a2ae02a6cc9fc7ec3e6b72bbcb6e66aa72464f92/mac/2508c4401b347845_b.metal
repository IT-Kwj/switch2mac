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
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
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
    float4 m_65 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_69 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_71 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_53 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
};

static inline __attribute__((always_inline))
int _96(thread const int& _9594, thread const int& _9595, constant _10& support_buffer)
{
    float _9598 = as_type<float>(support_buffer._m4);
    int _9600 = _9595 + as_type<int>(_9598);
    int _9602 = 1 + _9600;
    float _9604 = support_buffer._m5[_9602].x;
    float _9606 = abs(_9604);
    bool _9608 = _9606 == 1.0;
    if (_9608)
    {
        return _9594;
    }
    float _9610 = float(_9594);
    float _9612 = _9610 / _9606;
    int _9614 = int(_9612);
    return _9614;
}

static inline __attribute__((always_inline))
int _97(thread const int& _9644, thread const int& _9645, constant _10& support_buffer)
{
    float _9648 = as_type<float>(support_buffer._m4);
    int _9650 = _9645 + as_type<int>(_9648);
    int _9652 = 1 + _9650;
    float _9654 = support_buffer._m5[_9652].x;
    bool _9656 = _9654 == 1.0;
    if (_9656)
    {
        return _9644;
    }
    float _9658 = float(_9644);
    float _9660 = _9658 * _9654;
    int _9662 = int(_9660);
    return _9662;
}

static inline __attribute__((always_inline))
void _94(thread const int& _9292, thread const int& _9293, thread const int& _9294, thread const int& _9295, thread int& _9296, thread int& _9297, thread int& _9298, thread int& _9299, thread int& _9300, thread int& _9301, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _9304 = _9293;
    int _9306 = _9292;
    float _9308 = 0.0 + as_type<float>(_9292);
    bool _9310 = _9308 != 0.0;
    bool _9312 = isnan(_9308);
    bool _9314 = _9310 || _9312;
    bool _9316 = isnan(0.0);
    bool _9318 = _9314 || _9316;
    int _9320 = 0;
    int _9322 = _9318 ? (-1) : 0;
    if (!_9318)
    {
        float _9324 = as_type<float>(_9292) * 1.0;
        _9304 = as_type<int>(_9324);
    }
    int _9326 = _9304;
    bool _9328 = !_9318;
    int _9330 = _9326;
    int _9332 = _9326;
    if (!_9328)
    {
        bool _9334 = _9308 >= 0.0;
        bool _9336 = isnan(_9308);
        bool _9338 = _9334 || _9336;
        bool _9340 = isnan(0.0);
        bool _9342 = _9338 || _9340;
        _9322 = _9342 ? (-1) : 0;
        if (!_9342)
        {
            _9330 = 2147483647;
        }
        int _9344 = _9330;
        bool _9346 = !_9342;
        int _9348 = _9344;
        _9332 = _9344;
        if (!_9346)
        {
            float _9350 = abs(as_type<float>(_9292));
            float _9352 = 0.0 + _9350;
            bool _9354 = _9352 > as_type<float>(0x7f800000u /* inf */);
            bool _9356 = isnan(_9352);
            bool _9358 = _9354 || _9356;
            bool _9360 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _9362 = _9358 || _9360;
            _9320 = 2139095040;
            _9322 = _9362 ? (-1) : 0;
            if (_9362)
            {
                float _9364 = as_type<float>(_9292) + 1.0;
                _9348 = as_type<int>(_9364);
            }
            int _9366 = _9348;
            int _9368 = _9366;
            _9332 = _9366;
            if (!_9362)
            {
                bool _9370 = _9352 != as_type<float>(0x7f800000u /* inf */);
                bool _9372 = isnan(_9352);
                bool _9374 = _9370 || _9372;
                bool _9376 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _9378 = _9374 || _9376;
                _9322 = _9378 ? (-1) : 0;
                if (!_9378)
                {
                    _9368 = _9292;
                }
                int _9380 = _9368;
                bool _9382 = !_9378;
                _9332 = _9380;
                if (!_9382)
                {
                    float _9384 = as_type<float>(_9292) * 18446744073709551616.0;
                    float _9386 = rsqrt(_9384);
                    float _9388 = _9384 * _9386;
                    float _9390 = _9386 * 0.5;
                    float _9392 = -_9388;
                    float _9394 = 0.0 + _9392;
                    float _9396 = fma(_9390, _9394, 0.5);
                    float _9398 = fma(_9388, _9396, _9388);
                    float _9400 = -_9398;
                    float _9402 = 0.0 + _9400;
                    float _9404 = fma(_9398, _9402, _9384);
                    float _9406 = fma(_9390, _9404, _9398);
                    float _9408 = _9406 * 2.3283064365386962890625e-10;
                    _9306 = as_type<int>(_9384);
                    _9320 = as_type<int>(_9390);
                    _9332 = as_type<int>(_9408);
                }
            }
        }
    }
    int _9410 = _9306;
    int _9412 = _9320;
    int _9414 = _9332;
    int _9416 = _9322;
    _9296 = _9410;
    _9297 = _9412;
    _9298 = _9414;
    _9299 = _9295;
    _9300 = 0;
    _9301 = _9416;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3331 = false;
    bool _2503 = false;
    bool _2315 = false;
    bool _829 = false;
    bool _707 = false;
    bool _535 = false;
    bool _309 = false;
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
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_109)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3807 = as_type<float>(_119);
        out.gl_Position.z = _3807;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_51.w;
    float _125 = float(_105);
    float _127 = in.m_53.x;
    float _129 = 1.0 / _125;
    float _131 = -_123;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_123);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = _133 * _129;
    bool _147 = _133 >= _125;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    out.m_55.x = _127;
    out.m_57.x = _145;
    float _153 = _123;
    float _155 = _133;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _153;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _159 = _157 * 5.0;
        _121 = as_type<int>(_159);
    }
    int _161 = _121;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3883 = as_type<float>(_161);
        out.gl_Position.z = _3883;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = in.m_59.x;
    float _165 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = in.m_59.y;
    bool _169 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _171 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _173 = _169 || _171;
    bool _175 = isnan(1.0);
    bool _177 = _173 || _175;
    float _179 = in.m_61.w;
    float _181 = in.m_51.x;
    float _183 = in.m_51.y;
    float _185 = in.m_51.z;
    float _187 = in.m_46.x;
    float _189 = in.m_46.y;
    float _191 = in.m_46.z;
    float _193 = 0.0;
    float _195 = _165;
    if (!_177)
    {
        float _197 = _165 * _165;
        float _199 = _197 * 0.5;
        _193 = _199;
    }
    float _201 = _193;
    float _203 = _201;
    if (!_177)
    {
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _205;
    }
    float _207 = _203;
    out.m_63.x = _163;
    out.m_63.y = _167;
    bool _209 = !_177;
    float _211 = _207;
    float _213 = _163;
    if (!_209)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _165 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _165);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _243;
    }
    float _245 = _211;
    bool _247 = !_177;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _165 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _195 = _267;
    }
    float _269 = _195;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _273 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _275 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _277 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _279 = fma(_269, _181, _273);
    float _281 = fma(_269, _183, _275);
    float _283 = fma(_269, _185, _277);
    float _285 = fma(_279, _179, _187);
    float _287 = fma(_281, _179, _189);
    float _289 = fma(_283, _179, _191);
    bool _291 = !_271;
    float _307;
    if (!_291)
    {
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _295 = _127 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        _307 = _145;
    }
    _309 = false;
    float _311 = _307;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = _311 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _311 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _323 = _311 + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _333;
    float _337 = 1.0 / _327;
    bool _339 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_311);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = 1.0 / _331;
    bool _353 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _355 = isnan(_311);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    bool _365 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _367 = -_363;
    float _369 = _367 + 1.0;
    float _371 = 1.0 / _335;
    float _373 = _315 * _337;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = fma(_377, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _381 = _319 * _351;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _387;
    float _391 = fma(_385, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _393 = fma(_389, _373, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _399 = _323 * _371;
    bool _401 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _403 = isnan(_311);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    bool _413 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _415 = isnan(_311);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _429 = _411 * _369;
    float _431 = -_411;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _439 = -_423;
    float _441 = _439 + 1.0;
    float _443 = fma(_397, _381, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _445 = _423 * _433;
    float _447 = fma(_437, _381, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _449 = _349 * _441;
    float _451 = in.m_61.x;
    float _453 = in.m_61.y;
    float _455 = in.m_61.z;
    float _457 = fma(_427, _381, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _459 = _379 * _449;
    float _461 = _391 * _449;
    float _463 = -_349;
    float _465 = _463 + 1.0;
    float _467 = _393 * _449;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _473;
    float _477 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].x, _459);
    float _479 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].y, _461);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _481;
    float _485 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].z, _467);
    float _487 = fma(_471, _399, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _489 = fma(_475, _399, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _491 = fma(_483, _399, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _493 = fma(_457, _445, _477);
    float _495 = fma(_443, _445, _479);
    float _497 = fma(_447, _445, _485);
    float _499 = fma(_487, _429, _493);
    float _501 = fma(_489, _429, _495);
    float _503 = fma(_491, _429, _497);
    float _505 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].x, _499);
    float _507 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].y, _501);
    float _509 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].z, _503);
    float _511 = _505 * _451;
    float _513 = _507 * _453;
    float _515 = _509 * _455;
    bool _517 = !_365;
    float _533;
    if (!_517)
    {
        float _519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _521 = _127 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _523 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _525 = _523 * _519;
        float _527 = floor(_525);
        float _529 = -_527;
        float _531 = _525 + _529;
        _533 = _531;
        _535 = true;
    }
    else
    {
        _533 = _145;
    }
    _535 = false;
    float _537 = _533;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _541 = _537 + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _547 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _549 = isnan(_537);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _567 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _569 = isnan(_537);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = 1.0 / _545;
    float _581 = -_557;
    float _583 = _581 + 1.0;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _585;
    bool _589 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _591 = isnan(_537);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = _577 * _583;
    float _603 = -_577;
    float _605 = _603 + 1.0;
    bool _607 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _609 = 1.0 / _561;
    float _611 = _599 * _605;
    float _613 = -_599;
    float _615 = _613 + 1.0;
    float _617 = 1.0 / _565;
    float _619 = _587 * _579;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _625 = fma(_619, _541, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _627 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _629 = isnan(_537);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = _623 * _609;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _641;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _647 = _537 + _645;
    float _649 = _625 * _611;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _653 = _537 + _651;
    float _655 = fma(_639, _647, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _657 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[115].x, _649);
    float _659 = _643 * _617;
    float _661 = -_637;
    float _663 = _661 + 1.0;
    float _665 = fma(_655, _601, _657);
    float _667 = fma(_659, _653, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _669 = _557 * _663;
    float _671 = fma(_667, _669, _665);
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _679 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[118].x, _671);
    float _681 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _683 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _679 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_65.x = _681;
    out.m_65.y = _683;
    out.m_65.z = _685;
    out.m_65.w = _687;
    bool _689 = !_607;
    float _705;
    if (!_689)
    {
        float _691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _693 = _127 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _695 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _697 = _695 * _691;
        float _699 = floor(_697);
        float _701 = -_699;
        float _703 = _697 + _701;
        _705 = _703;
        _707 = true;
    }
    else
    {
        _705 = _145;
    }
    _707 = false;
    float _709 = _705;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _713 = _709 + _711;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _719 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _721 = isnan(_709);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _735 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _737 = isnan(_709);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _747;
    bool _751 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _753 = isnan(_709);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = 1.0 / _717;
    float _765 = -_729;
    float _767 = _765 + 1.0;
    bool _769 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _771 = _745 * _767;
    float _773 = -_745;
    float _775 = _773 + 1.0;
    float _777 = 1.0 / _733;
    float _779 = _749 * _763;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _785 = fma(_779, _713, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _787 = -_761;
    float _789 = _787 + 1.0;
    float _791 = _785 * _771;
    float _793 = _783 * _777;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _797 = _709 + _795;
    float _799 = _729 * _789;
    float _801 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[131].x, _791);
    float _803 = fma(_793, _797, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _805 = fma(_803, _799, _801);
    float _807 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[133].x, _805);
    float _809 = _807 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.w = _809;
    bool _811 = !_769;
    float _827;
    if (!_811)
    {
        float _813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _815 = _127 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _817 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[14].x, _133);
        float _819 = _817 * _813;
        float _821 = floor(_819);
        float _823 = -_821;
        float _825 = _819 + _823;
        _827 = _825;
        _829 = true;
    }
    else
    {
        _827 = _145;
    }
    _829 = false;
    float _831 = _827;
    int _833 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _835 = _833;
    int _837 = 0;
    int _839 = _96(_835, _837, (*spvDescriptorSet0.support_buffer));
    float _841 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _843 = int(_841);
    float _845 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _847 = int(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _857;
    float _861 = float(_843);
    float _863 = 1.0 / _851;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _877 = float(uint(_847));
    float _879 = 1.0 / _861;
    float _881 = 1.0 / _877;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _887 = _867 * _863;
    float _889 = _133 * _879;
    float _891 = 1.0 / _875;
    int _893 = as_type<int>(_881) + (-2);
    float _895 = trunc(_889);
    int _897 = int(_895);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _907 = ~_847;
    int _909 = _907 + 1;
    float _911 = 1.0 / _885;
    float _913 = _859 * _891;
    float _915 = float(uint(_897));
    float _917 = 1.0 / _901;
    float _919 = as_type<float>(_893) * _915;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _925 = 1.0 / _905;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _929 = _927 != 0;
    float _931 = _871 * _911;
    float _933 = in.m_53.y;
    float _935 = trunc(_919);
    float _937 = precise::max(_935, 0.0);
    uint _940 = uint(_937);
    float _942 = _901;
    int _944 = as_type<int>(_863);
    int _946 = as_type<int>(_891);
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _950 = _917;
    int _952 = as_type<int>(_911);
    if (_929)
    {
        float _954 = in.m_53.z;
        _942 = _954;
    }
    float _956 = _942;
    bool _958 = false;
    if (_929)
    {
        _958 = false;
    }
    bool _960 = _958;
    float _962 = 1.0 / _923;
    bool _964 = _960;
    if (_929)
    {
        _944 = as_type<int>(_127);
    }
    int _966 = _944;
    int _968 = _909 * int(_940);
    int _970 = _968 + _897;
    float _972 = 1.0 / _855;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _974;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _982 = _966;
    if (_929)
    {
        _946 = as_type<int>(_933);
    }
    int _984 = _946;
    float _986 = float(uint(_970));
    float _988 = _976 * _925;
    float _990 = _980 * _962;
    float _992 = as_type<float>(_893) * _986;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _998 = _984;
    if (_929)
    {
        _948 = _127;
    }
    float _1000 = _948;
    float _1002 = trunc(_992);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    float _1008 = _996 * _917;
    float _1010 = _1000;
    if (_929)
    {
        _950 = 1.0;
    }
    float _1012 = _950;
    float _1014 = _1012;
    float _1016 = _956;
    if (_929)
    {
        _952 = as_type<int>(_956);
    }
    int _1018 = _952;
    int _1020 = _1018;
    if (!_929)
    {
        float _1022 = in.m_53.z;
        float _1024 = _127 * 3.1415927410125732421875;
        float _1026 = _933 * 3.1415927410125732421875;
        float _1028 = _1024 * 0.15915493667125701904296875;
        float _1030 = _1026 * 0.15915493667125701904296875;
        float _1032 = _1028 * 6.283185482025146484375;
        float _1034 = sin(_1032);
        float _1036 = _1030 * 6.283185482025146484375;
        float _1038 = sin(_1036);
        float _1040 = _1022 * 3.1415927410125732421875;
        float _1042 = _1040 * 0.15915493667125701904296875;
        float _1044 = _1042 * 6.283185482025146484375;
        float _1046 = sin(_1044);
        _1010 = _933;
        _1014 = 1.2345600128173828125;
        _964 = true;
        _998 = as_type<int>(_1038);
        _982 = as_type<int>(_1034);
        _1020 = as_type<int>(_1046);
        _1016 = _1022;
    }
    float _1048 = _1010;
    float _1050 = _1014;
    bool _1052 = _964;
    int _1054 = _998;
    int _1056 = _982;
    int _1058 = _1020;
    float _1060 = _1016;
    float _1062 = _1048 * _1050;
    int _1064 = ~_847;
    int _1066 = _1064 + 1;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1070 = _831 + _1068;
    int _1072 = int(_940) + int(_1006);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1076 = _831 + _1074;
    float _1078 = float(_847);
    float _1080 = floor(_1062);
    float _1082 = float(_897);
    int _1084 = _1066 * _1072;
    int _1086 = _1084 + _897;
    float _1088 = _133 * _1078;
    float _1090 = fma(_913, _1076, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1092 = fma(_887, _1070, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1094 = uint(_1086) >= uint(_847);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1096;
    bool _1100 = _1082 >= _1078;
    bool _1102 = isnan(_1082);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(_1078);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    bool _1112 = !_1094;
    int _1114 = _1112 ? 0 : (-1);
    float _1116 = _1098 * _972;
    float _1118 = _1088 * _129;
    bool _1120 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1122 = isnan(_831);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = trunc(_1110);
    int _1134 = int(_1132);
    bool _1136 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1138 = isnan(_831);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1144 = _1140 || _1142;
    float _1146 = float(_1144);
    float _1148 = -_1080;
    float _1150 = _1062 + _1148;
    int _1152 = ~_1072;
    int _1154 = _1152 + _1114;
    int _1156 = _1154 + 1;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1160 = _1158 != 0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1168 = _1166 != 0;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1172 = _1170 != 0;
    float _1174 = -_1130;
    float _1176 = _1174 + 1.0;
    bool _1178 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1180 = isnan(_831);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = -_1146;
    float _1192 = _1190 + 1.0;
    int _1194 = _847 * _1156;
    int _1196 = _1194 + _897;
    bool _1198 = _847 == 0;
    float _1200 = _1146 * _1176;
    float _1202 = _1188 * _1192;
    bool _1204 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1206 = isnan(_831);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1212 = _1208 || _1210;
    float _1214 = float(_1212);
    float _1216 = _1150 * _1078;
    bool _1218 = !_1198;
    int _1220 = _1218 ? _1196 : (-1);
    float _1222 = -_1188;
    float _1224 = _1222 + 1.0;
    int _1226 = ~_1134;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    float _1232 = _1214 * _1224;
    bool _1234 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1236 = isnan(_831);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    int _1246 = _1220 * _1230;
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1250 = _1248 != 0;
    float _1252 = -_1214;
    float _1254 = _1252 + 1.0;
    bool _1256 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1258 = isnan(_831);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1264 = _1260 || _1262;
    float _1266 = float(_1264);
    float _1268 = -_1244;
    float _1270 = _1268 + 1.0;
    float _1272 = trunc(_1216);
    int _1274 = int(_1272);
    bool _1276 = !_1250;
    int _1278 = _1276 ? 0 : 1;
    float _1280 = _1244 * _1254;
    float _1282 = _1266 * _1270;
    bool _1284 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1286 = isnan(_831);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    float _1296 = -_1266;
    float _1298 = _1296 + 1.0;
    bool _1300 = !_1164;
    int _1302 = _1300 ? 0 : 1;
    int _1304 = abs(_1278);
    float _1306 = _1294 * _1298;
    float _1308 = trunc(_1118);
    int _1310 = int(_1308);
    int _1312 = _847 + (-1);
    float _1314 = -_1294;
    float _1316 = _1314 + 1.0;
    int _1318 = abs(_1302);
    float _1320 = _1090 * _1306;
    int _1322 = _1134 * _1312;
    int _1324 = _1322 + _1246;
    bool _1326 = !_1160;
    int _1328 = _1326 ? 0 : 1;
    int _1330 = _1274 * _1304;
    int _1332 = _1330 + _897;
    bool _1334 = !_1168;
    int _1336 = _1334 ? 0 : 1;
    int _1338 = abs(_1328);
    int _1340 = _1324 * _1318;
    bool _1342 = !_1172;
    int _1344 = _1342 ? 0 : 1;
    int _1346 = abs(_1336);
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1350 = _831 + _1348;
    int _1352 = abs(_1344);
    int _1354 = _1310 * _1338;
    int _1356 = _1354 + _1340;
    float _1358 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1320);
    float _1360 = fma(_931, _1350, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1362 = _1332 * _1346;
    int _1364 = _1362 + _1356;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1368 = _831 + _1366;
    float _1370 = fma(_1092, _1282, _1358);
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1374 = _831 + _1372;
    int _1376 = _1274 * _1352;
    int _1378 = _1376 + _1364;
    float _1380 = fma(_1008, _1368, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1382 = fma(_1360, _1280, _1370);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1386 = _831 + _1384;
    float _1388 = fma(_988, _1374, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1390 = float(uint(_1378));
    float _1392 = fma(_1380, _1232, _1382);
    bool _1394 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1396 = isnan(_831);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1402 = _1398 || _1400;
    float _1404 = float(_1402);
    float _1406 = in.m_59.z;
    float _1408 = fma(_990, _1386, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1410 = as_type<float>(_893) * _1390;
    float _1412 = fma(_1388, _1202, _1392);
    float _1414 = -_1404;
    float _1416 = _1414 + 1.0;
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1420 = _831 + _1418;
    int _1422 = _839 + (-1);
    float _1424 = fma(_1408, _1200, _1412);
    float _1426 = _1130 * _1416;
    float _1428 = fma(_1116, _1420, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1430 = trunc(_1410);
    float _1432 = precise::max(_1430, 0.0);
    uint _1434 = uint(_1432);
    float _1436 = float(_1422);
    float _1438 = fma(_1428, _1426, _1424);
    int _1440 = ~_847;
    int _1442 = _1440 + 1;
    int _1444 = ~_847;
    int _1446 = _1444 + 1;
    float _1448 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1438);
    float _1450 = precise::clamp(_1448, 0.0, 1.0);
    float _1452 = _1450 * _1436;
    float _1454 = trunc(_1406);
    int _1456 = int(_1454);
    int _1458 = _1442 * int(_1434);
    int _1460 = _1458 + _1378;
    float _1462 = float(uint(_1460));
    float _1464 = trunc(_1452);
    int _1466 = int(_1464);
    float _1468 = as_type<float>(_893) * _1462;
    float _1470 = trunc(_1468);
    float _1472 = precise::max(_1470, 0.0);
    uint _1474 = uint(_1472);
    int _1476 = _1466;
    int _1478 = 0;
    int _1480 = _97(_1476, _1478, (*spvDescriptorSet0.support_buffer));
    int _1482 = _1456;
    int _1484 = 0;
    int _1486 = _97(_1482, _1484, (*spvDescriptorSet0.support_buffer));
    float4 _1489 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1480, _1486)), 0).xyzw;
    float _1491 = _1489.x;
    float _1493 = _1489.y;
    float _1495 = _1489.z;
    float _1497 = _1489.w;
    int _1499 = ~_847;
    int _1501 = _1499 + 1;
    float _1503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1505 = ~_847;
    int _1507 = _1505 + 1;
    float _1509 = -_167;
    float _1511 = _1509 + 1.0;
    float _1513 = _1052 ? as_type<float>(_1054) : as_type<float>(_1056);
    int _1515 = int(_1434) + int(_1474);
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1519 = _1052 ? as_type<float>(_1058) : as_type<float>(_1054);
    float _1521 = as_type<float>(_1054);
    int _1523 = _1356;
    float _1525 = _1060;
    if (_1052)
    {
        _1521 = _933;
    }
    float _1527 = _1521;
    int _1529 = _1446 * _1515;
    int _1531 = _1529 + _1378;
    float _1533 = float(uint(_1332));
    float _1535 = _1527;
    if (!_1052)
    {
        _1535 = _127;
    }
    float _1537 = _1535;
    float _1539 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1541 = uint(_1531) >= uint(_847);
    float _1543 = as_type<float>(_893) * _1533;
    float _1545 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1547 = !_1541;
    int _1549 = _1547 ? 0 : (-1);
    float _1551 = trunc(_1543);
    float _1553 = precise::max(_1551, 0.0);
    uint _1555 = uint(_1553);
    int _1557 = ~_1515;
    int _1559 = _1557 + _1549;
    int _1561 = _1559 + 1;
    int _1563 = _847 * _1561;
    int _1565 = _1563 + _1378;
    bool _1567 = !_1198;
    int _1569 = _1567 ? _1565 : (-1);
    int _1571 = _1501 * int(_1555);
    int _1573 = _1571 + _1332;
    int _1575 = _1569 >> 31;
    int _1577 = _1569 & 3;
    bool _1579 = _1577 != 0;
    int _1581 = _1575 & 3;
    float _1583 = float(uint(_1573));
    int _1585 = _1569 + _1581;
    int _1587 = _1569 & 3;
    bool _1589 = _1587 != 0;
    float _1591 = as_type<float>(_893) * _1583;
    int _1593 = _1585 >> 2;
    bool _1595 = uint(_1587) > 1u;
    float _1597 = trunc(_1591);
    float _1599 = precise::max(_1597, 0.0);
    uint _1601 = uint(_1599);
    int _1603 = _1593 << 4;
    int _1605 = _1603 + 512;
    int _1607 = _1579 ? 0 : 1;
    uint _1609 = uint(int(uint(_1605) >> uint(2)));
    uint _1611 = uint(int(uint(int(_1609)) >> uint(2)));
    int _1613 = int(_1609) & 3;
    float _1615 = (*spvDescriptorSet0.vp_c9)._m0[int(_1611)][_1613];
    int _1617 = int(_1609) + 1;
    uint _1619 = uint(int(uint(_1617) >> uint(2)));
    int _1621 = _1617 & 3;
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[int(_1619)][_1621];
    bool _1625 = uint(_1587) >= 2u;
    bool _1627 = _1587 != 3;
    int _1629 = _1605 + 8;
    uint _1631 = uint(int(uint(_1629) >> uint(2)));
    uint _1633 = uint(int(uint(int(_1631)) >> uint(2)));
    int _1635 = int(_1631) & 3;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[int(_1633)][_1635];
    int _1639 = int(_1631) + 1;
    uint _1641 = uint(int(uint(_1639) >> uint(2)));
    int _1643 = _1639 & 3;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[int(_1641)][_1643];
    int _1647 = int(_1555) + int(_1601);
    int _1649 = ~_1607;
    int _1651 = _1649 + 1;
    int _1653 = _1651 + 1;
    int _1655 = _1653;
    bool _1657 = _1627;
    float _1659 = _1539;
    if (!_1595)
    {
        int _1661 = ~_1607;
        int _1663 = _1661 + 1;
        _1655 = _1663;
    }
    int _1665 = _1655;
    int _1667 = _1507 * _1647;
    int _1669 = _1667 + _1332;
    int _1671 = _1625 ? 0 : 1;
    int _1673 = abs(_1665);
    bool _1675 = uint(_1669) >= uint(_847);
    int _1677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1679 = _1677 != 0;
    bool _1681 = !_1675;
    int _1683 = _1681 ? 0 : (-1);
    int _1685 = ~_1647;
    int _1687 = _1685 + _1683;
    int _1689 = _1687 + 1;
    int _1691 = ~_1673;
    int _1693 = _1691 + 1;
    int _1695 = _1693 + 1;
    bool _1697 = !_1589;
    int _1699 = _1697 ? 0 : 1;
    int _1701 = ~_1671;
    int _1703 = _1701 + 1;
    int _1705 = _1703 + 1;
    int _1707 = abs(_1699);
    int _1709 = _1705;
    float _1711 = as_type<float>(_1707);
    if (_1627)
    {
        int _1713 = ~_1671;
        int _1715 = _1713 + 1;
        _1709 = _1715;
    }
    int _1717 = _1709;
    int _1719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1721 = _1719 != 0;
    if (_1679)
    {
        bool _1723 = _127 > 0.5;
        _1657 = _1723;
    }
    bool _1725 = _1657;
    if (!_1679)
    {
        _1711 = _163;
    }
    float _1727 = _1711;
    int _1729 = _1695 * as_type<int>(_1623);
    int _1731 = as_type<int>(_1623);
    float _1733 = _1727;
    if (_1679)
    {
        float _1735 = -_163;
        float _1737 = _1735 + 1.0;
        _1731 = as_type<int>(_1737);
    }
    int _1739 = _1731;
    bool _1741 = _1587 != 3;
    int _1743 = abs(_1717);
    if (_1679)
    {
        float _1745 = _1725 ? as_type<float>(_1739) : _163;
        _1733 = _1745;
    }
    float _1747 = _1733;
    int _1749 = _847 * _1689;
    int _1751 = _1749 + _1332;
    int _1753 = ~_1707;
    int _1755 = _1753 + 1;
    int _1757 = _1755 + 1;
    float _1759 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1761 = int(_1759);
    bool _1763 = !_1741;
    int _1765 = _1763 ? 0 : (-1);
    float _1767 = as_type<float>(_1673);
    if (_1721)
    {
        float _1769 = in.m_53.z;
        _1767 = _1769;
    }
    float _1771 = _1767;
    int _1773 = ~_1743;
    int _1775 = _1773 + 1;
    int _1777 = _1775 + 1;
    int _1779 = _1757 * as_type<int>(_1615);
    int _1781 = _1779 + _1729;
    int _1783 = abs(_1765);
    if (_1721)
    {
        float _1785 = -_163;
        float _1787 = _1785 + 1.0;
        _1523 = as_type<int>(_1787);
    }
    int _1789 = _1523;
    int _1791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1793 = _1791 != 0;
    int _1795 = _1777 * as_type<int>(_1637);
    int _1797 = _1795 + _1781;
    int _1799 = ~_1783;
    int _1801 = _1799 + 1;
    int _1803 = _1801 + 1;
    float _1805 = _127 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1807 = !_1793;
    float _1809 = _1807 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1811 = !_1198;
    int _1813 = _1811 ? _1751 : (-1);
    int _1815 = _1803 * as_type<int>(_1645);
    int _1817 = _1815 + _1797;
    int _1819 = abs(as_type<int>(_1809));
    float _1821 = -_1517;
    float _1823 = fma(_1805, 2.0, _1821);
    float _1825 = float(uint(_1761));
    float _1827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1829 = abs(_1761);
    int _1831 = ~_1819;
    int _1833 = _1831 + 1;
    int _1835 = _1833 + 1;
    float _1837 = float(uint(_1829));
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1841 = _1839 != 0;
    float _1843 = 1.0 / _1825;
    int _1845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1847 = _1845 != 0;
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1851 = _1849 != 0;
    int _1853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1855 = _1853 != 0;
    float _1857 = 1.0 / _1837;
    int _1859 = _1817 * _1835;
    bool _1861 = _1793;
    float _1863 = _1809;
    if (_1721)
    {
        bool _1865 = _1771 > 0.5;
        _1861 = _1865;
    }
    bool _1867 = _1861;
    float _1869 = _933 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1873 = _1813 * _1819;
    int _1875 = _1873 + _1859;
    if (!_1721)
    {
        _1863 = _163;
    }
    float _1877 = _1863;
    float _1879 = in.m_53.w;
    float _1881 = fma(_1869, -2.0, _1871);
    int _1883 = as_type<int>(_1843) + (-2);
    float _1885 = float(uint(_1875));
    float _1887 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1881);
    int _1889 = abs(_1875);
    float _1891 = as_type<float>(_1883) * _1885;
    float _1893 = _1877;
    if (_1721)
    {
        float _1895 = _1867 ? as_type<float>(_1789) : _163;
        _1893 = _1895;
    }
    float _1897 = _1893;
    float _1899 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1901 = as_type<int>(_1857) + (-2);
    float _1903 = fma(_1539, _1747, -0.5);
    float _1905 = float(uint(_1889));
    float _1907 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1899);
    float _1909 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1911 = _933 > 0.5;
    bool _1913 = _1911 && _1841;
    float _1915 = trunc(_1891);
    float _1917 = precise::max(_1915, 0.0);
    uint _1919 = uint(_1917);
    float _1921 = as_type<float>(_1901) * _1905;
    float _1923 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1907);
    float _1925 = -_133;
    float _1927 = fma(_1925, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1823);
    int _1929 = ~_1761;
    int _1931 = _1929 + 1;
    float _1933 = as_type<float>(_1931);
    if (!_1841)
    {
        _1659 = _163;
    }
    float _1935 = _1659;
    float _1937 = fma(_1923, _1903, _1927);
    float _1939 = trunc(_1921);
    float _1941 = precise::max(_1939, 0.0);
    uint _1943 = uint(_1941);
    bool _1945 = _933 > 0.5;
    bool _1947 = _1945 && _1847;
    float _1949 = _1935;
    if (_1913)
    {
        float _1951 = -_163;
        float _1953 = _1951 + 1.0;
        _213 = _1953;
    }
    float _1955 = _213;
    bool _1957 = _1879 > 0.5;
    bool _1959 = _1957 && _1851;
    bool _1961 = _1060 > 0.5;
    bool _1963 = _1961 && _1855;
    float _1965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    if (_1841)
    {
        _1949 = _1955;
    }
    float _1967 = _1949;
    int _1969 = _1931 * int(_1919);
    int _1971 = _1969 + _1875;
    float _1973 = _1947 ? _1511 : _167;
    float _1975 = _1959 ? _1511 : _167;
    float _1977 = _1963 ? _1511 : _167;
    float _1979 = fma(_1909, _1973, -0.5);
    int _1981 = ~int(_1943);
    int _1983 = _1981 + 1;
    if (_1052)
    {
        _1933 = _933;
    }
    float _1985 = _1933;
    float _1987 = _1985;
    if (!_1052)
    {
        _1987 = _127;
    }
    float _1989 = _1987;
    float _1991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _1993 = float(uint(_1971));
    int _1995 = _1983 * _1829;
    int _1997 = _1995 + _1889;
    float _1999 = _1965 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2001 = _1965;
    if (_1052)
    {
        _2001 = _1060;
    }
    float _2003 = _2001;
    float _2005 = as_type<float>(_1883) * _1993;
    float _2007 = float(uint(_1997));
    float _2009 = fma(_1999, _1967, -0.5);
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2013 = trunc(_2005);
    float _2015 = precise::max(_2013, 0.0);
    uint _2017 = uint(_2015);
    float _2019 = as_type<float>(_1901) * _2007;
    float _2021 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2011);
    float _2023 = _2003;
    if (!_1052)
    {
        _1525 = _933;
    }
    float _2025 = _1525;
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_1052)
    {
        _2023 = _933;
    }
    float _2029 = _2023;
    float _2031 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _2033 = trunc(_2019);
    float _2035 = precise::max(_2033, 0.0);
    uint _2037 = uint(_2035);
    float _2039 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[98].z, _2031);
    float _2041 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _2043 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _2045 = fma(_2029, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2027);
    float _2047 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2049 = _1991 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2051 = -_2043;
    float _2053 = fma(_2041, 2.0, _2051);
    float _2055 = fma(_1989, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2047);
    int _2057 = int(_1919) + int(_2017);
    float _2059 = fma(_1977, _2049, -0.5);
    float _2061 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _2063 = ~_1761;
    int _2065 = _2063 + 1;
    float _2067 = -_133;
    float _2069 = fma(_2067, (*spvDescriptorSet0.vp_c9)._m0[96].x, _2053);
    int _2071 = int(_1943) + int(_2037);
    float _2073 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[98].w, _2061);
    float _2075 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _2077 = _2065 * _2057;
    int _2079 = _2077 + _1875;
    int _2081 = ~_2071;
    int _2083 = _2081 + 1;
    float _2085 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2045);
    bool _2087 = uint(_2079) >= uint(_1761);
    int _2089 = _2083 * _1829;
    int _2091 = _2089 + _1889;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2095 = !_2087;
    int _2097 = _2095 ? 0 : (-1);
    float _2099 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2101 = uint(_2091) >= uint(_1829);
    float _2103 = -_2093;
    float _2105 = fma(_1545, 2.0, _2103);
    int _2107 = ~_2057;
    int _2109 = _2107 + _2097;
    int _2111 = _2109 + 1;
    float _2113 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2115 = _1875 ^ _1761;
    float _2117 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[97].z, _2039);
    bool _2119 = _1761 == 0;
    int _2121 = _1761 * _2111;
    int _2123 = _2121 + _1875;
    bool _2125 = !_2101;
    int _2127 = _2125 ? 0 : (-1);
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    uint _2131 = uint(int(uint(_2115) >> uint(31)));
    float _2133 = fma(_2117, _2009, _2069);
    bool _2135 = _1761 == 0;
    float _2137 = fma(_2075, -2.0, _2129);
    float _2139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2141 = ~_2127;
    int _2143 = _2071 + _2141;
    int _2145 = _2143 + 1;
    float _2147 = -_133;
    float _2149 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2105);
    int _2151 = ~int(_2131);
    int _2153 = _2151 + 1;
    float _2155 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2137);
    bool _2157 = !_2119;
    int _2159 = _2157 ? _2123 : (-1);
    float _2161 = _2113 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2163 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2073);
    int _2165 = _2145 ^ _2153;
    float _2167 = fma(_2161, _1897, -0.5);
    float _2169 = float(_2159);
    float _2171 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2173 = ~_2153;
    int _2175 = _2173 + _2165;
    int _2177 = _2175 + 1;
    float _2179 = -_2155;
    float _2181 = fma(_2163, _2059, _2179);
    float _2183 = _2133 + 0.5;
    float _2185 = fma(_2161, _2169, _2149);
    bool _2187 = !_2135;
    int _2189 = _2187 ? _2177 : (-1);
    float _2191 = fma(_2099, -2.0, _2171);
    float _2193 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2195 = _2181 + 0.5;
    float _2197 = float(_2189);
    float _2199 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2191);
    float _2201 = fma(_1975, _2193, -0.5);
    float _2203 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2021);
    out.m_69.x = _2183;
    out.m_69.y = _2195;
    float _2205 = -_2199;
    float _2207 = fma(_2193, _2197, _2205);
    uint _2209 = as_type<uint>(half2(float2(_1497, 0.0)));
    float _2211 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2055);
    float _2213 = -_1887;
    float _2215 = fma(_2203, _1979, _2213);
    int _2217 = _1466 + 1;
    uint _2219 = extract_bits(_2209, 0u, 8u);
    int _2221 = int(_2219) & 255;
    uint _2223 = extract_bits(_2209, 8u, 8u);
    int _2225 = int(_2223) & 255;
    int _2227 = _2225 << 8;
    int _2229 = _2221 | _2227;
    float _2231 = fma(_2211, _2167, _2185);
    float _2233 = fma(_2085, _2201, _2207);
    float _2235 = _2215 + 0.5;
    bool _2237 = _2229 >= 32768;
    float _2239 = _2231 + 0.5;
    int _2241 = _2229 + (-1024);
    float _2243 = _2233 + 0.5;
    int _2245 = min(_1422, _2217);
    int _2247 = _2241;
    if (_2237)
    {
        int _2249 = ~_2229;
        int _2251 = _2249 + 33792;
        int _2253 = _2251 + 1;
        _2247 = _2253;
    }
    int _2255 = _2247;
    int _2257 = _2255 + 30719;
    float _2259 = float(_2257);
    float _2261 = fma(_2259, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2263 = abs(_2261);
    float _2265 = -_2263;
    float _2267 = _2265 + 1.0;
    bool _2269 = _2261 < 0.0;
    float _2271 = float(_2269);
    float _2273 = abs(_2261);
    float _2275 = fma(_2273, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2277 = as_type<int>(_2267) + (-218103808);
    float _2279 = abs(_2261);
    float _2281 = fma(_2279, _2275, -0.212114393711090087890625);
    bool _2283 = uint(_2277) >= 1920991232u;
    float _2285 = _1937 + 0.5;
    float _2287 = abs(_2261);
    float _2289 = fma(_2287, _2281, 1.570728778839111328125);
    bool _2291 = !_2283;
    float _2313;
    if (!_2291)
    {
        int _2293 = as_type<int>(_2267);
        int _2295 = as_type<int>(_1937);
        int _2297 = _2177;
        int _2299 = 11312;
        int _2301;
        int _2303;
        int _2305;
        int _2307;
        int _2309;
        int _2311;
        _94(_2293, _2295, _2297, _2299, _2301, _2303, _2305, _2307, _2309, _2311, out.gl_Position, out.gl_PointSize);
        _2313 = as_type<float>(_2305);
        _2315 = true;
    }
    else
    {
        float _2317 = rsqrt(_2267);
        float _2319 = _2267 * _2317;
        float _2321 = _2317 * 0.5;
        float _2323 = -_2319;
        float _2325 = 0.0 + _2323;
        float _2327 = fma(_2321, _2325, 0.5);
        float _2329 = fma(_2319, _2327, _2319);
        float _2331 = -_2329;
        float _2333 = 0.0 + _2331;
        float _2335 = fma(_2329, _2333, _2267);
        float _2337 = fma(_2321, _2335, _2329);
        _2313 = _2337;
    }
    _2315 = false;
    float _2339 = _2313;
    int _2341 = _2245;
    int _2343 = 0;
    int _2345 = _97(_2341, _2343, (*spvDescriptorSet0.support_buffer));
    int _2347 = _1456;
    int _2349 = 0;
    int _2351 = _97(_2347, _2349, (*spvDescriptorSet0.support_buffer));
    float4 _2353 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2345, _2351)), 0).xyzw;
    float _2355 = _2353.x;
    float _2357 = _2353.y;
    float _2359 = _2353.z;
    float _2361 = _2353.w;
    float _2363 = _2289 * _2339;
    float _2365 = _2271 * 2.0;
    float _2367 = _2259 * 3.883221149444580078125;
    float _2369 = floor(_1452);
    float _2371 = -_2365;
    float _2373 = fma(_2363, _2371, _2363);
    float _2375 = _2367 * 0.15915493667125701904296875;
    float _2377 = fma(_2271, 3.1415927410125732421875, _2373);
    float _2379 = _2375 * 6.283185482025146484375;
    float _2381 = cos(_2379);
    float _2383 = _2377 * 0.15915493667125701904296875;
    float _2385 = _2383 * 6.283185482025146484375;
    float _2387 = sin(_2385);
    float _2389 = -_2369;
    float _2391 = _1452 + _2389;
    float _2393 = _2375 * 6.283185482025146484375;
    float _2395 = sin(_2393);
    float _2397 = _2387 * _2381;
    float _2399 = _2387 * _2395;
    uint _2401 = as_type<uint>(half2(float2(_2361, 0.0)));
    uint _2403 = extract_bits(_2401, 0u, 8u);
    int _2405 = int(_2403) & 255;
    uint _2407 = extract_bits(_2401, 8u, 8u);
    int _2409 = int(_2407) & 255;
    int _2411 = _2409 << 8;
    int _2413 = _2405 | _2411;
    bool _2415 = _2413 >= 32768;
    int _2417 = _2413 + (-1024);
    int _2419 = _2417;
    if (_2415)
    {
        int _2421 = ~_2413;
        int _2423 = _2421 + 33792;
        int _2425 = _2423 + 1;
        _2419 = _2425;
    }
    int _2427 = _2419;
    int _2429 = _2427 + 30719;
    float _2431 = float(_2429);
    float _2433 = fma(_2431, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2435 = abs(_2433);
    float _2437 = -_2435;
    float _2439 = _2437 + 1.0;
    float _2441 = abs(_2433);
    float _2443 = fma(_2441, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2445 = as_type<int>(_2439) + (-218103808);
    bool _2447 = uint(_2445) >= 1920991232u;
    float _2449 = -_1491;
    float _2451 = _2449 + _2355;
    float _2453 = -_1493;
    float _2455 = _2453 + _2357;
    float _2457 = -_1495;
    float _2459 = _2457 + _2359;
    float _2461 = fma(_2391, _2451, _1491);
    float _2463 = abs(_2433);
    float _2465 = fma(_2463, _2443, -0.212114393711090087890625);
    float _2467 = fma(_2391, _2455, _1493);
    float _2469 = fma(_2391, _2459, _1495);
    bool _2471 = _2433 < 0.0;
    float _2473 = float(_2471);
    float _2475 = abs(_2433);
    float _2477 = fma(_2475, _2465, 1.570728778839111328125);
    bool _2479 = !_2447;
    float _2501;
    if (!_2479)
    {
        int _2481 = as_type<int>(_2439);
        int _2483 = as_type<int>(_2383);
        int _2485 = as_type<int>(_2439);
        int _2487 = 12208;
        int _2489;
        int _2491;
        int _2493;
        int _2495;
        int _2497;
        int _2499;
        _94(_2481, _2483, _2485, _2487, _2489, _2491, _2493, _2495, _2497, _2499, out.gl_Position, out.gl_PointSize);
        _2501 = as_type<float>(_2493);
        _2503 = true;
    }
    else
    {
        float _2505 = rsqrt(_2439);
        float _2507 = _2439 * _2505;
        float _2509 = _2505 * 0.5;
        float _2511 = -_2507;
        float _2513 = 0.0 + _2511;
        float _2515 = fma(_2509, _2513, 0.5);
        float _2517 = fma(_2507, _2515, _2507);
        float _2519 = -_2517;
        float _2521 = 0.0 + _2519;
        float _2523 = fma(_2517, _2521, _2439);
        float _2525 = fma(_2509, _2523, _2517);
        _2501 = _2525;
    }
    _2503 = false;
    float _2527 = _2501;
    float _2529 = in.m_53.x;
    float _2531 = in.m_53.y;
    float _2533 = in.m_53.z;
    float _2535 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2537 = log2(_2535);
    float _2539 = _287 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2541 = _287 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2543 = _287 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2545 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2539);
    float _2547 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2541);
    float _2549 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2543);
    float _2551 = _2477 * _2527;
    int _2553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2555 = _2553 != 0;
    int _2557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2559 = _2557 != 0;
    int _2561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2563 = _2561 != 0;
    float _2565 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2547);
    float _2567 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2569 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2571 = _511 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2573 = _2537 * _133;
    float _2575 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2545);
    float _2577 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2549);
    float _2579 = _2431 * 3.883221149444580078125;
    float _2581 = _2575 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2583 = _2577 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2585 = _2533 * 2.0;
    float _2587 = _2529 * 2.0;
    float _2589 = _2529 + _2533;
    float _2591 = _2531 * 2.0;
    bool _2593 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2595 = isnan(1.0);
    bool _2597 = _2593 || _2595;
    bool _2599 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2601 = _2597 || _2599;
    float _2603 = floor(_2587);
    float _2605 = _2589 + (-1.0);
    float _2607 = -_2261;
    float _2609 = _2607 + _2433;
    float _2611 = fma(_2391, _2609, _2261);
    float _2613 = floor(_2585);
    float _2615 = floor(_2591);
    bool _2617 = _2603 >= 0.0;
    bool _2619 = isnan(_2603);
    bool _2621 = _2617 || _2619;
    bool _2623 = isnan(0.0);
    bool _2625 = _2621 || _2623;
    bool _2627 = _2613 > 0.0;
    bool _2629 = _2613 >= 0.0;
    bool _2631 = isnan(_2613);
    bool _2633 = _2629 || _2631;
    bool _2635 = isnan(0.0);
    bool _2637 = _2633 || _2635;
    float _2639 = fma(_2605, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _2641 = _2625 ? 0 : 1;
    float _2643 = exp2(_2573);
    int _2645 = _2637 ? 0 : 1;
    bool _2647 = _2603 > 0.0;
    float _2649 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2651 = 1.0 + _2649;
    bool _2653 = !_2555;
    int _2655 = _2653 ? 0 : 1;
    int _2657 = ~_2645;
    int _2659 = _2657 + 1;
    int _2661 = _2659 + 1;
    float _2663 = 1.0 / _2651;
    int _2665 = _2661;
    float _2667 = _2611;
    if (!_2627)
    {
        int _2669 = ~_2645;
        int _2671 = _2669 + 1;
        _2665 = _2671;
    }
    int _2673 = _2665;
    float _2675 = _2531 + _2529;
    bool _2677 = _2615 > 0.0;
    bool _2679 = _2615 >= 0.0;
    bool _2681 = isnan(_2615);
    bool _2683 = _2679 || _2681;
    bool _2685 = isnan(0.0);
    bool _2687 = _2683 || _2685;
    float _2689 = _2675 + (-1.0);
    int _2691 = abs(_2655);
    float _2693 = -_2643;
    float _2695 = _2693 + 1.0;
    float _2697 = float(_2673);
    float _2699 = in.m_71.x;
    float _2701 = in.m_71.y;
    float _2703 = in.m_71.z;
    float _2705 = float(_2691);
    float _2707 = fma(_2689, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2709 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2711 = isnan(0.0);
    bool _2713 = _2709 || _2711;
    bool _2715 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2717 = _2713 || _2715;
    int _2719 = _2687 ? 0 : 1;
    float _2721 = _2705 * _2697;
    float _2723 = _2529 + (-0.5);
    float _2725 = _2565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2727 = _2717 ? _2695 : 0.0;
    float _2729 = _2721 * (-2.0);
    bool _2731 = !_2563;
    int _2733 = _2731 ? 0 : 1;
    float _2735 = -_2725;
    float _2737 = _2735 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _2739 = ~_2719;
    int _2741 = _2739 + 1;
    int _2743 = _2741 + 1;
    int _2745 = _2743;
    float _2747 = _2725;
    if (_2601)
    {
        float _2749 = _2727 * _2663;
        _155 = _2749;
    }
    float _2751 = _155;
    if (!_2677)
    {
        int _2753 = ~_2719;
        int _2755 = _2753 + 1;
        _2745 = _2755;
    }
    int _2757 = _2745;
    float _2759 = fma(_2707, _2729, _2707);
    int _2761 = ~_2641;
    int _2763 = _2761 + 1;
    int _2765 = _2763 + 1;
    float _2767 = -_2581;
    float _2769 = _2767 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _2771 = abs(_2733);
    float _2773 = _2737 * _2737;
    int _2775 = _2765;
    if (!_2647)
    {
        int _2777 = ~_2641;
        int _2779 = _2777 + 1;
        _2775 = _2779;
    }
    int _2781 = _2775;
    float _2783 = -_2583;
    float _2785 = _2783 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _2787 = !_2559;
    int _2789 = _2787 ? 0 : 1;
    float _2791 = fma(_2729, _2699, _2699);
    float _2793 = float(_2771);
    float _2795 = fma(_2769, _2769, _2773);
    float _2797 = float(_2757);
    float _2799 = fma(_2723, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2791);
    int _2801 = abs(_2789);
    float _2803 = fma(_2785, _2785, _2795);
    bool _2805 = _2467 != 0.0;
    bool _2807 = isnan(_2467);
    bool _2809 = _2805 || _2807;
    bool _2811 = isnan(0.0);
    bool _2813 = _2809 || _2811;
    float _2815 = fma(_2759, _2751, _2799);
    float _2817 = _2793 * _2797;
    float _2819 = _2533 + (-0.5);
    float _2821 = _2531 + _2533;
    float _2823 = _2815 * 0.15915493667125701904296875;
    float _2825 = float(_2801);
    float _2827 = _2817 * (-2.0);
    float _2829 = float(_2781);
    float _2831 = rsqrt(_2803);
    float _2833 = _2821 + (-1.0);
    float _2835 = fma(_2827, _2703, _2703);
    float _2837 = fma(_2639, _2827, _2639);
    float _2839 = _2825 * _2829;
    float _2841 = _2531 + (-0.5);
    float _2843 = fma(_2819, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2835);
    float _2845 = _2839 * (-2.0);
    float _2847 = _2823 * 6.283185482025146484375;
    float _2849 = sin(_2847);
    float _2851 = fma(_2833, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2853 = fma(_2837, _2751, _2843);
    float _2855 = fma(_2845, _2701, _2701);
    float _2857 = _2473 * 2.0;
    float _2859 = fma(_2851, _2845, _2851);
    float _2861 = _2853 * 0.15915493667125701904296875;
    float _2863 = fma(_2841, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2855);
    float _2865 = -_2857;
    float _2867 = fma(_2551, _2865, _2551);
    float _2869 = _2823 * 6.283185482025146484375;
    float _2871 = cos(_2869);
    bool _2873 = _2461 == 0.0;
    bool _2875 = !_2813;
    bool _2877 = _2873 && _2875;
    float _2879 = fma(_2859, _2751, _2863);
    float _2881 = _2769 * _2831;
    float _2883 = _2785 * _2831;
    float _2885 = _2737 * _2831;
    float _2887 = _2879 * 0.15915493667125701904296875;
    float _2889 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2891 = _2881 * _2889;
    float _2893 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2895 = _2883 * _2893;
    float _2897 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2899 = _2885 * _2897;
    float _2901 = fma(_2473, 3.1415927410125732421875, _2867);
    float _2903 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2905 = -_2891;
    float _2907 = fma(_2883, _2903, _2905);
    float _2909 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2911 = -_2895;
    float _2913 = fma(_2885, _2909, _2911);
    float _2915 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2917 = -_2899;
    float _2919 = fma(_2881, _2915, _2917);
    float _2921 = _2861 * 6.283185482025146484375;
    float _2923 = sin(_2921);
    float _2925 = _2907 * _2907;
    bool _2927 = _2469 == 0.0;
    bool _2929 = _2927 && _2877;
    float _2931 = fma(_2913, _2913, _2925);
    float _2933 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2467);
    float _2935 = _2861 * 6.283185482025146484375;
    float _2937 = cos(_2935);
    float _2939 = fma(_2919, _2919, _2931);
    float _2941 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2461);
    float _2943 = _2569 * _2933;
    float _2945 = _2571 * _2941;
    float _2947 = _2887 * 6.283185482025146484375;
    float _2949 = cos(_2947);
    float _2951 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2469);
    float _2953 = _2871 * _2923;
    float _2955 = _2881;
    if (!_2929)
    {
        float _2957 = fma(_2467, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2611);
        _2667 = _2957;
    }
    float _2959 = _2667;
    float _2961 = _2887 * 6.283185482025146484375;
    float _2963 = sin(_2961);
    float _2965 = _2871 * _2937;
    float _2967 = rsqrt(_2939);
    float _2969 = _2567 * _2951;
    float _2971 = _2849 * _2923;
    float _2973 = _2949 * _2923;
    float _2975 = _2849 * _2937;
    float _2977 = _2871 * _2949;
    float _2979 = _2849 * _2949;
    float _2981 = _2949 * _2937;
    float _2983 = fma(_2963, _2971, _2965);
    float _2985 = -_2953;
    float _2987 = fma(_2963, _2975, _2985);
    float _2989 = -_2975;
    float _2991 = fma(_2963, _2953, _2989);
    float _2993 = _2979 * _2943;
    float _2995 = fma(_2963, _2965, _2971);
    float _2997 = _2987 * _2943;
    float _2999 = -_2963;
    float _3001 = fma(_2999, _2945, _2993);
    float _3003 = _2913 * _2967;
    float _3005 = _2907 * _2967;
    float _3007 = _2983 * _2943;
    float _3009 = _2919 * _2967;
    float _3011 = _2885 * _3003;
    float _3013 = _2883 * _3005;
    float _3015 = fma(_2973, _2945, _3007);
    float _3017 = fma(_2981, _2945, _2997);
    float _3019 = -_3011;
    float _3021 = fma(_2881, _3005, _3019);
    float _3023 = -_3013;
    float _3025 = fma(_2885, _3009, _3023);
    float _3027 = fma(_2991, _2969, _3015);
    float _3029 = _2901 * 0.15915493667125701904296875;
    float _3031 = fma(_2995, _2969, _3017);
    float _3033 = _2579 * 0.15915493667125701904296875;
    float _3035 = _3025 * _3027;
    float _3037 = _3021 * _3027;
    float _3039 = fma(_2977, _2969, _3001);
    float _3041 = _3033 * 6.283185482025146484375;
    float _3043 = cos(_3041);
    float _3045 = fma(_3003, _3031, _3035);
    float _3047 = fma(_3009, _3031, _3037);
    float _3049 = _2983 * _3025;
    float _3051 = _2991 * _3025;
    float _3053 = fma(_2881, _3039, _3045);
    float _3055 = fma(_2883, _3039, _3047);
    float _3057 = _3029 * 6.283185482025146484375;
    float _3059 = sin(_3057);
    float _3061 = _2581 + _3053;
    float _3063 = _2583 + _3055;
    float _3065 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3067 = _3061 + _3065;
    float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3071 = _3063 + _3069;
    float _3073 = _3033 * 6.283185482025146484375;
    float _3075 = sin(_3073);
    float _3077 = _3067 * _3067;
    float _3079 = _3071 * _3071;
    float _3081 = _3077 + _3079;
    float _3083 = -_2397;
    float _3085 = fma(_3059, _3043, _3083);
    float _3087 = _2881 * _3009;
    float _3089 = fma(_2391, _3085, _2397);
    float _3091 = -_3087;
    float _3093 = fma(_2883, _3003, _3091);
    float _3095 = -_2399;
    float _3097 = fma(_3059, _3075, _3095);
    float _3099 = _3093 * _3027;
    float _3101 = _3089;
    float _3103 = _3077;
    float _3105 = _3079;
    float _3107 = _3061;
    float _3109 = _3063;
    float _3111 = _3071;
    if (!_2929)
    {
        float _3113 = fma(_2461, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3089);
        _3101 = _3113;
    }
    float _3115 = _3101;
    float _3117 = _2983 * _3093;
    float _3119 = fma(_2391, _3097, _2399);
    float _3121 = _2983 * _3021;
    float _3123 = sqrt(_3081);
    float _3125 = fma(_2987, _3003, _3049);
    float _3127 = _3119;
    if (!_2929)
    {
        float _3129 = fma(_2469, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3119);
        _3127 = _3129;
    }
    float _3131 = _3127;
    float _3133 = fma(_2987, _3009, _3121);
    float _3135 = _2973 * _3021;
    float _3137 = _2991 * _3021;
    float _3139 = fma(_3005, _3031, _3099);
    float _3141 = fma(_2987, _3005, _3117);
    float _3143 = _2973 * _3025;
    float _3145 = _2973 * _3093;
    float _3147 = fma(_2885, _3039, _3139);
    float _3149 = fma(_2981, _3009, _3135);
    float _3151 = _2991 * _3093;
    float _3153 = fma(_2981, _3003, _3143);
    float _3155 = _2725 + _3147;
    float _3157 = fma(_2981, _3005, _3145);
    bool _3159 = _3123 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3161 = fma(_2995, _3003, _3051);
    float _3163 = fma(_2979, _2881, _3125);
    float _3165 = fma(_2979, _2885, _3141);
    float _3167 = fma(_2995, _3005, _3151);
    float _3169 = fma(_2995, _3009, _3137);
    float _3171 = fma(_2979, _2883, _3133);
    if (!_3159)
    {
        _2747 = _3155;
    }
    float _3173 = _2747;
    bool _3175 = !_3159;
    float _3177 = _3173;
    if (!_3175)
    {
        float _3179 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3181 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3183 = _3123 + _3181;
        float _3185 = rsqrt(_3081);
        float _3187 = _3183 * _3179;
        float _3189 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3191 = _3187 * 0.15915493667125701904296875;
        float _3193 = _3191 * 6.283185482025146484375;
        float _3195 = sin(_3193);
        float _3197 = _3191 * 6.283185482025146484375;
        float _3199 = cos(_3197);
        float _3201 = fma(_3195, _3189, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3203 = _3185 * _3201;
        float _3205 = _3199 + (-1.0);
        float _3207 = _3067 * _3203;
        float _3209 = _3071 * _3203;
        float _3211 = _3205 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3213 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3215 = _3207 * _3207;
        float _3217 = _3209 * _3209;
        float _3219 = fma(_3155, _3199, _3211);
        float _3221 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        _3177 = _3219;
        _3103 = _3215;
        _3105 = _3217;
        _3107 = _3213;
        _3109 = _3221;
        _3111 = _3209;
    }
    float _3223 = _3177;
    float _3225 = _3103;
    float _3227 = _3105;
    float _3229 = _3107;
    float _3231 = _3109;
    float _3233 = _3111;
    float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3237 = _3223 + _3235;
    float _3239 = -_2963;
    float _3241 = fma(_3239, _2881, _3153);
    float _3243 = -_2963;
    float _3245 = fma(_3243, _2885, _3157);
    float _3247 = -_2963;
    float _3249 = fma(_3247, _2883, _3149);
    float _3251 = fma(_3237, _3237, _3225);
    float _3253 = _3163 * _2959;
    float _3255 = _3165 * _2959;
    float _3257 = _3171 * _2959;
    float _3259 = _3251 + _3227;
    float _3261 = fma(_2977, _2881, _3161);
    float _3263 = fma(_2977, _2885, _3167);
    float _3265 = fma(_2977, _2883, _3169);
    float _3267 = fma(_3241, _3115, _3253);
    float _3269 = fma(_3245, _3115, _3255);
    float _3271 = sqrt(_3259);
    float _3273 = fma(_3249, _3115, _3257);
    float _3275 = fma(_3261, _3131, _3267);
    float _3277 = fma(_3263, _3131, _3269);
    out.m_73.x = _2285;
    out.m_73.y = _2235;
    out.m_73.z = _2239;
    out.m_73.w = _2243;
    float _3279 = fma(_3265, _3131, _3273);
    out.m_75.x = _3275;
    out.m_75.y = _3277;
    out.m_75.z = _3279;
    bool _3281 = _3271 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3283 = isnan(_3271);
    bool _3285 = _3281 || _3283;
    bool _3287 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3289 = _3285 || _3287;
    float _3291 = _3237;
    float _3293 = _3245;
    float _3295 = _3233;
    if (!_3289)
    {
        _2955 = 1.0;
    }
    float _3297 = _2955;
    bool _3299 = !_3289;
    float _3301 = _3297;
    if (!_3299)
    {
        bool _3303 = _3271 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3305 = isnan(_3271);
        bool _3307 = _3303 || _3305;
        bool _3309 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3311 = _3307 || _3309;
        if (!_3311)
        {
            float _3313 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3315 = _3271 + _3313;
            float _3317 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3319 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3317;
            float _3321 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3323 = _3321 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3325 = 1.0 / _3319;
            float _3327 = _3315 * _3325;
            float _3329 = fma(_3327, _3323, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3301 = _3329;
            _3331 = true;
        }
        else
        {
            bool _3333 = _3271 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3335 = isnan(_3271);
            bool _3337 = _3333 || _3335;
            bool _3339 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3341 = _3337 || _3339;
            if (!_3341)
            {
                float _3343 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3345 = _3271 + _3343;
                float _3347 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3349 = _3347 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3351 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3353 = _3351 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3355 = 1.0 / _3349;
                float _3357 = _3345 * _3355;
                float _3359 = fma(_3357, _3353, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3301 = _3359;
                _3331 = true;
            }
            else
            {
                _3301 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3331 = false;
    float _3361 = _3301;
    float _3363 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3365 = _3223 + _3363;
    float _3367 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3369 = _3229 + _3367;
    float _3371 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3373 = _3231 + _3371;
    float _3375 = fma(_3365, _3361, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3377 = fma(_3369, _3361, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3379 = fma(_3373, _3361, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3381 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3383 = _3375 + _3381;
    float _3385 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3387 = _3377 + _3385;
    float _3389 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3391 = _3379 + _3389;
    float _3393 = _3383 * _3383;
    float _3395 = fma(_3387, _3387, _3393);
    float _3397 = fma(_3391, _3391, _3395);
    float _3399 = rsqrt(_3397);
    float _3401 = _3399 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3403 = _3387 * _3401;
    float _3405 = _3391 * _3401;
    float _3407 = _3403 * _3403;
    float _3409 = _3405 * _3405;
    float _3411 = _3407 + _3409;
    float _3413 = sqrt(_3411);
    bool _3415 = _3413 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3417 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3419 = _3413 + _3417;
    float _3421 = _3399;
    float _3423 = _3419;
    float _3425 = _3383;
    float _3427 = _3403;
    if (_3415)
    {
        float _3429 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3421 = _3429;
    }
    float _3431 = _3421;
    if (_3415)
    {
        float _3433 = rsqrt(_3411);
        _3291 = _3433;
    }
    float _3435 = _3291;
    float _3437 = _3435;
    if (_3415)
    {
        float _3439 = _3419 * _3431;
        _3423 = _3439;
    }
    float _3441 = _3423;
    float _3443 = _3375 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3415)
    {
        float _3445 = _3441 * 0.15915493667125701904296875;
        _3293 = _3445;
    }
    float _3447 = _3293;
    float _3449 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3443);
    float _3451 = _3391;
    if (_3415)
    {
        float _3453 = _3447 * 6.283185482025146484375;
        float _3455 = sin(_3453);
        _3451 = _3455;
    }
    float _3457 = _3451;
    float _3459 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3461 = precise::max(0.0, _3459);
    float _3463 = _3431;
    float _3465 = _3461;
    if (_3415)
    {
        float _3467 = _3447 * 6.283185482025146484375;
        float _3469 = cos(_3467);
        _3463 = _3469;
    }
    float _3471 = _3463;
    float _3473 = -_3401;
    float _3475 = -_3461;
    float _3477 = fma(_3383, _3473, _3475);
    if (_3415)
    {
        float _3479 = _3477 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3425 = _3479;
    }
    float _3481 = _3425;
    float _3483 = sqrt(_3397);
    float _3485 = _3481;
    float _3487 = _3457;
    if (_3415)
    {
        float _3489 = fma(_3457, _3481, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3485 = _3489;
    }
    float _3491 = _3485;
    float _3493 = _3491;
    if (!_3415)
    {
        _3487 = _3405;
    }
    float _3495 = _3487;
    float _3497 = _3495;
    if (_3415)
    {
        float _3499 = _3471 + (-1.0);
        _3465 = _3499;
    }
    float _3501 = _3465;
    float _3503 = _3501;
    if (_3415)
    {
        float _3505 = _3435 * _3491;
        _3295 = _3505;
    }
    float _3507 = _3295;
    if (!_3415)
    {
        _3437 = _3477;
    }
    float _3509 = _3437;
    float _3511 = _3509;
    if (_3415)
    {
        float _3513 = _3501 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3503 = _3513;
    }
    float _3515 = _3503;
    float _3517 = _3515;
    if (_3415)
    {
        float _3519 = _3403 * _3507;
        _3427 = _3519;
    }
    float _3521 = _3427;
    if (!_3415)
    {
        _3493 = _3407;
    }
    float _3523 = _3493;
    float _3525 = _3523;
    if (_3415)
    {
        float _3527 = _3405 * _3507;
        _3497 = _3527;
    }
    float _3529 = _3497;
    if (_3415)
    {
        float _3531 = fma(_3477, _3471, _3515);
        _3511 = _3531;
    }
    float _3533 = _3511;
    if (_3415)
    {
        float _3535 = _3521 * _3521;
        _3525 = _3535;
    }
    float _3537 = _3525;
    if (!_3415)
    {
        _3517 = _3409;
    }
    float _3539 = _3517;
    float _3541 = _3539;
    if (_3415)
    {
        float _3543 = _3529 * _3529;
        _3541 = _3543;
    }
    float _3545 = _3541;
    float _3547 = fma(_3533, _3533, _3537);
    float _3549 = _3547 + _3545;
    float _3551 = _3375 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3553 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3555 = fma(_3483, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3553);
    float _3557 = precise::clamp(_3555, 0.0, 1.0);
    float _3559 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3561 = rsqrt(_3549);
    float _3563 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3551);
    float _3565 = _3375 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3567 = -_3557;
    float _3569 = _3567 + 1.0;
    float _3571 = fma(_3379, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3563);
    float _3573 = _3375 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3575 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3565);
    float _3577 = _3571 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3579 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3573);
    float _3581 = abs(_3569);
    float _3583 = log2(_3581);
    float _3585 = fma(_3379, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3575);
    float _3587 = _3577 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3589 = fma(_3379, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3579);
    float _3591 = _3585 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3593 = _3561 * _3521;
    float _3595 = -_3587;
    float _3597 = fma(_3595, _3559, 1.0);
    float _3599 = _3589 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3601 = _3591 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3603 = fma(_3379, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3449);
    float _3605 = _3561 * _3533;
    float _3607 = _3593 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3609 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3601);
    float _3611 = _3561 * _3529;
    float _3613 = _3603 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3615 = _3583 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3617 = -_3607;
    float _3619 = fma(_3605, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3617);
    float _3621 = fma(_3577, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3609);
    float _3623 = log2(_3597);
    float _3625 = _3591 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3627 = -_3611;
    float _3629 = fma(_3627, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3619);
    float _3631 = fma(_3613, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3621);
    float _3633 = _3591 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3635 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3625);
    float _3637 = fma(_3629, -0.5, 0.5);
    float _3639 = fma(_3629, 0.5, 0.5);
    float _3641 = exp2(_3615);
    float _3643 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3633);
    float _3645 = _3605 + 1.0;
    float _3647 = fma(_3639, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3649 = fma(_3577, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3643);
    float _3651 = fma(_3639, _3647, -0.212114393711090087890625);
    float _3653 = 1.0 / _3631;
    float _3655 = fma(_3577, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3635);
    float _3657 = _3623 * 0.693147182464599609375;
    float _3659 = fma(_3639, _3651, 1.570728778839111328125);
    float _3661 = sqrt(_3637);
    float _3663 = -_3605;
    float _3665 = fma(_3641, _3645, _3663);
    float _3667 = fma(_3613, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3649);
    float _3669 = fma(_3613, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3655);
    float _3671 = fma(_3665, 0.5, 0.5);
    float _3673 = _3667 * _3653;
    float _3675 = _3669 * _3653;
    float _3677 = _3657 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3679 = fma(_3673, 0.5, 0.5);
    float _3681 = fma(_3675, -0.5, 0.5);
    float _3683 = _3661 * 0.636619746685028076171875;
    float3 _9148 = float3(_3679, _3681, _3677);
    float _3685 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9148, float3(0.0), isnan(_9148)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9148, float3(0.0), isnan(_9148)), level(0.0)).x;
    float3 _9159 = float3(_3679, _3681, _3677);
    float4 _3687 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9159, float3(0.0), isnan(_9159)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9159, float3(0.0), isnan(_9159)), level(0.0)).xyzw;
    float _3689 = _3687.x;
    float _3691 = _3687.y;
    float _3693 = _3687.z;
    float _3695 = _3687.w;
    float _3697 = -_3659;
    float _3699 = fma(_3683, _3697, 1.0);
    float2 _9180 = float2(_3699, _3671);
    float3 _3703 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9180, float2(0.0), isnan(_9180)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9180, float2(0.0), isnan(_9180)), level(0.0)).xyz;
    float _3705 = _3703.x;
    float _3707 = _3703.y;
    float _3709 = _3703.z;
    float _3711 = _3583 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3713 = _3591 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_77.x = _3377;
    out.m_77.y = _3375;
    out.m_77.z = _3379;
    float _3715 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3713);
    float _3717 = exp2(_3711);
    float _3719 = fma(_3577, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3715);
    float _3721 = fma(_3613, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3719);
    float _3723 = _3721 + _3631;
    out.gl_Position.x = _3667;
    out.gl_Position.y = _3669;
    out.gl_Position.z = _3721;
    out.gl_Position.w = _3631;
    float _3725 = _3723 * 0.5;
    float _3727 = -_3717;
    float _3729 = _3727 + 1.0;
    float _3731 = _3729 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3733 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.z = _3725;
    out.m_79.w = _3631;
    out.m_49.x = _3733;
    float _3735 = _3731 * _3685;
    float _3737 = -_3731;
    float _3739 = _3737 + 1.0;
    float _3741 = _3695 * _3735;
    float _3743 = _3709 * _3735;
    float _3745 = fma(_3705, _3741, _3689);
    float _3747 = fma(_3707, _3741, _3691);
    float _3749 = _3695 * _3739;
    float _3751 = fma(_3695, _3743, _3693);
    out.m_81.x = _3745;
    out.m_81.y = _3747;
    out.m_81.z = _3751;
    out.m_81.w = _3749;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3331 = false;
    bool _2503 = false;
    bool _2315 = false;
    bool _829 = false;
    bool _707 = false;
    bool _535 = false;
    bool _309 = false;
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
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_109)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3807 = as_type<float>(_119);
        out.gl_Position.z = _3807;
    }
    if (!_109)
    {
        return out;
    }
    float _123 = in.m_51.w;
    float _125 = float(_105);
    float _127 = in.m_53.x;
    float _129 = 1.0 / _125;
    float _131 = -_123;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_123);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = _133 * _129;
    bool _147 = _133 >= _125;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    out.m_55.x = _127;
    out.m_57.x = _145;
    float _153 = _123;
    float _155 = _133;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _153;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _159 = _157 * 5.0;
        _121 = as_type<int>(_159);
    }
    int _161 = _121;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3883 = as_type<float>(_161);
        out.gl_Position.z = _3883;
    }
    if (_151)
    {
        return out;
    }
    float _163 = in.m_59.x;
    float _165 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = in.m_59.y;
    bool _169 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _171 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _173 = _169 || _171;
    bool _175 = isnan(1.0);
    bool _177 = _173 || _175;
    float _179 = in.m_61.w;
    float _181 = in.m_51.x;
    float _183 = in.m_51.y;
    float _185 = in.m_51.z;
    float _187 = in.m_46.x;
    float _189 = in.m_46.y;
    float _191 = in.m_46.z;
    float _193 = 0.0;
    float _195 = _165;
    if (!_177)
    {
        float _197 = _165 * _165;
        float _199 = _197 * 0.5;
        _193 = _199;
    }
    float _201 = _193;
    float _203 = _201;
    if (!_177)
    {
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _205;
    }
    float _207 = _203;
    out.m_63.x = _163;
    out.m_63.y = _167;
    bool _209 = !_177;
    float _211 = _207;
    float _213 = _163;
    if (!_209)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _165 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _165);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _243;
    }
    float _245 = _211;
    bool _247 = !_177;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _165 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _195 = _267;
    }
    float _269 = _195;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _273 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _275 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _277 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _279 = fma(_269, _181, _273);
    float _281 = fma(_269, _183, _275);
    float _283 = fma(_269, _185, _277);
    float _285 = fma(_279, _179, _187);
    float _287 = fma(_281, _179, _189);
    float _289 = fma(_283, _179, _191);
    bool _291 = !_271;
    float _307;
    if (!_291)
    {
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _295 = _127 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        _307 = _145;
    }
    _309 = false;
    float _311 = _307;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = _311 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _311 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _323 = _311 + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _333;
    float _337 = 1.0 / _327;
    bool _339 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_311);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = 1.0 / _331;
    bool _353 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _355 = isnan(_311);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    bool _365 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _367 = -_363;
    float _369 = _367 + 1.0;
    float _371 = 1.0 / _335;
    float _373 = _315 * _337;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = fma(_377, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _381 = _319 * _351;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _387;
    float _391 = fma(_385, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _393 = fma(_389, _373, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _399 = _323 * _371;
    bool _401 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _403 = isnan(_311);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    bool _413 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _415 = isnan(_311);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _429 = _411 * _369;
    float _431 = -_411;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _439 = -_423;
    float _441 = _439 + 1.0;
    float _443 = fma(_397, _381, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _445 = _423 * _433;
    float _447 = fma(_437, _381, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _449 = _349 * _441;
    float _451 = in.m_61.x;
    float _453 = in.m_61.y;
    float _455 = in.m_61.z;
    float _457 = fma(_427, _381, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _459 = _379 * _449;
    float _461 = _391 * _449;
    float _463 = -_349;
    float _465 = _463 + 1.0;
    float _467 = _393 * _449;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _473;
    float _477 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].x, _459);
    float _479 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].y, _461);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _481;
    float _485 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].z, _467);
    float _487 = fma(_471, _399, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _489 = fma(_475, _399, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _491 = fma(_483, _399, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _493 = fma(_457, _445, _477);
    float _495 = fma(_443, _445, _479);
    float _497 = fma(_447, _445, _485);
    float _499 = fma(_487, _429, _493);
    float _501 = fma(_489, _429, _495);
    float _503 = fma(_491, _429, _497);
    float _505 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].x, _499);
    float _507 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].y, _501);
    float _509 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].z, _503);
    float _511 = _505 * _451;
    float _513 = _507 * _453;
    float _515 = _509 * _455;
    bool _517 = !_365;
    float _533;
    if (!_517)
    {
        float _519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _521 = _127 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _523 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _525 = _523 * _519;
        float _527 = floor(_525);
        float _529 = -_527;
        float _531 = _525 + _529;
        _533 = _531;
        _535 = true;
    }
    else
    {
        _533 = _145;
    }
    _535 = false;
    float _537 = _533;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _541 = _537 + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _547 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _549 = isnan(_537);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _567 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _569 = isnan(_537);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = 1.0 / _545;
    float _581 = -_557;
    float _583 = _581 + 1.0;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _585;
    bool _589 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _591 = isnan(_537);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = _577 * _583;
    float _603 = -_577;
    float _605 = _603 + 1.0;
    bool _607 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _609 = 1.0 / _561;
    float _611 = _599 * _605;
    float _613 = -_599;
    float _615 = _613 + 1.0;
    float _617 = 1.0 / _565;
    float _619 = _587 * _579;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _625 = fma(_619, _541, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _627 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _629 = isnan(_537);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = _623 * _609;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _641;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _647 = _537 + _645;
    float _649 = _625 * _611;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _653 = _537 + _651;
    float _655 = fma(_639, _647, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _657 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[115].x, _649);
    float _659 = _643 * _617;
    float _661 = -_637;
    float _663 = _661 + 1.0;
    float _665 = fma(_655, _601, _657);
    float _667 = fma(_659, _653, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _669 = _557 * _663;
    float _671 = fma(_667, _669, _665);
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _679 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[118].x, _671);
    float _681 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _683 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _679 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_65.x = _681;
    out.m_65.y = _683;
    out.m_65.z = _685;
    out.m_65.w = _687;
    bool _689 = !_607;
    float _705;
    if (!_689)
    {
        float _691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _693 = _127 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _695 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _697 = _695 * _691;
        float _699 = floor(_697);
        float _701 = -_699;
        float _703 = _697 + _701;
        _705 = _703;
        _707 = true;
    }
    else
    {
        _705 = _145;
    }
    _707 = false;
    float _709 = _705;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _713 = _709 + _711;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _719 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _721 = isnan(_709);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _735 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _737 = isnan(_709);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _747;
    bool _751 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _753 = isnan(_709);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = 1.0 / _717;
    float _765 = -_729;
    float _767 = _765 + 1.0;
    bool _769 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _771 = _745 * _767;
    float _773 = -_745;
    float _775 = _773 + 1.0;
    float _777 = 1.0 / _733;
    float _779 = _749 * _763;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _785 = fma(_779, _713, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _787 = -_761;
    float _789 = _787 + 1.0;
    float _791 = _785 * _771;
    float _793 = _783 * _777;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _797 = _709 + _795;
    float _799 = _729 * _789;
    float _801 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[131].x, _791);
    float _803 = fma(_793, _797, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _805 = fma(_803, _799, _801);
    float _807 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[133].x, _805);
    float _809 = _807 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.w = _809;
    bool _811 = !_769;
    float _827;
    if (!_811)
    {
        float _813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _815 = _127 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _817 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[14].x, _133);
        float _819 = _817 * _813;
        float _821 = floor(_819);
        float _823 = -_821;
        float _825 = _819 + _823;
        _827 = _825;
        _829 = true;
    }
    else
    {
        _827 = _145;
    }
    _829 = false;
    float _831 = _827;
    int _833 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _835 = _833;
    int _837 = 0;
    int _839 = _96(_835, _837, (*spvDescriptorSet0.support_buffer));
    float _841 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _843 = int(_841);
    float _845 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _847 = int(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _857;
    float _861 = float(_843);
    float _863 = 1.0 / _851;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _877 = float(uint(_847));
    float _879 = 1.0 / _861;
    float _881 = 1.0 / _877;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _887 = _867 * _863;
    float _889 = _133 * _879;
    float _891 = 1.0 / _875;
    int _893 = as_type<int>(_881) + (-2);
    float _895 = trunc(_889);
    int _897 = int(_895);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _907 = ~_847;
    int _909 = _907 + 1;
    float _911 = 1.0 / _885;
    float _913 = _859 * _891;
    float _915 = float(uint(_897));
    float _917 = 1.0 / _901;
    float _919 = as_type<float>(_893) * _915;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _925 = 1.0 / _905;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _929 = _927 != 0;
    float _931 = _871 * _911;
    float _933 = in.m_53.y;
    float _935 = trunc(_919);
    float _937 = precise::max(_935, 0.0);
    uint _940 = uint(_937);
    float _942 = _901;
    int _944 = as_type<int>(_863);
    int _946 = as_type<int>(_891);
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _950 = _917;
    int _952 = as_type<int>(_911);
    if (_929)
    {
        float _954 = in.m_53.z;
        _942 = _954;
    }
    float _956 = _942;
    bool _958 = false;
    if (_929)
    {
        _958 = false;
    }
    bool _960 = _958;
    float _962 = 1.0 / _923;
    bool _964 = _960;
    if (_929)
    {
        _944 = as_type<int>(_127);
    }
    int _966 = _944;
    int _968 = _909 * int(_940);
    int _970 = _968 + _897;
    float _972 = 1.0 / _855;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _974;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _982 = _966;
    if (_929)
    {
        _946 = as_type<int>(_933);
    }
    int _984 = _946;
    float _986 = float(uint(_970));
    float _988 = _976 * _925;
    float _990 = _980 * _962;
    float _992 = as_type<float>(_893) * _986;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _998 = _984;
    if (_929)
    {
        _948 = _127;
    }
    float _1000 = _948;
    float _1002 = trunc(_992);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    float _1008 = _996 * _917;
    float _1010 = _1000;
    if (_929)
    {
        _950 = 1.0;
    }
    float _1012 = _950;
    float _1014 = _1012;
    float _1016 = _956;
    if (_929)
    {
        _952 = as_type<int>(_956);
    }
    int _1018 = _952;
    int _1020 = _1018;
    if (!_929)
    {
        float _1022 = in.m_53.z;
        float _1024 = _127 * 3.1415927410125732421875;
        float _1026 = _933 * 3.1415927410125732421875;
        float _1028 = _1024 * 0.15915493667125701904296875;
        float _1030 = _1026 * 0.15915493667125701904296875;
        float _1032 = _1028 * 6.283185482025146484375;
        float _1034 = sin(_1032);
        float _1036 = _1030 * 6.283185482025146484375;
        float _1038 = sin(_1036);
        float _1040 = _1022 * 3.1415927410125732421875;
        float _1042 = _1040 * 0.15915493667125701904296875;
        float _1044 = _1042 * 6.283185482025146484375;
        float _1046 = sin(_1044);
        _1010 = _933;
        _1014 = 1.2345600128173828125;
        _964 = true;
        _998 = as_type<int>(_1038);
        _982 = as_type<int>(_1034);
        _1020 = as_type<int>(_1046);
        _1016 = _1022;
    }
    float _1048 = _1010;
    float _1050 = _1014;
    bool _1052 = _964;
    int _1054 = _998;
    int _1056 = _982;
    int _1058 = _1020;
    float _1060 = _1016;
    float _1062 = _1048 * _1050;
    int _1064 = ~_847;
    int _1066 = _1064 + 1;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1070 = _831 + _1068;
    int _1072 = int(_940) + int(_1006);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1076 = _831 + _1074;
    float _1078 = float(_847);
    float _1080 = floor(_1062);
    float _1082 = float(_897);
    int _1084 = _1066 * _1072;
    int _1086 = _1084 + _897;
    float _1088 = _133 * _1078;
    float _1090 = fma(_913, _1076, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1092 = fma(_887, _1070, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1094 = uint(_1086) >= uint(_847);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1096;
    bool _1100 = _1082 >= _1078;
    bool _1102 = isnan(_1082);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(_1078);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    bool _1112 = !_1094;
    int _1114 = _1112 ? 0 : (-1);
    float _1116 = _1098 * _972;
    float _1118 = _1088 * _129;
    bool _1120 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1122 = isnan(_831);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = trunc(_1110);
    int _1134 = int(_1132);
    bool _1136 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1138 = isnan(_831);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1144 = _1140 || _1142;
    float _1146 = float(_1144);
    float _1148 = -_1080;
    float _1150 = _1062 + _1148;
    int _1152 = ~_1072;
    int _1154 = _1152 + _1114;
    int _1156 = _1154 + 1;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1160 = _1158 != 0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1168 = _1166 != 0;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1172 = _1170 != 0;
    float _1174 = -_1130;
    float _1176 = _1174 + 1.0;
    bool _1178 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1180 = isnan(_831);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = -_1146;
    float _1192 = _1190 + 1.0;
    int _1194 = _847 * _1156;
    int _1196 = _1194 + _897;
    bool _1198 = _847 == 0;
    float _1200 = _1146 * _1176;
    float _1202 = _1188 * _1192;
    bool _1204 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1206 = isnan(_831);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1212 = _1208 || _1210;
    float _1214 = float(_1212);
    float _1216 = _1150 * _1078;
    bool _1218 = !_1198;
    int _1220 = _1218 ? _1196 : (-1);
    float _1222 = -_1188;
    float _1224 = _1222 + 1.0;
    int _1226 = ~_1134;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    float _1232 = _1214 * _1224;
    bool _1234 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1236 = isnan(_831);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    int _1246 = _1220 * _1230;
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1250 = _1248 != 0;
    float _1252 = -_1214;
    float _1254 = _1252 + 1.0;
    bool _1256 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1258 = isnan(_831);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1264 = _1260 || _1262;
    float _1266 = float(_1264);
    float _1268 = -_1244;
    float _1270 = _1268 + 1.0;
    float _1272 = trunc(_1216);
    int _1274 = int(_1272);
    bool _1276 = !_1250;
    int _1278 = _1276 ? 0 : 1;
    float _1280 = _1244 * _1254;
    float _1282 = _1266 * _1270;
    bool _1284 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1286 = isnan(_831);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    float _1296 = -_1266;
    float _1298 = _1296 + 1.0;
    bool _1300 = !_1164;
    int _1302 = _1300 ? 0 : 1;
    int _1304 = abs(_1278);
    float _1306 = _1294 * _1298;
    float _1308 = trunc(_1118);
    int _1310 = int(_1308);
    int _1312 = _847 + (-1);
    float _1314 = -_1294;
    float _1316 = _1314 + 1.0;
    int _1318 = abs(_1302);
    float _1320 = _1090 * _1306;
    int _1322 = _1134 * _1312;
    int _1324 = _1322 + _1246;
    bool _1326 = !_1160;
    int _1328 = _1326 ? 0 : 1;
    int _1330 = _1274 * _1304;
    int _1332 = _1330 + _897;
    bool _1334 = !_1168;
    int _1336 = _1334 ? 0 : 1;
    int _1338 = abs(_1328);
    int _1340 = _1324 * _1318;
    bool _1342 = !_1172;
    int _1344 = _1342 ? 0 : 1;
    int _1346 = abs(_1336);
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1350 = _831 + _1348;
    int _1352 = abs(_1344);
    int _1354 = _1310 * _1338;
    int _1356 = _1354 + _1340;
    float _1358 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1320);
    float _1360 = fma(_931, _1350, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1362 = _1332 * _1346;
    int _1364 = _1362 + _1356;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1368 = _831 + _1366;
    float _1370 = fma(_1092, _1282, _1358);
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1374 = _831 + _1372;
    int _1376 = _1274 * _1352;
    int _1378 = _1376 + _1364;
    float _1380 = fma(_1008, _1368, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1382 = fma(_1360, _1280, _1370);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1386 = _831 + _1384;
    float _1388 = fma(_988, _1374, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1390 = float(uint(_1378));
    float _1392 = fma(_1380, _1232, _1382);
    bool _1394 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1396 = isnan(_831);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1402 = _1398 || _1400;
    float _1404 = float(_1402);
    float _1406 = in.m_59.z;
    float _1408 = fma(_990, _1386, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1410 = as_type<float>(_893) * _1390;
    float _1412 = fma(_1388, _1202, _1392);
    float _1414 = -_1404;
    float _1416 = _1414 + 1.0;
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1420 = _831 + _1418;
    int _1422 = _839 + (-1);
    float _1424 = fma(_1408, _1200, _1412);
    float _1426 = _1130 * _1416;
    float _1428 = fma(_1116, _1420, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1430 = trunc(_1410);
    float _1432 = precise::max(_1430, 0.0);
    uint _1434 = uint(_1432);
    float _1436 = float(_1422);
    float _1438 = fma(_1428, _1426, _1424);
    int _1440 = ~_847;
    int _1442 = _1440 + 1;
    int _1444 = ~_847;
    int _1446 = _1444 + 1;
    float _1448 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1438);
    float _1450 = precise::clamp(_1448, 0.0, 1.0);
    float _1452 = _1450 * _1436;
    float _1454 = trunc(_1406);
    int _1456 = int(_1454);
    int _1458 = _1442 * int(_1434);
    int _1460 = _1458 + _1378;
    float _1462 = float(uint(_1460));
    float _1464 = trunc(_1452);
    int _1466 = int(_1464);
    float _1468 = as_type<float>(_893) * _1462;
    float _1470 = trunc(_1468);
    float _1472 = precise::max(_1470, 0.0);
    uint _1474 = uint(_1472);
    int _1476 = _1466;
    int _1478 = 0;
    int _1480 = _97(_1476, _1478, (*spvDescriptorSet0.support_buffer));
    int _1482 = _1456;
    int _1484 = 0;
    int _1486 = _97(_1482, _1484, (*spvDescriptorSet0.support_buffer));
    float4 _1489 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1480, _1486)), 0).xyzw;
    float _1491 = _1489.x;
    float _1493 = _1489.y;
    float _1495 = _1489.z;
    float _1497 = _1489.w;
    int _1499 = ~_847;
    int _1501 = _1499 + 1;
    float _1503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1505 = ~_847;
    int _1507 = _1505 + 1;
    float _1509 = -_167;
    float _1511 = _1509 + 1.0;
    float _1513 = _1052 ? as_type<float>(_1054) : as_type<float>(_1056);
    int _1515 = int(_1434) + int(_1474);
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1519 = _1052 ? as_type<float>(_1058) : as_type<float>(_1054);
    float _1521 = as_type<float>(_1054);
    int _1523 = _1356;
    float _1525 = _1060;
    if (_1052)
    {
        _1521 = _933;
    }
    float _1527 = _1521;
    int _1529 = _1446 * _1515;
    int _1531 = _1529 + _1378;
    float _1533 = float(uint(_1332));
    float _1535 = _1527;
    if (!_1052)
    {
        _1535 = _127;
    }
    float _1537 = _1535;
    float _1539 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1541 = uint(_1531) >= uint(_847);
    float _1543 = as_type<float>(_893) * _1533;
    float _1545 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1547 = !_1541;
    int _1549 = _1547 ? 0 : (-1);
    float _1551 = trunc(_1543);
    float _1553 = precise::max(_1551, 0.0);
    uint _1555 = uint(_1553);
    int _1557 = ~_1515;
    int _1559 = _1557 + _1549;
    int _1561 = _1559 + 1;
    int _1563 = _847 * _1561;
    int _1565 = _1563 + _1378;
    bool _1567 = !_1198;
    int _1569 = _1567 ? _1565 : (-1);
    int _1571 = _1501 * int(_1555);
    int _1573 = _1571 + _1332;
    int _1575 = _1569 >> 31;
    int _1577 = _1569 & 3;
    bool _1579 = _1577 != 0;
    int _1581 = _1575 & 3;
    float _1583 = float(uint(_1573));
    int _1585 = _1569 + _1581;
    int _1587 = _1569 & 3;
    bool _1589 = _1587 != 0;
    float _1591 = as_type<float>(_893) * _1583;
    int _1593 = _1585 >> 2;
    bool _1595 = uint(_1587) > 1u;
    float _1597 = trunc(_1591);
    float _1599 = precise::max(_1597, 0.0);
    uint _1601 = uint(_1599);
    int _1603 = _1593 << 4;
    int _1605 = _1603 + 512;
    int _1607 = _1579 ? 0 : 1;
    uint _1609 = uint(int(uint(_1605) >> uint(2)));
    uint _1611 = uint(int(uint(int(_1609)) >> uint(2)));
    int _1613 = int(_1609) & 3;
    float _1615 = (*spvDescriptorSet0.vp_c9)._m0[int(_1611)][_1613];
    int _1617 = int(_1609) + 1;
    uint _1619 = uint(int(uint(_1617) >> uint(2)));
    int _1621 = _1617 & 3;
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[int(_1619)][_1621];
    bool _1625 = uint(_1587) >= 2u;
    bool _1627 = _1587 != 3;
    int _1629 = _1605 + 8;
    uint _1631 = uint(int(uint(_1629) >> uint(2)));
    uint _1633 = uint(int(uint(int(_1631)) >> uint(2)));
    int _1635 = int(_1631) & 3;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[int(_1633)][_1635];
    int _1639 = int(_1631) + 1;
    uint _1641 = uint(int(uint(_1639) >> uint(2)));
    int _1643 = _1639 & 3;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[int(_1641)][_1643];
    int _1647 = int(_1555) + int(_1601);
    int _1649 = ~_1607;
    int _1651 = _1649 + 1;
    int _1653 = _1651 + 1;
    int _1655 = _1653;
    bool _1657 = _1627;
    float _1659 = _1539;
    if (!_1595)
    {
        int _1661 = ~_1607;
        int _1663 = _1661 + 1;
        _1655 = _1663;
    }
    int _1665 = _1655;
    int _1667 = _1507 * _1647;
    int _1669 = _1667 + _1332;
    int _1671 = _1625 ? 0 : 1;
    int _1673 = abs(_1665);
    bool _1675 = uint(_1669) >= uint(_847);
    int _1677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1679 = _1677 != 0;
    bool _1681 = !_1675;
    int _1683 = _1681 ? 0 : (-1);
    int _1685 = ~_1647;
    int _1687 = _1685 + _1683;
    int _1689 = _1687 + 1;
    int _1691 = ~_1673;
    int _1693 = _1691 + 1;
    int _1695 = _1693 + 1;
    bool _1697 = !_1589;
    int _1699 = _1697 ? 0 : 1;
    int _1701 = ~_1671;
    int _1703 = _1701 + 1;
    int _1705 = _1703 + 1;
    int _1707 = abs(_1699);
    int _1709 = _1705;
    float _1711 = as_type<float>(_1707);
    if (_1627)
    {
        int _1713 = ~_1671;
        int _1715 = _1713 + 1;
        _1709 = _1715;
    }
    int _1717 = _1709;
    int _1719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1721 = _1719 != 0;
    if (_1679)
    {
        bool _1723 = _127 > 0.5;
        _1657 = _1723;
    }
    bool _1725 = _1657;
    if (!_1679)
    {
        _1711 = _163;
    }
    float _1727 = _1711;
    int _1729 = _1695 * as_type<int>(_1623);
    int _1731 = as_type<int>(_1623);
    float _1733 = _1727;
    if (_1679)
    {
        float _1735 = -_163;
        float _1737 = _1735 + 1.0;
        _1731 = as_type<int>(_1737);
    }
    int _1739 = _1731;
    bool _1741 = _1587 != 3;
    int _1743 = abs(_1717);
    if (_1679)
    {
        float _1745 = _1725 ? as_type<float>(_1739) : _163;
        _1733 = _1745;
    }
    float _1747 = _1733;
    int _1749 = _847 * _1689;
    int _1751 = _1749 + _1332;
    int _1753 = ~_1707;
    int _1755 = _1753 + 1;
    int _1757 = _1755 + 1;
    float _1759 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1761 = int(_1759);
    bool _1763 = !_1741;
    int _1765 = _1763 ? 0 : (-1);
    float _1767 = as_type<float>(_1673);
    if (_1721)
    {
        float _1769 = in.m_53.z;
        _1767 = _1769;
    }
    float _1771 = _1767;
    int _1773 = ~_1743;
    int _1775 = _1773 + 1;
    int _1777 = _1775 + 1;
    int _1779 = _1757 * as_type<int>(_1615);
    int _1781 = _1779 + _1729;
    int _1783 = abs(_1765);
    if (_1721)
    {
        float _1785 = -_163;
        float _1787 = _1785 + 1.0;
        _1523 = as_type<int>(_1787);
    }
    int _1789 = _1523;
    int _1791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1793 = _1791 != 0;
    int _1795 = _1777 * as_type<int>(_1637);
    int _1797 = _1795 + _1781;
    int _1799 = ~_1783;
    int _1801 = _1799 + 1;
    int _1803 = _1801 + 1;
    float _1805 = _127 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1807 = !_1793;
    float _1809 = _1807 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1811 = !_1198;
    int _1813 = _1811 ? _1751 : (-1);
    int _1815 = _1803 * as_type<int>(_1645);
    int _1817 = _1815 + _1797;
    int _1819 = abs(as_type<int>(_1809));
    float _1821 = -_1517;
    float _1823 = fma(_1805, 2.0, _1821);
    float _1825 = float(uint(_1761));
    float _1827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1829 = abs(_1761);
    int _1831 = ~_1819;
    int _1833 = _1831 + 1;
    int _1835 = _1833 + 1;
    float _1837 = float(uint(_1829));
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1841 = _1839 != 0;
    float _1843 = 1.0 / _1825;
    int _1845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1847 = _1845 != 0;
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1851 = _1849 != 0;
    int _1853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1855 = _1853 != 0;
    float _1857 = 1.0 / _1837;
    int _1859 = _1817 * _1835;
    bool _1861 = _1793;
    float _1863 = _1809;
    if (_1721)
    {
        bool _1865 = _1771 > 0.5;
        _1861 = _1865;
    }
    bool _1867 = _1861;
    float _1869 = _933 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1873 = _1813 * _1819;
    int _1875 = _1873 + _1859;
    if (!_1721)
    {
        _1863 = _163;
    }
    float _1877 = _1863;
    float _1879 = in.m_53.w;
    float _1881 = fma(_1869, -2.0, _1871);
    int _1883 = as_type<int>(_1843) + (-2);
    float _1885 = float(uint(_1875));
    float _1887 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1881);
    int _1889 = abs(_1875);
    float _1891 = as_type<float>(_1883) * _1885;
    float _1893 = _1877;
    if (_1721)
    {
        float _1895 = _1867 ? as_type<float>(_1789) : _163;
        _1893 = _1895;
    }
    float _1897 = _1893;
    float _1899 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1901 = as_type<int>(_1857) + (-2);
    float _1903 = fma(_1539, _1747, -0.5);
    float _1905 = float(uint(_1889));
    float _1907 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1899);
    float _1909 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1911 = _933 > 0.5;
    bool _1913 = _1911 && _1841;
    float _1915 = trunc(_1891);
    float _1917 = precise::max(_1915, 0.0);
    uint _1919 = uint(_1917);
    float _1921 = as_type<float>(_1901) * _1905;
    float _1923 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1907);
    float _1925 = -_133;
    float _1927 = fma(_1925, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1823);
    int _1929 = ~_1761;
    int _1931 = _1929 + 1;
    float _1933 = as_type<float>(_1931);
    if (!_1841)
    {
        _1659 = _163;
    }
    float _1935 = _1659;
    float _1937 = fma(_1923, _1903, _1927);
    float _1939 = trunc(_1921);
    float _1941 = precise::max(_1939, 0.0);
    uint _1943 = uint(_1941);
    bool _1945 = _933 > 0.5;
    bool _1947 = _1945 && _1847;
    float _1949 = _1935;
    if (_1913)
    {
        float _1951 = -_163;
        float _1953 = _1951 + 1.0;
        _213 = _1953;
    }
    float _1955 = _213;
    bool _1957 = _1879 > 0.5;
    bool _1959 = _1957 && _1851;
    bool _1961 = _1060 > 0.5;
    bool _1963 = _1961 && _1855;
    float _1965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    if (_1841)
    {
        _1949 = _1955;
    }
    float _1967 = _1949;
    int _1969 = _1931 * int(_1919);
    int _1971 = _1969 + _1875;
    float _1973 = _1947 ? _1511 : _167;
    float _1975 = _1959 ? _1511 : _167;
    float _1977 = _1963 ? _1511 : _167;
    float _1979 = fma(_1909, _1973, -0.5);
    int _1981 = ~int(_1943);
    int _1983 = _1981 + 1;
    if (_1052)
    {
        _1933 = _933;
    }
    float _1985 = _1933;
    float _1987 = _1985;
    if (!_1052)
    {
        _1987 = _127;
    }
    float _1989 = _1987;
    float _1991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _1993 = float(uint(_1971));
    int _1995 = _1983 * _1829;
    int _1997 = _1995 + _1889;
    float _1999 = _1965 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2001 = _1965;
    if (_1052)
    {
        _2001 = _1060;
    }
    float _2003 = _2001;
    float _2005 = as_type<float>(_1883) * _1993;
    float _2007 = float(uint(_1997));
    float _2009 = fma(_1999, _1967, -0.5);
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2013 = trunc(_2005);
    float _2015 = precise::max(_2013, 0.0);
    uint _2017 = uint(_2015);
    float _2019 = as_type<float>(_1901) * _2007;
    float _2021 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2011);
    float _2023 = _2003;
    if (!_1052)
    {
        _1525 = _933;
    }
    float _2025 = _1525;
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_1052)
    {
        _2023 = _933;
    }
    float _2029 = _2023;
    float _2031 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _2033 = trunc(_2019);
    float _2035 = precise::max(_2033, 0.0);
    uint _2037 = uint(_2035);
    float _2039 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[98].z, _2031);
    float _2041 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _2043 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _2045 = fma(_2029, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2027);
    float _2047 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2049 = _1991 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2051 = -_2043;
    float _2053 = fma(_2041, 2.0, _2051);
    float _2055 = fma(_1989, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2047);
    int _2057 = int(_1919) + int(_2017);
    float _2059 = fma(_1977, _2049, -0.5);
    float _2061 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _2063 = ~_1761;
    int _2065 = _2063 + 1;
    float _2067 = -_133;
    float _2069 = fma(_2067, (*spvDescriptorSet0.vp_c9)._m0[96].x, _2053);
    int _2071 = int(_1943) + int(_2037);
    float _2073 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[98].w, _2061);
    float _2075 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _2077 = _2065 * _2057;
    int _2079 = _2077 + _1875;
    int _2081 = ~_2071;
    int _2083 = _2081 + 1;
    float _2085 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2045);
    bool _2087 = uint(_2079) >= uint(_1761);
    int _2089 = _2083 * _1829;
    int _2091 = _2089 + _1889;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2095 = !_2087;
    int _2097 = _2095 ? 0 : (-1);
    float _2099 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2101 = uint(_2091) >= uint(_1829);
    float _2103 = -_2093;
    float _2105 = fma(_1545, 2.0, _2103);
    int _2107 = ~_2057;
    int _2109 = _2107 + _2097;
    int _2111 = _2109 + 1;
    float _2113 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2115 = _1875 ^ _1761;
    float _2117 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[97].z, _2039);
    bool _2119 = _1761 == 0;
    int _2121 = _1761 * _2111;
    int _2123 = _2121 + _1875;
    bool _2125 = !_2101;
    int _2127 = _2125 ? 0 : (-1);
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    uint _2131 = uint(int(uint(_2115) >> uint(31)));
    float _2133 = fma(_2117, _2009, _2069);
    bool _2135 = _1761 == 0;
    float _2137 = fma(_2075, -2.0, _2129);
    float _2139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2141 = ~_2127;
    int _2143 = _2071 + _2141;
    int _2145 = _2143 + 1;
    float _2147 = -_133;
    float _2149 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2105);
    int _2151 = ~int(_2131);
    int _2153 = _2151 + 1;
    float _2155 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2137);
    bool _2157 = !_2119;
    int _2159 = _2157 ? _2123 : (-1);
    float _2161 = _2113 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2163 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2073);
    int _2165 = _2145 ^ _2153;
    float _2167 = fma(_2161, _1897, -0.5);
    float _2169 = float(_2159);
    float _2171 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2173 = ~_2153;
    int _2175 = _2173 + _2165;
    int _2177 = _2175 + 1;
    float _2179 = -_2155;
    float _2181 = fma(_2163, _2059, _2179);
    float _2183 = _2133 + 0.5;
    float _2185 = fma(_2161, _2169, _2149);
    bool _2187 = !_2135;
    int _2189 = _2187 ? _2177 : (-1);
    float _2191 = fma(_2099, -2.0, _2171);
    float _2193 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2195 = _2181 + 0.5;
    float _2197 = float(_2189);
    float _2199 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2191);
    float _2201 = fma(_1975, _2193, -0.5);
    float _2203 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2021);
    out.m_69.x = _2183;
    out.m_69.y = _2195;
    float _2205 = -_2199;
    float _2207 = fma(_2193, _2197, _2205);
    uint _2209 = as_type<uint>(half2(float2(_1497, 0.0)));
    float _2211 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2055);
    float _2213 = -_1887;
    float _2215 = fma(_2203, _1979, _2213);
    int _2217 = _1466 + 1;
    uint _2219 = extract_bits(_2209, 0u, 8u);
    int _2221 = int(_2219) & 255;
    uint _2223 = extract_bits(_2209, 8u, 8u);
    int _2225 = int(_2223) & 255;
    int _2227 = _2225 << 8;
    int _2229 = _2221 | _2227;
    float _2231 = fma(_2211, _2167, _2185);
    float _2233 = fma(_2085, _2201, _2207);
    float _2235 = _2215 + 0.5;
    bool _2237 = _2229 >= 32768;
    float _2239 = _2231 + 0.5;
    int _2241 = _2229 + (-1024);
    float _2243 = _2233 + 0.5;
    int _2245 = min(_1422, _2217);
    int _2247 = _2241;
    if (_2237)
    {
        int _2249 = ~_2229;
        int _2251 = _2249 + 33792;
        int _2253 = _2251 + 1;
        _2247 = _2253;
    }
    int _2255 = _2247;
    int _2257 = _2255 + 30719;
    float _2259 = float(_2257);
    float _2261 = fma(_2259, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2263 = abs(_2261);
    float _2265 = -_2263;
    float _2267 = _2265 + 1.0;
    bool _2269 = _2261 < 0.0;
    float _2271 = float(_2269);
    float _2273 = abs(_2261);
    float _2275 = fma(_2273, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2277 = as_type<int>(_2267) + (-218103808);
    float _2279 = abs(_2261);
    float _2281 = fma(_2279, _2275, -0.212114393711090087890625);
    bool _2283 = uint(_2277) >= 1920991232u;
    float _2285 = _1937 + 0.5;
    float _2287 = abs(_2261);
    float _2289 = fma(_2287, _2281, 1.570728778839111328125);
    bool _2291 = !_2283;
    float _2313;
    if (!_2291)
    {
        int _2293 = as_type<int>(_2267);
        int _2295 = as_type<int>(_1937);
        int _2297 = _2177;
        int _2299 = 11312;
        int _2301;
        int _2303;
        int _2305;
        int _2307;
        int _2309;
        int _2311;
        _94(_2293, _2295, _2297, _2299, _2301, _2303, _2305, _2307, _2309, _2311, out.gl_Position, out.gl_PointSize);
        _2313 = as_type<float>(_2305);
        _2315 = true;
    }
    else
    {
        float _2317 = rsqrt(_2267);
        float _2319 = _2267 * _2317;
        float _2321 = _2317 * 0.5;
        float _2323 = -_2319;
        float _2325 = 0.0 + _2323;
        float _2327 = fma(_2321, _2325, 0.5);
        float _2329 = fma(_2319, _2327, _2319);
        float _2331 = -_2329;
        float _2333 = 0.0 + _2331;
        float _2335 = fma(_2329, _2333, _2267);
        float _2337 = fma(_2321, _2335, _2329);
        _2313 = _2337;
    }
    _2315 = false;
    float _2339 = _2313;
    int _2341 = _2245;
    int _2343 = 0;
    int _2345 = _97(_2341, _2343, (*spvDescriptorSet0.support_buffer));
    int _2347 = _1456;
    int _2349 = 0;
    int _2351 = _97(_2347, _2349, (*spvDescriptorSet0.support_buffer));
    float4 _2353 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2345, _2351)), 0).xyzw;
    float _2355 = _2353.x;
    float _2357 = _2353.y;
    float _2359 = _2353.z;
    float _2361 = _2353.w;
    float _2363 = _2289 * _2339;
    float _2365 = _2271 * 2.0;
    float _2367 = _2259 * 3.883221149444580078125;
    float _2369 = floor(_1452);
    float _2371 = -_2365;
    float _2373 = fma(_2363, _2371, _2363);
    float _2375 = _2367 * 0.15915493667125701904296875;
    float _2377 = fma(_2271, 3.1415927410125732421875, _2373);
    float _2379 = _2375 * 6.283185482025146484375;
    float _2381 = cos(_2379);
    float _2383 = _2377 * 0.15915493667125701904296875;
    float _2385 = _2383 * 6.283185482025146484375;
    float _2387 = sin(_2385);
    float _2389 = -_2369;
    float _2391 = _1452 + _2389;
    float _2393 = _2375 * 6.283185482025146484375;
    float _2395 = sin(_2393);
    float _2397 = _2387 * _2381;
    float _2399 = _2387 * _2395;
    uint _2401 = as_type<uint>(half2(float2(_2361, 0.0)));
    uint _2403 = extract_bits(_2401, 0u, 8u);
    int _2405 = int(_2403) & 255;
    uint _2407 = extract_bits(_2401, 8u, 8u);
    int _2409 = int(_2407) & 255;
    int _2411 = _2409 << 8;
    int _2413 = _2405 | _2411;
    bool _2415 = _2413 >= 32768;
    int _2417 = _2413 + (-1024);
    int _2419 = _2417;
    if (_2415)
    {
        int _2421 = ~_2413;
        int _2423 = _2421 + 33792;
        int _2425 = _2423 + 1;
        _2419 = _2425;
    }
    int _2427 = _2419;
    int _2429 = _2427 + 30719;
    float _2431 = float(_2429);
    float _2433 = fma(_2431, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2435 = abs(_2433);
    float _2437 = -_2435;
    float _2439 = _2437 + 1.0;
    float _2441 = abs(_2433);
    float _2443 = fma(_2441, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2445 = as_type<int>(_2439) + (-218103808);
    bool _2447 = uint(_2445) >= 1920991232u;
    float _2449 = -_1491;
    float _2451 = _2449 + _2355;
    float _2453 = -_1493;
    float _2455 = _2453 + _2357;
    float _2457 = -_1495;
    float _2459 = _2457 + _2359;
    float _2461 = fma(_2391, _2451, _1491);
    float _2463 = abs(_2433);
    float _2465 = fma(_2463, _2443, -0.212114393711090087890625);
    float _2467 = fma(_2391, _2455, _1493);
    float _2469 = fma(_2391, _2459, _1495);
    bool _2471 = _2433 < 0.0;
    float _2473 = float(_2471);
    float _2475 = abs(_2433);
    float _2477 = fma(_2475, _2465, 1.570728778839111328125);
    bool _2479 = !_2447;
    float _2501;
    if (!_2479)
    {
        int _2481 = as_type<int>(_2439);
        int _2483 = as_type<int>(_2383);
        int _2485 = as_type<int>(_2439);
        int _2487 = 12208;
        int _2489;
        int _2491;
        int _2493;
        int _2495;
        int _2497;
        int _2499;
        _94(_2481, _2483, _2485, _2487, _2489, _2491, _2493, _2495, _2497, _2499, out.gl_Position, out.gl_PointSize);
        _2501 = as_type<float>(_2493);
        _2503 = true;
    }
    else
    {
        float _2505 = rsqrt(_2439);
        float _2507 = _2439 * _2505;
        float _2509 = _2505 * 0.5;
        float _2511 = -_2507;
        float _2513 = 0.0 + _2511;
        float _2515 = fma(_2509, _2513, 0.5);
        float _2517 = fma(_2507, _2515, _2507);
        float _2519 = -_2517;
        float _2521 = 0.0 + _2519;
        float _2523 = fma(_2517, _2521, _2439);
        float _2525 = fma(_2509, _2523, _2517);
        _2501 = _2525;
    }
    _2503 = false;
    float _2527 = _2501;
    float _2529 = in.m_53.x;
    float _2531 = in.m_53.y;
    float _2533 = in.m_53.z;
    float _2535 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2537 = log2(_2535);
    float _2539 = _287 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2541 = _287 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2543 = _287 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2545 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2539);
    float _2547 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2541);
    float _2549 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2543);
    float _2551 = _2477 * _2527;
    int _2553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2555 = _2553 != 0;
    int _2557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2559 = _2557 != 0;
    int _2561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2563 = _2561 != 0;
    float _2565 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2547);
    float _2567 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2569 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2571 = _511 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2573 = _2537 * _133;
    float _2575 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2545);
    float _2577 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2549);
    float _2579 = _2431 * 3.883221149444580078125;
    float _2581 = _2575 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2583 = _2577 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2585 = _2533 * 2.0;
    float _2587 = _2529 * 2.0;
    float _2589 = _2529 + _2533;
    float _2591 = _2531 * 2.0;
    bool _2593 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2595 = isnan(1.0);
    bool _2597 = _2593 || _2595;
    bool _2599 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2601 = _2597 || _2599;
    float _2603 = floor(_2587);
    float _2605 = _2589 + (-1.0);
    float _2607 = -_2261;
    float _2609 = _2607 + _2433;
    float _2611 = fma(_2391, _2609, _2261);
    float _2613 = floor(_2585);
    float _2615 = floor(_2591);
    bool _2617 = _2603 >= 0.0;
    bool _2619 = isnan(_2603);
    bool _2621 = _2617 || _2619;
    bool _2623 = isnan(0.0);
    bool _2625 = _2621 || _2623;
    bool _2627 = _2613 > 0.0;
    bool _2629 = _2613 >= 0.0;
    bool _2631 = isnan(_2613);
    bool _2633 = _2629 || _2631;
    bool _2635 = isnan(0.0);
    bool _2637 = _2633 || _2635;
    float _2639 = fma(_2605, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _2641 = _2625 ? 0 : 1;
    float _2643 = exp2(_2573);
    int _2645 = _2637 ? 0 : 1;
    bool _2647 = _2603 > 0.0;
    float _2649 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2651 = 1.0 + _2649;
    bool _2653 = !_2555;
    int _2655 = _2653 ? 0 : 1;
    int _2657 = ~_2645;
    int _2659 = _2657 + 1;
    int _2661 = _2659 + 1;
    float _2663 = 1.0 / _2651;
    int _2665 = _2661;
    float _2667 = _2611;
    if (!_2627)
    {
        int _2669 = ~_2645;
        int _2671 = _2669 + 1;
        _2665 = _2671;
    }
    int _2673 = _2665;
    float _2675 = _2531 + _2529;
    bool _2677 = _2615 > 0.0;
    bool _2679 = _2615 >= 0.0;
    bool _2681 = isnan(_2615);
    bool _2683 = _2679 || _2681;
    bool _2685 = isnan(0.0);
    bool _2687 = _2683 || _2685;
    float _2689 = _2675 + (-1.0);
    int _2691 = abs(_2655);
    float _2693 = -_2643;
    float _2695 = _2693 + 1.0;
    float _2697 = float(_2673);
    float _2699 = in.m_71.x;
    float _2701 = in.m_71.y;
    float _2703 = in.m_71.z;
    float _2705 = float(_2691);
    float _2707 = fma(_2689, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2709 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2711 = isnan(0.0);
    bool _2713 = _2709 || _2711;
    bool _2715 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2717 = _2713 || _2715;
    int _2719 = _2687 ? 0 : 1;
    float _2721 = _2705 * _2697;
    float _2723 = _2529 + (-0.5);
    float _2725 = _2565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2727 = _2717 ? _2695 : 0.0;
    float _2729 = _2721 * (-2.0);
    bool _2731 = !_2563;
    int _2733 = _2731 ? 0 : 1;
    float _2735 = -_2725;
    float _2737 = _2735 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _2739 = ~_2719;
    int _2741 = _2739 + 1;
    int _2743 = _2741 + 1;
    int _2745 = _2743;
    float _2747 = _2725;
    if (_2601)
    {
        float _2749 = _2727 * _2663;
        _155 = _2749;
    }
    float _2751 = _155;
    if (!_2677)
    {
        int _2753 = ~_2719;
        int _2755 = _2753 + 1;
        _2745 = _2755;
    }
    int _2757 = _2745;
    float _2759 = fma(_2707, _2729, _2707);
    int _2761 = ~_2641;
    int _2763 = _2761 + 1;
    int _2765 = _2763 + 1;
    float _2767 = -_2581;
    float _2769 = _2767 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _2771 = abs(_2733);
    float _2773 = _2737 * _2737;
    int _2775 = _2765;
    if (!_2647)
    {
        int _2777 = ~_2641;
        int _2779 = _2777 + 1;
        _2775 = _2779;
    }
    int _2781 = _2775;
    float _2783 = -_2583;
    float _2785 = _2783 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _2787 = !_2559;
    int _2789 = _2787 ? 0 : 1;
    float _2791 = fma(_2729, _2699, _2699);
    float _2793 = float(_2771);
    float _2795 = fma(_2769, _2769, _2773);
    float _2797 = float(_2757);
    float _2799 = fma(_2723, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2791);
    int _2801 = abs(_2789);
    float _2803 = fma(_2785, _2785, _2795);
    bool _2805 = _2467 != 0.0;
    bool _2807 = isnan(_2467);
    bool _2809 = _2805 || _2807;
    bool _2811 = isnan(0.0);
    bool _2813 = _2809 || _2811;
    float _2815 = fma(_2759, _2751, _2799);
    float _2817 = _2793 * _2797;
    float _2819 = _2533 + (-0.5);
    float _2821 = _2531 + _2533;
    float _2823 = _2815 * 0.15915493667125701904296875;
    float _2825 = float(_2801);
    float _2827 = _2817 * (-2.0);
    float _2829 = float(_2781);
    float _2831 = rsqrt(_2803);
    float _2833 = _2821 + (-1.0);
    float _2835 = fma(_2827, _2703, _2703);
    float _2837 = fma(_2639, _2827, _2639);
    float _2839 = _2825 * _2829;
    float _2841 = _2531 + (-0.5);
    float _2843 = fma(_2819, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2835);
    float _2845 = _2839 * (-2.0);
    float _2847 = _2823 * 6.283185482025146484375;
    float _2849 = sin(_2847);
    float _2851 = fma(_2833, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2853 = fma(_2837, _2751, _2843);
    float _2855 = fma(_2845, _2701, _2701);
    float _2857 = _2473 * 2.0;
    float _2859 = fma(_2851, _2845, _2851);
    float _2861 = _2853 * 0.15915493667125701904296875;
    float _2863 = fma(_2841, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2855);
    float _2865 = -_2857;
    float _2867 = fma(_2551, _2865, _2551);
    float _2869 = _2823 * 6.283185482025146484375;
    float _2871 = cos(_2869);
    bool _2873 = _2461 == 0.0;
    bool _2875 = !_2813;
    bool _2877 = _2873 && _2875;
    float _2879 = fma(_2859, _2751, _2863);
    float _2881 = _2769 * _2831;
    float _2883 = _2785 * _2831;
    float _2885 = _2737 * _2831;
    float _2887 = _2879 * 0.15915493667125701904296875;
    float _2889 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2891 = _2881 * _2889;
    float _2893 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2895 = _2883 * _2893;
    float _2897 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2899 = _2885 * _2897;
    float _2901 = fma(_2473, 3.1415927410125732421875, _2867);
    float _2903 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2905 = -_2891;
    float _2907 = fma(_2883, _2903, _2905);
    float _2909 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2911 = -_2895;
    float _2913 = fma(_2885, _2909, _2911);
    float _2915 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2917 = -_2899;
    float _2919 = fma(_2881, _2915, _2917);
    float _2921 = _2861 * 6.283185482025146484375;
    float _2923 = sin(_2921);
    float _2925 = _2907 * _2907;
    bool _2927 = _2469 == 0.0;
    bool _2929 = _2927 && _2877;
    float _2931 = fma(_2913, _2913, _2925);
    float _2933 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2467);
    float _2935 = _2861 * 6.283185482025146484375;
    float _2937 = cos(_2935);
    float _2939 = fma(_2919, _2919, _2931);
    float _2941 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2461);
    float _2943 = _2569 * _2933;
    float _2945 = _2571 * _2941;
    float _2947 = _2887 * 6.283185482025146484375;
    float _2949 = cos(_2947);
    float _2951 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2469);
    float _2953 = _2871 * _2923;
    float _2955 = _2881;
    if (!_2929)
    {
        float _2957 = fma(_2467, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2611);
        _2667 = _2957;
    }
    float _2959 = _2667;
    float _2961 = _2887 * 6.283185482025146484375;
    float _2963 = sin(_2961);
    float _2965 = _2871 * _2937;
    float _2967 = rsqrt(_2939);
    float _2969 = _2567 * _2951;
    float _2971 = _2849 * _2923;
    float _2973 = _2949 * _2923;
    float _2975 = _2849 * _2937;
    float _2977 = _2871 * _2949;
    float _2979 = _2849 * _2949;
    float _2981 = _2949 * _2937;
    float _2983 = fma(_2963, _2971, _2965);
    float _2985 = -_2953;
    float _2987 = fma(_2963, _2975, _2985);
    float _2989 = -_2975;
    float _2991 = fma(_2963, _2953, _2989);
    float _2993 = _2979 * _2943;
    float _2995 = fma(_2963, _2965, _2971);
    float _2997 = _2987 * _2943;
    float _2999 = -_2963;
    float _3001 = fma(_2999, _2945, _2993);
    float _3003 = _2913 * _2967;
    float _3005 = _2907 * _2967;
    float _3007 = _2983 * _2943;
    float _3009 = _2919 * _2967;
    float _3011 = _2885 * _3003;
    float _3013 = _2883 * _3005;
    float _3015 = fma(_2973, _2945, _3007);
    float _3017 = fma(_2981, _2945, _2997);
    float _3019 = -_3011;
    float _3021 = fma(_2881, _3005, _3019);
    float _3023 = -_3013;
    float _3025 = fma(_2885, _3009, _3023);
    float _3027 = fma(_2991, _2969, _3015);
    float _3029 = _2901 * 0.15915493667125701904296875;
    float _3031 = fma(_2995, _2969, _3017);
    float _3033 = _2579 * 0.15915493667125701904296875;
    float _3035 = _3025 * _3027;
    float _3037 = _3021 * _3027;
    float _3039 = fma(_2977, _2969, _3001);
    float _3041 = _3033 * 6.283185482025146484375;
    float _3043 = cos(_3041);
    float _3045 = fma(_3003, _3031, _3035);
    float _3047 = fma(_3009, _3031, _3037);
    float _3049 = _2983 * _3025;
    float _3051 = _2991 * _3025;
    float _3053 = fma(_2881, _3039, _3045);
    float _3055 = fma(_2883, _3039, _3047);
    float _3057 = _3029 * 6.283185482025146484375;
    float _3059 = sin(_3057);
    float _3061 = _2581 + _3053;
    float _3063 = _2583 + _3055;
    float _3065 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3067 = _3061 + _3065;
    float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3071 = _3063 + _3069;
    float _3073 = _3033 * 6.283185482025146484375;
    float _3075 = sin(_3073);
    float _3077 = _3067 * _3067;
    float _3079 = _3071 * _3071;
    float _3081 = _3077 + _3079;
    float _3083 = -_2397;
    float _3085 = fma(_3059, _3043, _3083);
    float _3087 = _2881 * _3009;
    float _3089 = fma(_2391, _3085, _2397);
    float _3091 = -_3087;
    float _3093 = fma(_2883, _3003, _3091);
    float _3095 = -_2399;
    float _3097 = fma(_3059, _3075, _3095);
    float _3099 = _3093 * _3027;
    float _3101 = _3089;
    float _3103 = _3077;
    float _3105 = _3079;
    float _3107 = _3061;
    float _3109 = _3063;
    float _3111 = _3071;
    if (!_2929)
    {
        float _3113 = fma(_2461, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3089);
        _3101 = _3113;
    }
    float _3115 = _3101;
    float _3117 = _2983 * _3093;
    float _3119 = fma(_2391, _3097, _2399);
    float _3121 = _2983 * _3021;
    float _3123 = sqrt(_3081);
    float _3125 = fma(_2987, _3003, _3049);
    float _3127 = _3119;
    if (!_2929)
    {
        float _3129 = fma(_2469, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3119);
        _3127 = _3129;
    }
    float _3131 = _3127;
    float _3133 = fma(_2987, _3009, _3121);
    float _3135 = _2973 * _3021;
    float _3137 = _2991 * _3021;
    float _3139 = fma(_3005, _3031, _3099);
    float _3141 = fma(_2987, _3005, _3117);
    float _3143 = _2973 * _3025;
    float _3145 = _2973 * _3093;
    float _3147 = fma(_2885, _3039, _3139);
    float _3149 = fma(_2981, _3009, _3135);
    float _3151 = _2991 * _3093;
    float _3153 = fma(_2981, _3003, _3143);
    float _3155 = _2725 + _3147;
    float _3157 = fma(_2981, _3005, _3145);
    bool _3159 = _3123 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3161 = fma(_2995, _3003, _3051);
    float _3163 = fma(_2979, _2881, _3125);
    float _3165 = fma(_2979, _2885, _3141);
    float _3167 = fma(_2995, _3005, _3151);
    float _3169 = fma(_2995, _3009, _3137);
    float _3171 = fma(_2979, _2883, _3133);
    if (!_3159)
    {
        _2747 = _3155;
    }
    float _3173 = _2747;
    bool _3175 = !_3159;
    float _3177 = _3173;
    if (!_3175)
    {
        float _3179 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3181 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3183 = _3123 + _3181;
        float _3185 = rsqrt(_3081);
        float _3187 = _3183 * _3179;
        float _3189 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3191 = _3187 * 0.15915493667125701904296875;
        float _3193 = _3191 * 6.283185482025146484375;
        float _3195 = sin(_3193);
        float _3197 = _3191 * 6.283185482025146484375;
        float _3199 = cos(_3197);
        float _3201 = fma(_3195, _3189, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3203 = _3185 * _3201;
        float _3205 = _3199 + (-1.0);
        float _3207 = _3067 * _3203;
        float _3209 = _3071 * _3203;
        float _3211 = _3205 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3213 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3215 = _3207 * _3207;
        float _3217 = _3209 * _3209;
        float _3219 = fma(_3155, _3199, _3211);
        float _3221 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        _3177 = _3219;
        _3103 = _3215;
        _3105 = _3217;
        _3107 = _3213;
        _3109 = _3221;
        _3111 = _3209;
    }
    float _3223 = _3177;
    float _3225 = _3103;
    float _3227 = _3105;
    float _3229 = _3107;
    float _3231 = _3109;
    float _3233 = _3111;
    float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3237 = _3223 + _3235;
    float _3239 = -_2963;
    float _3241 = fma(_3239, _2881, _3153);
    float _3243 = -_2963;
    float _3245 = fma(_3243, _2885, _3157);
    float _3247 = -_2963;
    float _3249 = fma(_3247, _2883, _3149);
    float _3251 = fma(_3237, _3237, _3225);
    float _3253 = _3163 * _2959;
    float _3255 = _3165 * _2959;
    float _3257 = _3171 * _2959;
    float _3259 = _3251 + _3227;
    float _3261 = fma(_2977, _2881, _3161);
    float _3263 = fma(_2977, _2885, _3167);
    float _3265 = fma(_2977, _2883, _3169);
    float _3267 = fma(_3241, _3115, _3253);
    float _3269 = fma(_3245, _3115, _3255);
    float _3271 = sqrt(_3259);
    float _3273 = fma(_3249, _3115, _3257);
    float _3275 = fma(_3261, _3131, _3267);
    float _3277 = fma(_3263, _3131, _3269);
    out.m_73.x = _2285;
    out.m_73.y = _2235;
    out.m_73.z = _2239;
    out.m_73.w = _2243;
    float _3279 = fma(_3265, _3131, _3273);
    out.m_75.x = _3275;
    out.m_75.y = _3277;
    out.m_75.z = _3279;
    bool _3281 = _3271 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3283 = isnan(_3271);
    bool _3285 = _3281 || _3283;
    bool _3287 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3289 = _3285 || _3287;
    float _3291 = _3237;
    float _3293 = _3245;
    float _3295 = _3233;
    if (!_3289)
    {
        _2955 = 1.0;
    }
    float _3297 = _2955;
    bool _3299 = !_3289;
    float _3301 = _3297;
    if (!_3299)
    {
        bool _3303 = _3271 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3305 = isnan(_3271);
        bool _3307 = _3303 || _3305;
        bool _3309 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3311 = _3307 || _3309;
        if (!_3311)
        {
            float _3313 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3315 = _3271 + _3313;
            float _3317 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3319 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3317;
            float _3321 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3323 = _3321 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3325 = 1.0 / _3319;
            float _3327 = _3315 * _3325;
            float _3329 = fma(_3327, _3323, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3301 = _3329;
            _3331 = true;
        }
        else
        {
            bool _3333 = _3271 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3335 = isnan(_3271);
            bool _3337 = _3333 || _3335;
            bool _3339 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3341 = _3337 || _3339;
            if (!_3341)
            {
                float _3343 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3345 = _3271 + _3343;
                float _3347 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3349 = _3347 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3351 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3353 = _3351 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3355 = 1.0 / _3349;
                float _3357 = _3345 * _3355;
                float _3359 = fma(_3357, _3353, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3301 = _3359;
                _3331 = true;
            }
            else
            {
                _3301 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3331 = false;
    float _3361 = _3301;
    float _3363 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3365 = _3223 + _3363;
    float _3367 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3369 = _3229 + _3367;
    float _3371 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3373 = _3231 + _3371;
    float _3375 = fma(_3365, _3361, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3377 = fma(_3369, _3361, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3379 = fma(_3373, _3361, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3381 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3383 = _3375 + _3381;
    float _3385 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3387 = _3377 + _3385;
    float _3389 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3391 = _3379 + _3389;
    float _3393 = _3383 * _3383;
    float _3395 = fma(_3387, _3387, _3393);
    float _3397 = fma(_3391, _3391, _3395);
    float _3399 = rsqrt(_3397);
    float _3401 = _3399 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3403 = _3387 * _3401;
    float _3405 = _3391 * _3401;
    float _3407 = _3403 * _3403;
    float _3409 = _3405 * _3405;
    float _3411 = _3407 + _3409;
    float _3413 = sqrt(_3411);
    bool _3415 = _3413 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3417 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3419 = _3413 + _3417;
    float _3421 = _3399;
    float _3423 = _3419;
    float _3425 = _3383;
    float _3427 = _3403;
    if (_3415)
    {
        float _3429 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3421 = _3429;
    }
    float _3431 = _3421;
    if (_3415)
    {
        float _3433 = rsqrt(_3411);
        _3291 = _3433;
    }
    float _3435 = _3291;
    float _3437 = _3435;
    if (_3415)
    {
        float _3439 = _3419 * _3431;
        _3423 = _3439;
    }
    float _3441 = _3423;
    float _3443 = _3375 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3415)
    {
        float _3445 = _3441 * 0.15915493667125701904296875;
        _3293 = _3445;
    }
    float _3447 = _3293;
    float _3449 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3443);
    float _3451 = _3391;
    if (_3415)
    {
        float _3453 = _3447 * 6.283185482025146484375;
        float _3455 = sin(_3453);
        _3451 = _3455;
    }
    float _3457 = _3451;
    float _3459 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3461 = precise::max(0.0, _3459);
    float _3463 = _3431;
    float _3465 = _3461;
    if (_3415)
    {
        float _3467 = _3447 * 6.283185482025146484375;
        float _3469 = cos(_3467);
        _3463 = _3469;
    }
    float _3471 = _3463;
    float _3473 = -_3401;
    float _3475 = -_3461;
    float _3477 = fma(_3383, _3473, _3475);
    if (_3415)
    {
        float _3479 = _3477 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3425 = _3479;
    }
    float _3481 = _3425;
    float _3483 = sqrt(_3397);
    float _3485 = _3481;
    float _3487 = _3457;
    if (_3415)
    {
        float _3489 = fma(_3457, _3481, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3485 = _3489;
    }
    float _3491 = _3485;
    float _3493 = _3491;
    if (!_3415)
    {
        _3487 = _3405;
    }
    float _3495 = _3487;
    float _3497 = _3495;
    if (_3415)
    {
        float _3499 = _3471 + (-1.0);
        _3465 = _3499;
    }
    float _3501 = _3465;
    float _3503 = _3501;
    if (_3415)
    {
        float _3505 = _3435 * _3491;
        _3295 = _3505;
    }
    float _3507 = _3295;
    if (!_3415)
    {
        _3437 = _3477;
    }
    float _3509 = _3437;
    float _3511 = _3509;
    if (_3415)
    {
        float _3513 = _3501 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3503 = _3513;
    }
    float _3515 = _3503;
    float _3517 = _3515;
    if (_3415)
    {
        float _3519 = _3403 * _3507;
        _3427 = _3519;
    }
    float _3521 = _3427;
    if (!_3415)
    {
        _3493 = _3407;
    }
    float _3523 = _3493;
    float _3525 = _3523;
    if (_3415)
    {
        float _3527 = _3405 * _3507;
        _3497 = _3527;
    }
    float _3529 = _3497;
    if (_3415)
    {
        float _3531 = fma(_3477, _3471, _3515);
        _3511 = _3531;
    }
    float _3533 = _3511;
    if (_3415)
    {
        float _3535 = _3521 * _3521;
        _3525 = _3535;
    }
    float _3537 = _3525;
    if (!_3415)
    {
        _3517 = _3409;
    }
    float _3539 = _3517;
    float _3541 = _3539;
    if (_3415)
    {
        float _3543 = _3529 * _3529;
        _3541 = _3543;
    }
    float _3545 = _3541;
    float _3547 = fma(_3533, _3533, _3537);
    float _3549 = _3547 + _3545;
    float _3551 = _3375 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3553 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3555 = fma(_3483, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3553);
    float _3557 = precise::clamp(_3555, 0.0, 1.0);
    float _3559 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3561 = rsqrt(_3549);
    float _3563 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3551);
    float _3565 = _3375 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3567 = -_3557;
    float _3569 = _3567 + 1.0;
    float _3571 = fma(_3379, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3563);
    float _3573 = _3375 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3575 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3565);
    float _3577 = _3571 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3579 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3573);
    float _3581 = abs(_3569);
    float _3583 = log2(_3581);
    float _3585 = fma(_3379, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3575);
    float _3587 = _3577 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3589 = fma(_3379, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3579);
    float _3591 = _3585 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3593 = _3561 * _3521;
    float _3595 = -_3587;
    float _3597 = fma(_3595, _3559, 1.0);
    float _3599 = _3589 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3601 = _3591 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3603 = fma(_3379, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3449);
    float _3605 = _3561 * _3533;
    float _3607 = _3593 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3609 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3601);
    float _3611 = _3561 * _3529;
    float _3613 = _3603 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3615 = _3583 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3617 = -_3607;
    float _3619 = fma(_3605, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3617);
    float _3621 = fma(_3577, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3609);
    float _3623 = log2(_3597);
    float _3625 = _3591 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3627 = -_3611;
    float _3629 = fma(_3627, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3619);
    float _3631 = fma(_3613, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3621);
    float _3633 = _3591 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3635 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3625);
    float _3637 = fma(_3629, -0.5, 0.5);
    float _3639 = fma(_3629, 0.5, 0.5);
    float _3641 = exp2(_3615);
    float _3643 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3633);
    float _3645 = _3605 + 1.0;
    float _3647 = fma(_3639, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3649 = fma(_3577, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3643);
    float _3651 = fma(_3639, _3647, -0.212114393711090087890625);
    float _3653 = 1.0 / _3631;
    float _3655 = fma(_3577, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3635);
    float _3657 = _3623 * 0.693147182464599609375;
    float _3659 = fma(_3639, _3651, 1.570728778839111328125);
    float _3661 = sqrt(_3637);
    float _3663 = -_3605;
    float _3665 = fma(_3641, _3645, _3663);
    float _3667 = fma(_3613, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3649);
    float _3669 = fma(_3613, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3655);
    float _3671 = fma(_3665, 0.5, 0.5);
    float _3673 = _3667 * _3653;
    float _3675 = _3669 * _3653;
    float _3677 = _3657 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3679 = fma(_3673, 0.5, 0.5);
    float _3681 = fma(_3675, -0.5, 0.5);
    float _3683 = _3661 * 0.636619746685028076171875;
    float3 _9148 = float3(_3679, _3681, _3677);
    float _3685 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9148, float3(0.0), isnan(_9148)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9148, float3(0.0), isnan(_9148)), level(0.0)).x;
    float3 _9159 = float3(_3679, _3681, _3677);
    float4 _3687 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9159, float3(0.0), isnan(_9159)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9159, float3(0.0), isnan(_9159)), level(0.0)).xyzw;
    float _3689 = _3687.x;
    float _3691 = _3687.y;
    float _3693 = _3687.z;
    float _3695 = _3687.w;
    float _3697 = -_3659;
    float _3699 = fma(_3683, _3697, 1.0);
    float2 _9180 = float2(_3699, _3671);
    float3 _3703 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9180, float2(0.0), isnan(_9180)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9180, float2(0.0), isnan(_9180)), level(0.0)).xyz;
    float _3705 = _3703.x;
    float _3707 = _3703.y;
    float _3709 = _3703.z;
    float _3711 = _3583 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3713 = _3591 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_77.x = _3377;
    out.m_77.y = _3375;
    out.m_77.z = _3379;
    float _3715 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3713);
    float _3717 = exp2(_3711);
    float _3719 = fma(_3577, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3715);
    float _3721 = fma(_3613, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3719);
    float _3723 = _3721 + _3631;
    out.gl_Position.x = _3667;
    out.gl_Position.y = _3669;
    out.gl_Position.z = _3721;
    out.gl_Position.w = _3631;
    float _3725 = _3723 * 0.5;
    float _3727 = -_3717;
    float _3729 = _3727 + 1.0;
    float _3731 = _3729 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3733 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.z = _3725;
    out.m_79.w = _3631;
    out.m_49.x = _3733;
    float _3735 = _3731 * _3685;
    float _3737 = -_3731;
    float _3739 = _3737 + 1.0;
    float _3741 = _3695 * _3735;
    float _3743 = _3709 * _3735;
    float _3745 = fma(_3705, _3741, _3689);
    float _3747 = fma(_3707, _3741, _3691);
    float _3749 = _3695 * _3739;
    float _3751 = fma(_3695, _3743, _3693);
    out.m_81.x = _3745;
    out.m_81.y = _3747;
    out.m_81.z = _3751;
    out.m_81.w = _3749;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3331 = false;
    bool _2503 = false;
    bool _2315 = false;
    bool _829 = false;
    bool _707 = false;
    bool _535 = false;
    bool _309 = false;
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
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_109)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3807 = as_type<float>(_119);
        out.gl_Position.z = _3807;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_51.w;
    float _125 = float(_105);
    float _127 = in.m_53.x;
    float _129 = 1.0 / _125;
    float _131 = -_123;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_123);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = _133 * _129;
    bool _147 = _133 >= _125;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    out.m_55.x = _127;
    out.m_57.x = _145;
    float _153 = _123;
    float _155 = _133;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _153;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _159 = _157 * 5.0;
        _121 = as_type<int>(_159);
    }
    int _161 = _121;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3883 = as_type<float>(_161);
        out.gl_Position.z = _3883;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = in.m_59.x;
    float _165 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = in.m_59.y;
    bool _169 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _171 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _173 = _169 || _171;
    bool _175 = isnan(1.0);
    bool _177 = _173 || _175;
    float _179 = in.m_61.w;
    float _181 = in.m_51.x;
    float _183 = in.m_51.y;
    float _185 = in.m_51.z;
    float _187 = in.m_46.x;
    float _189 = in.m_46.y;
    float _191 = in.m_46.z;
    float _193 = 0.0;
    float _195 = _165;
    if (!_177)
    {
        float _197 = _165 * _165;
        float _199 = _197 * 0.5;
        _193 = _199;
    }
    float _201 = _193;
    float _203 = _201;
    if (!_177)
    {
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _205;
    }
    float _207 = _203;
    out.m_63.x = _163;
    out.m_63.y = _167;
    bool _209 = !_177;
    float _211 = _207;
    float _213 = _163;
    if (!_209)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _165 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _165);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _211 = _243;
    }
    float _245 = _211;
    bool _247 = !_177;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _165 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _195 = _267;
    }
    float _269 = _195;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _273 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _275 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _277 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _279 = fma(_269, _181, _273);
    float _281 = fma(_269, _183, _275);
    float _283 = fma(_269, _185, _277);
    float _285 = fma(_279, _179, _187);
    float _287 = fma(_281, _179, _189);
    float _289 = fma(_283, _179, _191);
    bool _291 = !_271;
    float _307;
    if (!_291)
    {
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _295 = _127 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        _307 = _145;
    }
    _309 = false;
    float _311 = _307;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _315 = _311 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _311 + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _323 = _311 + _321;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _333;
    float _337 = 1.0 / _327;
    bool _339 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _341 = isnan(_311);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = 1.0 / _331;
    bool _353 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _355 = isnan(_311);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    bool _365 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _367 = -_363;
    float _369 = _367 + 1.0;
    float _371 = 1.0 / _335;
    float _373 = _315 * _337;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = fma(_377, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _381 = _319 * _351;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _387;
    float _391 = fma(_385, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _393 = fma(_389, _373, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _399 = _323 * _371;
    bool _401 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _403 = isnan(_311);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    bool _413 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _415 = isnan(_311);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _429 = _411 * _369;
    float _431 = -_411;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _439 = -_423;
    float _441 = _439 + 1.0;
    float _443 = fma(_397, _381, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _445 = _423 * _433;
    float _447 = fma(_437, _381, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _449 = _349 * _441;
    float _451 = in.m_61.x;
    float _453 = in.m_61.y;
    float _455 = in.m_61.z;
    float _457 = fma(_427, _381, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _459 = _379 * _449;
    float _461 = _391 * _449;
    float _463 = -_349;
    float _465 = _463 + 1.0;
    float _467 = _393 * _449;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _473;
    float _477 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].x, _459);
    float _479 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].y, _461);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _481;
    float _485 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[143].z, _467);
    float _487 = fma(_471, _399, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _489 = fma(_475, _399, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _491 = fma(_483, _399, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _493 = fma(_457, _445, _477);
    float _495 = fma(_443, _445, _479);
    float _497 = fma(_447, _445, _485);
    float _499 = fma(_487, _429, _493);
    float _501 = fma(_489, _429, _495);
    float _503 = fma(_491, _429, _497);
    float _505 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].x, _499);
    float _507 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].y, _501);
    float _509 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[146].z, _503);
    float _511 = _505 * _451;
    float _513 = _507 * _453;
    float _515 = _509 * _455;
    bool _517 = !_365;
    float _533;
    if (!_517)
    {
        float _519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _521 = _127 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _523 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _525 = _523 * _519;
        float _527 = floor(_525);
        float _529 = -_527;
        float _531 = _525 + _529;
        _533 = _531;
        _535 = true;
    }
    else
    {
        _533 = _145;
    }
    _535 = false;
    float _537 = _533;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _541 = _537 + _539;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _547 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _549 = isnan(_537);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _567 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _569 = isnan(_537);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = 1.0 / _545;
    float _581 = -_557;
    float _583 = _581 + 1.0;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _585;
    bool _589 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _591 = isnan(_537);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = _577 * _583;
    float _603 = -_577;
    float _605 = _603 + 1.0;
    bool _607 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _609 = 1.0 / _561;
    float _611 = _599 * _605;
    float _613 = -_599;
    float _615 = _613 + 1.0;
    float _617 = 1.0 / _565;
    float _619 = _587 * _579;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _625 = fma(_619, _541, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _627 = _537 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _629 = isnan(_537);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = _623 * _609;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _641;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _647 = _537 + _645;
    float _649 = _625 * _611;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _653 = _537 + _651;
    float _655 = fma(_639, _647, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _657 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[115].x, _649);
    float _659 = _643 * _617;
    float _661 = -_637;
    float _663 = _661 + 1.0;
    float _665 = fma(_655, _601, _657);
    float _667 = fma(_659, _653, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _669 = _557 * _663;
    float _671 = fma(_667, _669, _665);
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _679 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[118].x, _671);
    float _681 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _683 = _675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _679 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_65.x = _681;
    out.m_65.y = _683;
    out.m_65.z = _685;
    out.m_65.w = _687;
    bool _689 = !_607;
    float _705;
    if (!_689)
    {
        float _691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _693 = _127 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _695 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _697 = _695 * _691;
        float _699 = floor(_697);
        float _701 = -_699;
        float _703 = _697 + _701;
        _705 = _703;
        _707 = true;
    }
    else
    {
        _705 = _145;
    }
    _707 = false;
    float _709 = _705;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _713 = _709 + _711;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _719 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _721 = isnan(_709);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _735 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _737 = isnan(_709);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _747;
    bool _751 = _709 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _753 = isnan(_709);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = 1.0 / _717;
    float _765 = -_729;
    float _767 = _765 + 1.0;
    bool _769 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _771 = _745 * _767;
    float _773 = -_745;
    float _775 = _773 + 1.0;
    float _777 = 1.0 / _733;
    float _779 = _749 * _763;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _785 = fma(_779, _713, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _787 = -_761;
    float _789 = _787 + 1.0;
    float _791 = _785 * _771;
    float _793 = _783 * _777;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _797 = _709 + _795;
    float _799 = _729 * _789;
    float _801 = fma(_775, (*spvDescriptorSet0.vp_c9)._m0[131].x, _791);
    float _803 = fma(_793, _797, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _805 = fma(_803, _799, _801);
    float _807 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[133].x, _805);
    float _809 = _807 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_67.w = _809;
    bool _811 = !_769;
    float _827;
    if (!_811)
    {
        float _813 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _815 = _127 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _817 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[14].x, _133);
        float _819 = _817 * _813;
        float _821 = floor(_819);
        float _823 = -_821;
        float _825 = _819 + _823;
        _827 = _825;
        _829 = true;
    }
    else
    {
        _827 = _145;
    }
    _829 = false;
    float _831 = _827;
    int _833 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _835 = _833;
    int _837 = 0;
    int _839 = _96(_835, _837, (*spvDescriptorSet0.support_buffer));
    float _841 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _843 = int(_841);
    float _845 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _847 = int(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _857;
    float _861 = float(_843);
    float _863 = 1.0 / _851;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _877 = float(uint(_847));
    float _879 = 1.0 / _861;
    float _881 = 1.0 / _877;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _887 = _867 * _863;
    float _889 = _133 * _879;
    float _891 = 1.0 / _875;
    int _893 = as_type<int>(_881) + (-2);
    float _895 = trunc(_889);
    int _897 = int(_895);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _907 = ~_847;
    int _909 = _907 + 1;
    float _911 = 1.0 / _885;
    float _913 = _859 * _891;
    float _915 = float(uint(_897));
    float _917 = 1.0 / _901;
    float _919 = as_type<float>(_893) * _915;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _925 = 1.0 / _905;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _929 = _927 != 0;
    float _931 = _871 * _911;
    float _933 = in.m_53.y;
    float _935 = trunc(_919);
    float _937 = precise::max(_935, 0.0);
    uint _940 = uint(_937);
    float _942 = _901;
    int _944 = as_type<int>(_863);
    int _946 = as_type<int>(_891);
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _950 = _917;
    int _952 = as_type<int>(_911);
    if (_929)
    {
        float _954 = in.m_53.z;
        _942 = _954;
    }
    float _956 = _942;
    bool _958 = false;
    if (_929)
    {
        _958 = false;
    }
    bool _960 = _958;
    float _962 = 1.0 / _923;
    bool _964 = _960;
    if (_929)
    {
        _944 = as_type<int>(_127);
    }
    int _966 = _944;
    int _968 = _909 * int(_940);
    int _970 = _968 + _897;
    float _972 = 1.0 / _855;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _974;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _982 = _966;
    if (_929)
    {
        _946 = as_type<int>(_933);
    }
    int _984 = _946;
    float _986 = float(uint(_970));
    float _988 = _976 * _925;
    float _990 = _980 * _962;
    float _992 = as_type<float>(_893) * _986;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _998 = _984;
    if (_929)
    {
        _948 = _127;
    }
    float _1000 = _948;
    float _1002 = trunc(_992);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    float _1008 = _996 * _917;
    float _1010 = _1000;
    if (_929)
    {
        _950 = 1.0;
    }
    float _1012 = _950;
    float _1014 = _1012;
    float _1016 = _956;
    if (_929)
    {
        _952 = as_type<int>(_956);
    }
    int _1018 = _952;
    int _1020 = _1018;
    if (!_929)
    {
        float _1022 = in.m_53.z;
        float _1024 = _127 * 3.1415927410125732421875;
        float _1026 = _933 * 3.1415927410125732421875;
        float _1028 = _1024 * 0.15915493667125701904296875;
        float _1030 = _1026 * 0.15915493667125701904296875;
        float _1032 = _1028 * 6.283185482025146484375;
        float _1034 = sin(_1032);
        float _1036 = _1030 * 6.283185482025146484375;
        float _1038 = sin(_1036);
        float _1040 = _1022 * 3.1415927410125732421875;
        float _1042 = _1040 * 0.15915493667125701904296875;
        float _1044 = _1042 * 6.283185482025146484375;
        float _1046 = sin(_1044);
        _1010 = _933;
        _1014 = 1.2345600128173828125;
        _964 = true;
        _998 = as_type<int>(_1038);
        _982 = as_type<int>(_1034);
        _1020 = as_type<int>(_1046);
        _1016 = _1022;
    }
    float _1048 = _1010;
    float _1050 = _1014;
    bool _1052 = _964;
    int _1054 = _998;
    int _1056 = _982;
    int _1058 = _1020;
    float _1060 = _1016;
    float _1062 = _1048 * _1050;
    int _1064 = ~_847;
    int _1066 = _1064 + 1;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1070 = _831 + _1068;
    int _1072 = int(_940) + int(_1006);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1076 = _831 + _1074;
    float _1078 = float(_847);
    float _1080 = floor(_1062);
    float _1082 = float(_897);
    int _1084 = _1066 * _1072;
    int _1086 = _1084 + _897;
    float _1088 = _133 * _1078;
    float _1090 = fma(_913, _1076, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1092 = fma(_887, _1070, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1094 = uint(_1086) >= uint(_847);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1096;
    bool _1100 = _1082 >= _1078;
    bool _1102 = isnan(_1082);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(_1078);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    bool _1112 = !_1094;
    int _1114 = _1112 ? 0 : (-1);
    float _1116 = _1098 * _972;
    float _1118 = _1088 * _129;
    bool _1120 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1122 = isnan(_831);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = trunc(_1110);
    int _1134 = int(_1132);
    bool _1136 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1138 = isnan(_831);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1144 = _1140 || _1142;
    float _1146 = float(_1144);
    float _1148 = -_1080;
    float _1150 = _1062 + _1148;
    int _1152 = ~_1072;
    int _1154 = _1152 + _1114;
    int _1156 = _1154 + 1;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1160 = _1158 != 0;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1168 = _1166 != 0;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1172 = _1170 != 0;
    float _1174 = -_1130;
    float _1176 = _1174 + 1.0;
    bool _1178 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1180 = isnan(_831);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = -_1146;
    float _1192 = _1190 + 1.0;
    int _1194 = _847 * _1156;
    int _1196 = _1194 + _897;
    bool _1198 = _847 == 0;
    float _1200 = _1146 * _1176;
    float _1202 = _1188 * _1192;
    bool _1204 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1206 = isnan(_831);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1212 = _1208 || _1210;
    float _1214 = float(_1212);
    float _1216 = _1150 * _1078;
    bool _1218 = !_1198;
    int _1220 = _1218 ? _1196 : (-1);
    float _1222 = -_1188;
    float _1224 = _1222 + 1.0;
    int _1226 = ~_1134;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    float _1232 = _1214 * _1224;
    bool _1234 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1236 = isnan(_831);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1242 = _1238 || _1240;
    float _1244 = float(_1242);
    int _1246 = _1220 * _1230;
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1250 = _1248 != 0;
    float _1252 = -_1214;
    float _1254 = _1252 + 1.0;
    bool _1256 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1258 = isnan(_831);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1264 = _1260 || _1262;
    float _1266 = float(_1264);
    float _1268 = -_1244;
    float _1270 = _1268 + 1.0;
    float _1272 = trunc(_1216);
    int _1274 = int(_1272);
    bool _1276 = !_1250;
    int _1278 = _1276 ? 0 : 1;
    float _1280 = _1244 * _1254;
    float _1282 = _1266 * _1270;
    bool _1284 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1286 = isnan(_831);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    float _1296 = -_1266;
    float _1298 = _1296 + 1.0;
    bool _1300 = !_1164;
    int _1302 = _1300 ? 0 : 1;
    int _1304 = abs(_1278);
    float _1306 = _1294 * _1298;
    float _1308 = trunc(_1118);
    int _1310 = int(_1308);
    int _1312 = _847 + (-1);
    float _1314 = -_1294;
    float _1316 = _1314 + 1.0;
    int _1318 = abs(_1302);
    float _1320 = _1090 * _1306;
    int _1322 = _1134 * _1312;
    int _1324 = _1322 + _1246;
    bool _1326 = !_1160;
    int _1328 = _1326 ? 0 : 1;
    int _1330 = _1274 * _1304;
    int _1332 = _1330 + _897;
    bool _1334 = !_1168;
    int _1336 = _1334 ? 0 : 1;
    int _1338 = abs(_1328);
    int _1340 = _1324 * _1318;
    bool _1342 = !_1172;
    int _1344 = _1342 ? 0 : 1;
    int _1346 = abs(_1336);
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1350 = _831 + _1348;
    int _1352 = abs(_1344);
    int _1354 = _1310 * _1338;
    int _1356 = _1354 + _1340;
    float _1358 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1320);
    float _1360 = fma(_931, _1350, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _1362 = _1332 * _1346;
    int _1364 = _1362 + _1356;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1368 = _831 + _1366;
    float _1370 = fma(_1092, _1282, _1358);
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1374 = _831 + _1372;
    int _1376 = _1274 * _1352;
    int _1378 = _1376 + _1364;
    float _1380 = fma(_1008, _1368, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1382 = fma(_1360, _1280, _1370);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1386 = _831 + _1384;
    float _1388 = fma(_988, _1374, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1390 = float(uint(_1378));
    float _1392 = fma(_1380, _1232, _1382);
    bool _1394 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1396 = isnan(_831);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1402 = _1398 || _1400;
    float _1404 = float(_1402);
    float _1406 = in.m_59.z;
    float _1408 = fma(_990, _1386, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1410 = as_type<float>(_893) * _1390;
    float _1412 = fma(_1388, _1202, _1392);
    float _1414 = -_1404;
    float _1416 = _1414 + 1.0;
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1420 = _831 + _1418;
    int _1422 = _839 + (-1);
    float _1424 = fma(_1408, _1200, _1412);
    float _1426 = _1130 * _1416;
    float _1428 = fma(_1116, _1420, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1430 = trunc(_1410);
    float _1432 = precise::max(_1430, 0.0);
    uint _1434 = uint(_1432);
    float _1436 = float(_1422);
    float _1438 = fma(_1428, _1426, _1424);
    int _1440 = ~_847;
    int _1442 = _1440 + 1;
    int _1444 = ~_847;
    int _1446 = _1444 + 1;
    float _1448 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1438);
    float _1450 = precise::clamp(_1448, 0.0, 1.0);
    float _1452 = _1450 * _1436;
    float _1454 = trunc(_1406);
    int _1456 = int(_1454);
    int _1458 = _1442 * int(_1434);
    int _1460 = _1458 + _1378;
    float _1462 = float(uint(_1460));
    float _1464 = trunc(_1452);
    int _1466 = int(_1464);
    float _1468 = as_type<float>(_893) * _1462;
    float _1470 = trunc(_1468);
    float _1472 = precise::max(_1470, 0.0);
    uint _1474 = uint(_1472);
    int _1476 = _1466;
    int _1478 = 0;
    int _1480 = _97(_1476, _1478, (*spvDescriptorSet0.support_buffer));
    int _1482 = _1456;
    int _1484 = 0;
    int _1486 = _97(_1482, _1484, (*spvDescriptorSet0.support_buffer));
    float4 _1489 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1480, _1486)), 0).xyzw;
    float _1491 = _1489.x;
    float _1493 = _1489.y;
    float _1495 = _1489.z;
    float _1497 = _1489.w;
    int _1499 = ~_847;
    int _1501 = _1499 + 1;
    float _1503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1505 = ~_847;
    int _1507 = _1505 + 1;
    float _1509 = -_167;
    float _1511 = _1509 + 1.0;
    float _1513 = _1052 ? as_type<float>(_1054) : as_type<float>(_1056);
    int _1515 = int(_1434) + int(_1474);
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1519 = _1052 ? as_type<float>(_1058) : as_type<float>(_1054);
    float _1521 = as_type<float>(_1054);
    int _1523 = _1356;
    float _1525 = _1060;
    if (_1052)
    {
        _1521 = _933;
    }
    float _1527 = _1521;
    int _1529 = _1446 * _1515;
    int _1531 = _1529 + _1378;
    float _1533 = float(uint(_1332));
    float _1535 = _1527;
    if (!_1052)
    {
        _1535 = _127;
    }
    float _1537 = _1535;
    float _1539 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1541 = uint(_1531) >= uint(_847);
    float _1543 = as_type<float>(_893) * _1533;
    float _1545 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1547 = !_1541;
    int _1549 = _1547 ? 0 : (-1);
    float _1551 = trunc(_1543);
    float _1553 = precise::max(_1551, 0.0);
    uint _1555 = uint(_1553);
    int _1557 = ~_1515;
    int _1559 = _1557 + _1549;
    int _1561 = _1559 + 1;
    int _1563 = _847 * _1561;
    int _1565 = _1563 + _1378;
    bool _1567 = !_1198;
    int _1569 = _1567 ? _1565 : (-1);
    int _1571 = _1501 * int(_1555);
    int _1573 = _1571 + _1332;
    int _1575 = _1569 >> 31;
    int _1577 = _1569 & 3;
    bool _1579 = _1577 != 0;
    int _1581 = _1575 & 3;
    float _1583 = float(uint(_1573));
    int _1585 = _1569 + _1581;
    int _1587 = _1569 & 3;
    bool _1589 = _1587 != 0;
    float _1591 = as_type<float>(_893) * _1583;
    int _1593 = _1585 >> 2;
    bool _1595 = uint(_1587) > 1u;
    float _1597 = trunc(_1591);
    float _1599 = precise::max(_1597, 0.0);
    uint _1601 = uint(_1599);
    int _1603 = _1593 << 4;
    int _1605 = _1603 + 512;
    int _1607 = _1579 ? 0 : 1;
    uint _1609 = uint(int(uint(_1605) >> uint(2)));
    uint _1611 = uint(int(uint(int(_1609)) >> uint(2)));
    int _1613 = int(_1609) & 3;
    float _1615 = (*spvDescriptorSet0.vp_c9)._m0[int(_1611)][_1613];
    int _1617 = int(_1609) + 1;
    uint _1619 = uint(int(uint(_1617) >> uint(2)));
    int _1621 = _1617 & 3;
    float _1623 = (*spvDescriptorSet0.vp_c9)._m0[int(_1619)][_1621];
    bool _1625 = uint(_1587) >= 2u;
    bool _1627 = _1587 != 3;
    int _1629 = _1605 + 8;
    uint _1631 = uint(int(uint(_1629) >> uint(2)));
    uint _1633 = uint(int(uint(int(_1631)) >> uint(2)));
    int _1635 = int(_1631) & 3;
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[int(_1633)][_1635];
    int _1639 = int(_1631) + 1;
    uint _1641 = uint(int(uint(_1639) >> uint(2)));
    int _1643 = _1639 & 3;
    float _1645 = (*spvDescriptorSet0.vp_c9)._m0[int(_1641)][_1643];
    int _1647 = int(_1555) + int(_1601);
    int _1649 = ~_1607;
    int _1651 = _1649 + 1;
    int _1653 = _1651 + 1;
    int _1655 = _1653;
    bool _1657 = _1627;
    float _1659 = _1539;
    if (!_1595)
    {
        int _1661 = ~_1607;
        int _1663 = _1661 + 1;
        _1655 = _1663;
    }
    int _1665 = _1655;
    int _1667 = _1507 * _1647;
    int _1669 = _1667 + _1332;
    int _1671 = _1625 ? 0 : 1;
    int _1673 = abs(_1665);
    bool _1675 = uint(_1669) >= uint(_847);
    int _1677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1679 = _1677 != 0;
    bool _1681 = !_1675;
    int _1683 = _1681 ? 0 : (-1);
    int _1685 = ~_1647;
    int _1687 = _1685 + _1683;
    int _1689 = _1687 + 1;
    int _1691 = ~_1673;
    int _1693 = _1691 + 1;
    int _1695 = _1693 + 1;
    bool _1697 = !_1589;
    int _1699 = _1697 ? 0 : 1;
    int _1701 = ~_1671;
    int _1703 = _1701 + 1;
    int _1705 = _1703 + 1;
    int _1707 = abs(_1699);
    int _1709 = _1705;
    float _1711 = as_type<float>(_1707);
    if (_1627)
    {
        int _1713 = ~_1671;
        int _1715 = _1713 + 1;
        _1709 = _1715;
    }
    int _1717 = _1709;
    int _1719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1721 = _1719 != 0;
    if (_1679)
    {
        bool _1723 = _127 > 0.5;
        _1657 = _1723;
    }
    bool _1725 = _1657;
    if (!_1679)
    {
        _1711 = _163;
    }
    float _1727 = _1711;
    int _1729 = _1695 * as_type<int>(_1623);
    int _1731 = as_type<int>(_1623);
    float _1733 = _1727;
    if (_1679)
    {
        float _1735 = -_163;
        float _1737 = _1735 + 1.0;
        _1731 = as_type<int>(_1737);
    }
    int _1739 = _1731;
    bool _1741 = _1587 != 3;
    int _1743 = abs(_1717);
    if (_1679)
    {
        float _1745 = _1725 ? as_type<float>(_1739) : _163;
        _1733 = _1745;
    }
    float _1747 = _1733;
    int _1749 = _847 * _1689;
    int _1751 = _1749 + _1332;
    int _1753 = ~_1707;
    int _1755 = _1753 + 1;
    int _1757 = _1755 + 1;
    float _1759 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1761 = int(_1759);
    bool _1763 = !_1741;
    int _1765 = _1763 ? 0 : (-1);
    float _1767 = as_type<float>(_1673);
    if (_1721)
    {
        float _1769 = in.m_53.z;
        _1767 = _1769;
    }
    float _1771 = _1767;
    int _1773 = ~_1743;
    int _1775 = _1773 + 1;
    int _1777 = _1775 + 1;
    int _1779 = _1757 * as_type<int>(_1615);
    int _1781 = _1779 + _1729;
    int _1783 = abs(_1765);
    if (_1721)
    {
        float _1785 = -_163;
        float _1787 = _1785 + 1.0;
        _1523 = as_type<int>(_1787);
    }
    int _1789 = _1523;
    int _1791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1793 = _1791 != 0;
    int _1795 = _1777 * as_type<int>(_1637);
    int _1797 = _1795 + _1781;
    int _1799 = ~_1783;
    int _1801 = _1799 + 1;
    int _1803 = _1801 + 1;
    float _1805 = _127 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1807 = !_1793;
    float _1809 = _1807 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1811 = !_1198;
    int _1813 = _1811 ? _1751 : (-1);
    int _1815 = _1803 * as_type<int>(_1645);
    int _1817 = _1815 + _1797;
    int _1819 = abs(as_type<int>(_1809));
    float _1821 = -_1517;
    float _1823 = fma(_1805, 2.0, _1821);
    float _1825 = float(uint(_1761));
    float _1827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1829 = abs(_1761);
    int _1831 = ~_1819;
    int _1833 = _1831 + 1;
    int _1835 = _1833 + 1;
    float _1837 = float(uint(_1829));
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1841 = _1839 != 0;
    float _1843 = 1.0 / _1825;
    int _1845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1847 = _1845 != 0;
    int _1849 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1851 = _1849 != 0;
    int _1853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1855 = _1853 != 0;
    float _1857 = 1.0 / _1837;
    int _1859 = _1817 * _1835;
    bool _1861 = _1793;
    float _1863 = _1809;
    if (_1721)
    {
        bool _1865 = _1771 > 0.5;
        _1861 = _1865;
    }
    bool _1867 = _1861;
    float _1869 = _933 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1873 = _1813 * _1819;
    int _1875 = _1873 + _1859;
    if (!_1721)
    {
        _1863 = _163;
    }
    float _1877 = _1863;
    float _1879 = in.m_53.w;
    float _1881 = fma(_1869, -2.0, _1871);
    int _1883 = as_type<int>(_1843) + (-2);
    float _1885 = float(uint(_1875));
    float _1887 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1881);
    int _1889 = abs(_1875);
    float _1891 = as_type<float>(_1883) * _1885;
    float _1893 = _1877;
    if (_1721)
    {
        float _1895 = _1867 ? as_type<float>(_1789) : _163;
        _1893 = _1895;
    }
    float _1897 = _1893;
    float _1899 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1901 = as_type<int>(_1857) + (-2);
    float _1903 = fma(_1539, _1747, -0.5);
    float _1905 = float(uint(_1889));
    float _1907 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1899);
    float _1909 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1911 = _933 > 0.5;
    bool _1913 = _1911 && _1841;
    float _1915 = trunc(_1891);
    float _1917 = precise::max(_1915, 0.0);
    uint _1919 = uint(_1917);
    float _1921 = as_type<float>(_1901) * _1905;
    float _1923 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1907);
    float _1925 = -_133;
    float _1927 = fma(_1925, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1823);
    int _1929 = ~_1761;
    int _1931 = _1929 + 1;
    float _1933 = as_type<float>(_1931);
    if (!_1841)
    {
        _1659 = _163;
    }
    float _1935 = _1659;
    float _1937 = fma(_1923, _1903, _1927);
    float _1939 = trunc(_1921);
    float _1941 = precise::max(_1939, 0.0);
    uint _1943 = uint(_1941);
    bool _1945 = _933 > 0.5;
    bool _1947 = _1945 && _1847;
    float _1949 = _1935;
    if (_1913)
    {
        float _1951 = -_163;
        float _1953 = _1951 + 1.0;
        _213 = _1953;
    }
    float _1955 = _213;
    bool _1957 = _1879 > 0.5;
    bool _1959 = _1957 && _1851;
    bool _1961 = _1060 > 0.5;
    bool _1963 = _1961 && _1855;
    float _1965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    if (_1841)
    {
        _1949 = _1955;
    }
    float _1967 = _1949;
    int _1969 = _1931 * int(_1919);
    int _1971 = _1969 + _1875;
    float _1973 = _1947 ? _1511 : _167;
    float _1975 = _1959 ? _1511 : _167;
    float _1977 = _1963 ? _1511 : _167;
    float _1979 = fma(_1909, _1973, -0.5);
    int _1981 = ~int(_1943);
    int _1983 = _1981 + 1;
    if (_1052)
    {
        _1933 = _933;
    }
    float _1985 = _1933;
    float _1987 = _1985;
    if (!_1052)
    {
        _1987 = _127;
    }
    float _1989 = _1987;
    float _1991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _1993 = float(uint(_1971));
    int _1995 = _1983 * _1829;
    int _1997 = _1995 + _1889;
    float _1999 = _1965 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _2001 = _1965;
    if (_1052)
    {
        _2001 = _1060;
    }
    float _2003 = _2001;
    float _2005 = as_type<float>(_1883) * _1993;
    float _2007 = float(uint(_1997));
    float _2009 = fma(_1999, _1967, -0.5);
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2013 = trunc(_2005);
    float _2015 = precise::max(_2013, 0.0);
    uint _2017 = uint(_2015);
    float _2019 = as_type<float>(_1901) * _2007;
    float _2021 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2011);
    float _2023 = _2003;
    if (!_1052)
    {
        _1525 = _933;
    }
    float _2025 = _1525;
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_1052)
    {
        _2023 = _933;
    }
    float _2029 = _2023;
    float _2031 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _2033 = trunc(_2019);
    float _2035 = precise::max(_2033, 0.0);
    uint _2037 = uint(_2035);
    float _2039 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[98].z, _2031);
    float _2041 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _2043 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _2045 = fma(_2029, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2027);
    float _2047 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2049 = _1991 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _2051 = -_2043;
    float _2053 = fma(_2041, 2.0, _2051);
    float _2055 = fma(_1989, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2047);
    int _2057 = int(_1919) + int(_2017);
    float _2059 = fma(_1977, _2049, -0.5);
    float _2061 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _2063 = ~_1761;
    int _2065 = _2063 + 1;
    float _2067 = -_133;
    float _2069 = fma(_2067, (*spvDescriptorSet0.vp_c9)._m0[96].x, _2053);
    int _2071 = int(_1943) + int(_2037);
    float _2073 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[98].w, _2061);
    float _2075 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _2077 = _2065 * _2057;
    int _2079 = _2077 + _1875;
    int _2081 = ~_2071;
    int _2083 = _2081 + 1;
    float _2085 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2045);
    bool _2087 = uint(_2079) >= uint(_1761);
    int _2089 = _2083 * _1829;
    int _2091 = _2089 + _1889;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2095 = !_2087;
    int _2097 = _2095 ? 0 : (-1);
    float _2099 = _2025 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2101 = uint(_2091) >= uint(_1829);
    float _2103 = -_2093;
    float _2105 = fma(_1545, 2.0, _2103);
    int _2107 = ~_2057;
    int _2109 = _2107 + _2097;
    int _2111 = _2109 + 1;
    float _2113 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2115 = _1875 ^ _1761;
    float _2117 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[97].z, _2039);
    bool _2119 = _1761 == 0;
    int _2121 = _1761 * _2111;
    int _2123 = _2121 + _1875;
    bool _2125 = !_2101;
    int _2127 = _2125 ? 0 : (-1);
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    uint _2131 = uint(int(uint(_2115) >> uint(31)));
    float _2133 = fma(_2117, _2009, _2069);
    bool _2135 = _1761 == 0;
    float _2137 = fma(_2075, -2.0, _2129);
    float _2139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2141 = ~_2127;
    int _2143 = _2071 + _2141;
    int _2145 = _2143 + 1;
    float _2147 = -_133;
    float _2149 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2105);
    int _2151 = ~int(_2131);
    int _2153 = _2151 + 1;
    float _2155 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2137);
    bool _2157 = !_2119;
    int _2159 = _2157 ? _2123 : (-1);
    float _2161 = _2113 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2163 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2073);
    int _2165 = _2145 ^ _2153;
    float _2167 = fma(_2161, _1897, -0.5);
    float _2169 = float(_2159);
    float _2171 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2173 = ~_2153;
    int _2175 = _2173 + _2165;
    int _2177 = _2175 + 1;
    float _2179 = -_2155;
    float _2181 = fma(_2163, _2059, _2179);
    float _2183 = _2133 + 0.5;
    float _2185 = fma(_2161, _2169, _2149);
    bool _2187 = !_2135;
    int _2189 = _2187 ? _2177 : (-1);
    float _2191 = fma(_2099, -2.0, _2171);
    float _2193 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2195 = _2181 + 0.5;
    float _2197 = float(_2189);
    float _2199 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2191);
    float _2201 = fma(_1975, _2193, -0.5);
    float _2203 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2021);
    out.m_69.x = _2183;
    out.m_69.y = _2195;
    float _2205 = -_2199;
    float _2207 = fma(_2193, _2197, _2205);
    uint _2209 = as_type<uint>(half2(float2(_1497, 0.0)));
    float _2211 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2055);
    float _2213 = -_1887;
    float _2215 = fma(_2203, _1979, _2213);
    int _2217 = _1466 + 1;
    uint _2219 = extract_bits(_2209, 0u, 8u);
    int _2221 = int(_2219) & 255;
    uint _2223 = extract_bits(_2209, 8u, 8u);
    int _2225 = int(_2223) & 255;
    int _2227 = _2225 << 8;
    int _2229 = _2221 | _2227;
    float _2231 = fma(_2211, _2167, _2185);
    float _2233 = fma(_2085, _2201, _2207);
    float _2235 = _2215 + 0.5;
    bool _2237 = _2229 >= 32768;
    float _2239 = _2231 + 0.5;
    int _2241 = _2229 + (-1024);
    float _2243 = _2233 + 0.5;
    int _2245 = min(_1422, _2217);
    int _2247 = _2241;
    if (_2237)
    {
        int _2249 = ~_2229;
        int _2251 = _2249 + 33792;
        int _2253 = _2251 + 1;
        _2247 = _2253;
    }
    int _2255 = _2247;
    int _2257 = _2255 + 30719;
    float _2259 = float(_2257);
    float _2261 = fma(_2259, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2263 = abs(_2261);
    float _2265 = -_2263;
    float _2267 = _2265 + 1.0;
    bool _2269 = _2261 < 0.0;
    float _2271 = float(_2269);
    float _2273 = abs(_2261);
    float _2275 = fma(_2273, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2277 = as_type<int>(_2267) + (-218103808);
    float _2279 = abs(_2261);
    float _2281 = fma(_2279, _2275, -0.212114393711090087890625);
    bool _2283 = uint(_2277) >= 1920991232u;
    float _2285 = _1937 + 0.5;
    float _2287 = abs(_2261);
    float _2289 = fma(_2287, _2281, 1.570728778839111328125);
    bool _2291 = !_2283;
    float _2313;
    if (!_2291)
    {
        int _2293 = as_type<int>(_2267);
        int _2295 = as_type<int>(_1937);
        int _2297 = _2177;
        int _2299 = 11312;
        int _2301;
        int _2303;
        int _2305;
        int _2307;
        int _2309;
        int _2311;
        _94(_2293, _2295, _2297, _2299, _2301, _2303, _2305, _2307, _2309, _2311, out.gl_Position, out.gl_PointSize);
        _2313 = as_type<float>(_2305);
        _2315 = true;
    }
    else
    {
        float _2317 = rsqrt(_2267);
        float _2319 = _2267 * _2317;
        float _2321 = _2317 * 0.5;
        float _2323 = -_2319;
        float _2325 = 0.0 + _2323;
        float _2327 = fma(_2321, _2325, 0.5);
        float _2329 = fma(_2319, _2327, _2319);
        float _2331 = -_2329;
        float _2333 = 0.0 + _2331;
        float _2335 = fma(_2329, _2333, _2267);
        float _2337 = fma(_2321, _2335, _2329);
        _2313 = _2337;
    }
    _2315 = false;
    float _2339 = _2313;
    int _2341 = _2245;
    int _2343 = 0;
    int _2345 = _97(_2341, _2343, (*spvDescriptorSet0.support_buffer));
    int _2347 = _1456;
    int _2349 = 0;
    int _2351 = _97(_2347, _2349, (*spvDescriptorSet0.support_buffer));
    float4 _2353 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2345, _2351)), 0).xyzw;
    float _2355 = _2353.x;
    float _2357 = _2353.y;
    float _2359 = _2353.z;
    float _2361 = _2353.w;
    float _2363 = _2289 * _2339;
    float _2365 = _2271 * 2.0;
    float _2367 = _2259 * 3.883221149444580078125;
    float _2369 = floor(_1452);
    float _2371 = -_2365;
    float _2373 = fma(_2363, _2371, _2363);
    float _2375 = _2367 * 0.15915493667125701904296875;
    float _2377 = fma(_2271, 3.1415927410125732421875, _2373);
    float _2379 = _2375 * 6.283185482025146484375;
    float _2381 = cos(_2379);
    float _2383 = _2377 * 0.15915493667125701904296875;
    float _2385 = _2383 * 6.283185482025146484375;
    float _2387 = sin(_2385);
    float _2389 = -_2369;
    float _2391 = _1452 + _2389;
    float _2393 = _2375 * 6.283185482025146484375;
    float _2395 = sin(_2393);
    float _2397 = _2387 * _2381;
    float _2399 = _2387 * _2395;
    uint _2401 = as_type<uint>(half2(float2(_2361, 0.0)));
    uint _2403 = extract_bits(_2401, 0u, 8u);
    int _2405 = int(_2403) & 255;
    uint _2407 = extract_bits(_2401, 8u, 8u);
    int _2409 = int(_2407) & 255;
    int _2411 = _2409 << 8;
    int _2413 = _2405 | _2411;
    bool _2415 = _2413 >= 32768;
    int _2417 = _2413 + (-1024);
    int _2419 = _2417;
    if (_2415)
    {
        int _2421 = ~_2413;
        int _2423 = _2421 + 33792;
        int _2425 = _2423 + 1;
        _2419 = _2425;
    }
    int _2427 = _2419;
    int _2429 = _2427 + 30719;
    float _2431 = float(_2429);
    float _2433 = fma(_2431, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2435 = abs(_2433);
    float _2437 = -_2435;
    float _2439 = _2437 + 1.0;
    float _2441 = abs(_2433);
    float _2443 = fma(_2441, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2445 = as_type<int>(_2439) + (-218103808);
    bool _2447 = uint(_2445) >= 1920991232u;
    float _2449 = -_1491;
    float _2451 = _2449 + _2355;
    float _2453 = -_1493;
    float _2455 = _2453 + _2357;
    float _2457 = -_1495;
    float _2459 = _2457 + _2359;
    float _2461 = fma(_2391, _2451, _1491);
    float _2463 = abs(_2433);
    float _2465 = fma(_2463, _2443, -0.212114393711090087890625);
    float _2467 = fma(_2391, _2455, _1493);
    float _2469 = fma(_2391, _2459, _1495);
    bool _2471 = _2433 < 0.0;
    float _2473 = float(_2471);
    float _2475 = abs(_2433);
    float _2477 = fma(_2475, _2465, 1.570728778839111328125);
    bool _2479 = !_2447;
    float _2501;
    if (!_2479)
    {
        int _2481 = as_type<int>(_2439);
        int _2483 = as_type<int>(_2383);
        int _2485 = as_type<int>(_2439);
        int _2487 = 12208;
        int _2489;
        int _2491;
        int _2493;
        int _2495;
        int _2497;
        int _2499;
        _94(_2481, _2483, _2485, _2487, _2489, _2491, _2493, _2495, _2497, _2499, out.gl_Position, out.gl_PointSize);
        _2501 = as_type<float>(_2493);
        _2503 = true;
    }
    else
    {
        float _2505 = rsqrt(_2439);
        float _2507 = _2439 * _2505;
        float _2509 = _2505 * 0.5;
        float _2511 = -_2507;
        float _2513 = 0.0 + _2511;
        float _2515 = fma(_2509, _2513, 0.5);
        float _2517 = fma(_2507, _2515, _2507);
        float _2519 = -_2517;
        float _2521 = 0.0 + _2519;
        float _2523 = fma(_2517, _2521, _2439);
        float _2525 = fma(_2509, _2523, _2517);
        _2501 = _2525;
    }
    _2503 = false;
    float _2527 = _2501;
    float _2529 = in.m_53.x;
    float _2531 = in.m_53.y;
    float _2533 = in.m_53.z;
    float _2535 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2537 = log2(_2535);
    float _2539 = _287 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2541 = _287 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2543 = _287 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2545 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2539);
    float _2547 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2541);
    float _2549 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2543);
    float _2551 = _2477 * _2527;
    int _2553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2555 = _2553 != 0;
    int _2557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2559 = _2557 != 0;
    int _2561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2563 = _2561 != 0;
    float _2565 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2547);
    float _2567 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2569 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2571 = _511 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2573 = _2537 * _133;
    float _2575 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2545);
    float _2577 = fma(_289, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2549);
    float _2579 = _2431 * 3.883221149444580078125;
    float _2581 = _2575 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2583 = _2577 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2585 = _2533 * 2.0;
    float _2587 = _2529 * 2.0;
    float _2589 = _2529 + _2533;
    float _2591 = _2531 * 2.0;
    bool _2593 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2595 = isnan(1.0);
    bool _2597 = _2593 || _2595;
    bool _2599 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2601 = _2597 || _2599;
    float _2603 = floor(_2587);
    float _2605 = _2589 + (-1.0);
    float _2607 = -_2261;
    float _2609 = _2607 + _2433;
    float _2611 = fma(_2391, _2609, _2261);
    float _2613 = floor(_2585);
    float _2615 = floor(_2591);
    bool _2617 = _2603 >= 0.0;
    bool _2619 = isnan(_2603);
    bool _2621 = _2617 || _2619;
    bool _2623 = isnan(0.0);
    bool _2625 = _2621 || _2623;
    bool _2627 = _2613 > 0.0;
    bool _2629 = _2613 >= 0.0;
    bool _2631 = isnan(_2613);
    bool _2633 = _2629 || _2631;
    bool _2635 = isnan(0.0);
    bool _2637 = _2633 || _2635;
    float _2639 = fma(_2605, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _2641 = _2625 ? 0 : 1;
    float _2643 = exp2(_2573);
    int _2645 = _2637 ? 0 : 1;
    bool _2647 = _2603 > 0.0;
    float _2649 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2651 = 1.0 + _2649;
    bool _2653 = !_2555;
    int _2655 = _2653 ? 0 : 1;
    int _2657 = ~_2645;
    int _2659 = _2657 + 1;
    int _2661 = _2659 + 1;
    float _2663 = 1.0 / _2651;
    int _2665 = _2661;
    float _2667 = _2611;
    if (!_2627)
    {
        int _2669 = ~_2645;
        int _2671 = _2669 + 1;
        _2665 = _2671;
    }
    int _2673 = _2665;
    float _2675 = _2531 + _2529;
    bool _2677 = _2615 > 0.0;
    bool _2679 = _2615 >= 0.0;
    bool _2681 = isnan(_2615);
    bool _2683 = _2679 || _2681;
    bool _2685 = isnan(0.0);
    bool _2687 = _2683 || _2685;
    float _2689 = _2675 + (-1.0);
    int _2691 = abs(_2655);
    float _2693 = -_2643;
    float _2695 = _2693 + 1.0;
    float _2697 = float(_2673);
    float _2699 = in.m_71.x;
    float _2701 = in.m_71.y;
    float _2703 = in.m_71.z;
    float _2705 = float(_2691);
    float _2707 = fma(_2689, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2709 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2711 = isnan(0.0);
    bool _2713 = _2709 || _2711;
    bool _2715 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2717 = _2713 || _2715;
    int _2719 = _2687 ? 0 : 1;
    float _2721 = _2705 * _2697;
    float _2723 = _2529 + (-0.5);
    float _2725 = _2565 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2727 = _2717 ? _2695 : 0.0;
    float _2729 = _2721 * (-2.0);
    bool _2731 = !_2563;
    int _2733 = _2731 ? 0 : 1;
    float _2735 = -_2725;
    float _2737 = _2735 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    int _2739 = ~_2719;
    int _2741 = _2739 + 1;
    int _2743 = _2741 + 1;
    int _2745 = _2743;
    float _2747 = _2725;
    if (_2601)
    {
        float _2749 = _2727 * _2663;
        _155 = _2749;
    }
    float _2751 = _155;
    if (!_2677)
    {
        int _2753 = ~_2719;
        int _2755 = _2753 + 1;
        _2745 = _2755;
    }
    int _2757 = _2745;
    float _2759 = fma(_2707, _2729, _2707);
    int _2761 = ~_2641;
    int _2763 = _2761 + 1;
    int _2765 = _2763 + 1;
    float _2767 = -_2581;
    float _2769 = _2767 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _2771 = abs(_2733);
    float _2773 = _2737 * _2737;
    int _2775 = _2765;
    if (!_2647)
    {
        int _2777 = ~_2641;
        int _2779 = _2777 + 1;
        _2775 = _2779;
    }
    int _2781 = _2775;
    float _2783 = -_2583;
    float _2785 = _2783 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _2787 = !_2559;
    int _2789 = _2787 ? 0 : 1;
    float _2791 = fma(_2729, _2699, _2699);
    float _2793 = float(_2771);
    float _2795 = fma(_2769, _2769, _2773);
    float _2797 = float(_2757);
    float _2799 = fma(_2723, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2791);
    int _2801 = abs(_2789);
    float _2803 = fma(_2785, _2785, _2795);
    bool _2805 = _2467 != 0.0;
    bool _2807 = isnan(_2467);
    bool _2809 = _2805 || _2807;
    bool _2811 = isnan(0.0);
    bool _2813 = _2809 || _2811;
    float _2815 = fma(_2759, _2751, _2799);
    float _2817 = _2793 * _2797;
    float _2819 = _2533 + (-0.5);
    float _2821 = _2531 + _2533;
    float _2823 = _2815 * 0.15915493667125701904296875;
    float _2825 = float(_2801);
    float _2827 = _2817 * (-2.0);
    float _2829 = float(_2781);
    float _2831 = rsqrt(_2803);
    float _2833 = _2821 + (-1.0);
    float _2835 = fma(_2827, _2703, _2703);
    float _2837 = fma(_2639, _2827, _2639);
    float _2839 = _2825 * _2829;
    float _2841 = _2531 + (-0.5);
    float _2843 = fma(_2819, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2835);
    float _2845 = _2839 * (-2.0);
    float _2847 = _2823 * 6.283185482025146484375;
    float _2849 = sin(_2847);
    float _2851 = fma(_2833, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2853 = fma(_2837, _2751, _2843);
    float _2855 = fma(_2845, _2701, _2701);
    float _2857 = _2473 * 2.0;
    float _2859 = fma(_2851, _2845, _2851);
    float _2861 = _2853 * 0.15915493667125701904296875;
    float _2863 = fma(_2841, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2855);
    float _2865 = -_2857;
    float _2867 = fma(_2551, _2865, _2551);
    float _2869 = _2823 * 6.283185482025146484375;
    float _2871 = cos(_2869);
    bool _2873 = _2461 == 0.0;
    bool _2875 = !_2813;
    bool _2877 = _2873 && _2875;
    float _2879 = fma(_2859, _2751, _2863);
    float _2881 = _2769 * _2831;
    float _2883 = _2785 * _2831;
    float _2885 = _2737 * _2831;
    float _2887 = _2879 * 0.15915493667125701904296875;
    float _2889 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2891 = _2881 * _2889;
    float _2893 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2895 = _2883 * _2893;
    float _2897 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2899 = _2885 * _2897;
    float _2901 = fma(_2473, 3.1415927410125732421875, _2867);
    float _2903 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2905 = -_2891;
    float _2907 = fma(_2883, _2903, _2905);
    float _2909 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2911 = -_2895;
    float _2913 = fma(_2885, _2909, _2911);
    float _2915 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2917 = -_2899;
    float _2919 = fma(_2881, _2915, _2917);
    float _2921 = _2861 * 6.283185482025146484375;
    float _2923 = sin(_2921);
    float _2925 = _2907 * _2907;
    bool _2927 = _2469 == 0.0;
    bool _2929 = _2927 && _2877;
    float _2931 = fma(_2913, _2913, _2925);
    float _2933 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2467);
    float _2935 = _2861 * 6.283185482025146484375;
    float _2937 = cos(_2935);
    float _2939 = fma(_2919, _2919, _2931);
    float _2941 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2461);
    float _2943 = _2569 * _2933;
    float _2945 = _2571 * _2941;
    float _2947 = _2887 * 6.283185482025146484375;
    float _2949 = cos(_2947);
    float _2951 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2469);
    float _2953 = _2871 * _2923;
    float _2955 = _2881;
    if (!_2929)
    {
        float _2957 = fma(_2467, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2611);
        _2667 = _2957;
    }
    float _2959 = _2667;
    float _2961 = _2887 * 6.283185482025146484375;
    float _2963 = sin(_2961);
    float _2965 = _2871 * _2937;
    float _2967 = rsqrt(_2939);
    float _2969 = _2567 * _2951;
    float _2971 = _2849 * _2923;
    float _2973 = _2949 * _2923;
    float _2975 = _2849 * _2937;
    float _2977 = _2871 * _2949;
    float _2979 = _2849 * _2949;
    float _2981 = _2949 * _2937;
    float _2983 = fma(_2963, _2971, _2965);
    float _2985 = -_2953;
    float _2987 = fma(_2963, _2975, _2985);
    float _2989 = -_2975;
    float _2991 = fma(_2963, _2953, _2989);
    float _2993 = _2979 * _2943;
    float _2995 = fma(_2963, _2965, _2971);
    float _2997 = _2987 * _2943;
    float _2999 = -_2963;
    float _3001 = fma(_2999, _2945, _2993);
    float _3003 = _2913 * _2967;
    float _3005 = _2907 * _2967;
    float _3007 = _2983 * _2943;
    float _3009 = _2919 * _2967;
    float _3011 = _2885 * _3003;
    float _3013 = _2883 * _3005;
    float _3015 = fma(_2973, _2945, _3007);
    float _3017 = fma(_2981, _2945, _2997);
    float _3019 = -_3011;
    float _3021 = fma(_2881, _3005, _3019);
    float _3023 = -_3013;
    float _3025 = fma(_2885, _3009, _3023);
    float _3027 = fma(_2991, _2969, _3015);
    float _3029 = _2901 * 0.15915493667125701904296875;
    float _3031 = fma(_2995, _2969, _3017);
    float _3033 = _2579 * 0.15915493667125701904296875;
    float _3035 = _3025 * _3027;
    float _3037 = _3021 * _3027;
    float _3039 = fma(_2977, _2969, _3001);
    float _3041 = _3033 * 6.283185482025146484375;
    float _3043 = cos(_3041);
    float _3045 = fma(_3003, _3031, _3035);
    float _3047 = fma(_3009, _3031, _3037);
    float _3049 = _2983 * _3025;
    float _3051 = _2991 * _3025;
    float _3053 = fma(_2881, _3039, _3045);
    float _3055 = fma(_2883, _3039, _3047);
    float _3057 = _3029 * 6.283185482025146484375;
    float _3059 = sin(_3057);
    float _3061 = _2581 + _3053;
    float _3063 = _2583 + _3055;
    float _3065 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3067 = _3061 + _3065;
    float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3071 = _3063 + _3069;
    float _3073 = _3033 * 6.283185482025146484375;
    float _3075 = sin(_3073);
    float _3077 = _3067 * _3067;
    float _3079 = _3071 * _3071;
    float _3081 = _3077 + _3079;
    float _3083 = -_2397;
    float _3085 = fma(_3059, _3043, _3083);
    float _3087 = _2881 * _3009;
    float _3089 = fma(_2391, _3085, _2397);
    float _3091 = -_3087;
    float _3093 = fma(_2883, _3003, _3091);
    float _3095 = -_2399;
    float _3097 = fma(_3059, _3075, _3095);
    float _3099 = _3093 * _3027;
    float _3101 = _3089;
    float _3103 = _3077;
    float _3105 = _3079;
    float _3107 = _3061;
    float _3109 = _3063;
    float _3111 = _3071;
    if (!_2929)
    {
        float _3113 = fma(_2461, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3089);
        _3101 = _3113;
    }
    float _3115 = _3101;
    float _3117 = _2983 * _3093;
    float _3119 = fma(_2391, _3097, _2399);
    float _3121 = _2983 * _3021;
    float _3123 = sqrt(_3081);
    float _3125 = fma(_2987, _3003, _3049);
    float _3127 = _3119;
    if (!_2929)
    {
        float _3129 = fma(_2469, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3119);
        _3127 = _3129;
    }
    float _3131 = _3127;
    float _3133 = fma(_2987, _3009, _3121);
    float _3135 = _2973 * _3021;
    float _3137 = _2991 * _3021;
    float _3139 = fma(_3005, _3031, _3099);
    float _3141 = fma(_2987, _3005, _3117);
    float _3143 = _2973 * _3025;
    float _3145 = _2973 * _3093;
    float _3147 = fma(_2885, _3039, _3139);
    float _3149 = fma(_2981, _3009, _3135);
    float _3151 = _2991 * _3093;
    float _3153 = fma(_2981, _3003, _3143);
    float _3155 = _2725 + _3147;
    float _3157 = fma(_2981, _3005, _3145);
    bool _3159 = _3123 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3161 = fma(_2995, _3003, _3051);
    float _3163 = fma(_2979, _2881, _3125);
    float _3165 = fma(_2979, _2885, _3141);
    float _3167 = fma(_2995, _3005, _3151);
    float _3169 = fma(_2995, _3009, _3137);
    float _3171 = fma(_2979, _2883, _3133);
    if (!_3159)
    {
        _2747 = _3155;
    }
    float _3173 = _2747;
    bool _3175 = !_3159;
    float _3177 = _3173;
    if (!_3175)
    {
        float _3179 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3181 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3183 = _3123 + _3181;
        float _3185 = rsqrt(_3081);
        float _3187 = _3183 * _3179;
        float _3189 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3191 = _3187 * 0.15915493667125701904296875;
        float _3193 = _3191 * 6.283185482025146484375;
        float _3195 = sin(_3193);
        float _3197 = _3191 * 6.283185482025146484375;
        float _3199 = cos(_3197);
        float _3201 = fma(_3195, _3189, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3203 = _3185 * _3201;
        float _3205 = _3199 + (-1.0);
        float _3207 = _3067 * _3203;
        float _3209 = _3071 * _3203;
        float _3211 = _3205 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3213 = _3207 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3215 = _3207 * _3207;
        float _3217 = _3209 * _3209;
        float _3219 = fma(_3155, _3199, _3211);
        float _3221 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        _3177 = _3219;
        _3103 = _3215;
        _3105 = _3217;
        _3107 = _3213;
        _3109 = _3221;
        _3111 = _3209;
    }
    float _3223 = _3177;
    float _3225 = _3103;
    float _3227 = _3105;
    float _3229 = _3107;
    float _3231 = _3109;
    float _3233 = _3111;
    float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3237 = _3223 + _3235;
    float _3239 = -_2963;
    float _3241 = fma(_3239, _2881, _3153);
    float _3243 = -_2963;
    float _3245 = fma(_3243, _2885, _3157);
    float _3247 = -_2963;
    float _3249 = fma(_3247, _2883, _3149);
    float _3251 = fma(_3237, _3237, _3225);
    float _3253 = _3163 * _2959;
    float _3255 = _3165 * _2959;
    float _3257 = _3171 * _2959;
    float _3259 = _3251 + _3227;
    float _3261 = fma(_2977, _2881, _3161);
    float _3263 = fma(_2977, _2885, _3167);
    float _3265 = fma(_2977, _2883, _3169);
    float _3267 = fma(_3241, _3115, _3253);
    float _3269 = fma(_3245, _3115, _3255);
    float _3271 = sqrt(_3259);
    float _3273 = fma(_3249, _3115, _3257);
    float _3275 = fma(_3261, _3131, _3267);
    float _3277 = fma(_3263, _3131, _3269);
    out.m_73.x = _2285;
    out.m_73.y = _2235;
    out.m_73.z = _2239;
    out.m_73.w = _2243;
    float _3279 = fma(_3265, _3131, _3273);
    out.m_75.x = _3275;
    out.m_75.y = _3277;
    out.m_75.z = _3279;
    bool _3281 = _3271 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3283 = isnan(_3271);
    bool _3285 = _3281 || _3283;
    bool _3287 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3289 = _3285 || _3287;
    float _3291 = _3237;
    float _3293 = _3245;
    float _3295 = _3233;
    if (!_3289)
    {
        _2955 = 1.0;
    }
    float _3297 = _2955;
    bool _3299 = !_3289;
    float _3301 = _3297;
    if (!_3299)
    {
        bool _3303 = _3271 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3305 = isnan(_3271);
        bool _3307 = _3303 || _3305;
        bool _3309 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3311 = _3307 || _3309;
        if (!_3311)
        {
            float _3313 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3315 = _3271 + _3313;
            float _3317 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3319 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3317;
            float _3321 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3323 = _3321 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3325 = 1.0 / _3319;
            float _3327 = _3315 * _3325;
            float _3329 = fma(_3327, _3323, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3301 = _3329;
            _3331 = true;
        }
        else
        {
            bool _3333 = _3271 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3335 = isnan(_3271);
            bool _3337 = _3333 || _3335;
            bool _3339 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3341 = _3337 || _3339;
            if (!_3341)
            {
                float _3343 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3345 = _3271 + _3343;
                float _3347 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3349 = _3347 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3351 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3353 = _3351 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3355 = 1.0 / _3349;
                float _3357 = _3345 * _3355;
                float _3359 = fma(_3357, _3353, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3301 = _3359;
                _3331 = true;
            }
            else
            {
                _3301 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3331 = false;
    float _3361 = _3301;
    float _3363 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3365 = _3223 + _3363;
    float _3367 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3369 = _3229 + _3367;
    float _3371 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3373 = _3231 + _3371;
    float _3375 = fma(_3365, _3361, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3377 = fma(_3369, _3361, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3379 = fma(_3373, _3361, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3381 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3383 = _3375 + _3381;
    float _3385 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3387 = _3377 + _3385;
    float _3389 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3391 = _3379 + _3389;
    float _3393 = _3383 * _3383;
    float _3395 = fma(_3387, _3387, _3393);
    float _3397 = fma(_3391, _3391, _3395);
    float _3399 = rsqrt(_3397);
    float _3401 = _3399 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3403 = _3387 * _3401;
    float _3405 = _3391 * _3401;
    float _3407 = _3403 * _3403;
    float _3409 = _3405 * _3405;
    float _3411 = _3407 + _3409;
    float _3413 = sqrt(_3411);
    bool _3415 = _3413 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3417 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3419 = _3413 + _3417;
    float _3421 = _3399;
    float _3423 = _3419;
    float _3425 = _3383;
    float _3427 = _3403;
    if (_3415)
    {
        float _3429 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3421 = _3429;
    }
    float _3431 = _3421;
    if (_3415)
    {
        float _3433 = rsqrt(_3411);
        _3291 = _3433;
    }
    float _3435 = _3291;
    float _3437 = _3435;
    if (_3415)
    {
        float _3439 = _3419 * _3431;
        _3423 = _3439;
    }
    float _3441 = _3423;
    float _3443 = _3375 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_3415)
    {
        float _3445 = _3441 * 0.15915493667125701904296875;
        _3293 = _3445;
    }
    float _3447 = _3293;
    float _3449 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3443);
    float _3451 = _3391;
    if (_3415)
    {
        float _3453 = _3447 * 6.283185482025146484375;
        float _3455 = sin(_3453);
        _3451 = _3455;
    }
    float _3457 = _3451;
    float _3459 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3461 = precise::max(0.0, _3459);
    float _3463 = _3431;
    float _3465 = _3461;
    if (_3415)
    {
        float _3467 = _3447 * 6.283185482025146484375;
        float _3469 = cos(_3467);
        _3463 = _3469;
    }
    float _3471 = _3463;
    float _3473 = -_3401;
    float _3475 = -_3461;
    float _3477 = fma(_3383, _3473, _3475);
    if (_3415)
    {
        float _3479 = _3477 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3425 = _3479;
    }
    float _3481 = _3425;
    float _3483 = sqrt(_3397);
    float _3485 = _3481;
    float _3487 = _3457;
    if (_3415)
    {
        float _3489 = fma(_3457, _3481, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3485 = _3489;
    }
    float _3491 = _3485;
    float _3493 = _3491;
    if (!_3415)
    {
        _3487 = _3405;
    }
    float _3495 = _3487;
    float _3497 = _3495;
    if (_3415)
    {
        float _3499 = _3471 + (-1.0);
        _3465 = _3499;
    }
    float _3501 = _3465;
    float _3503 = _3501;
    if (_3415)
    {
        float _3505 = _3435 * _3491;
        _3295 = _3505;
    }
    float _3507 = _3295;
    if (!_3415)
    {
        _3437 = _3477;
    }
    float _3509 = _3437;
    float _3511 = _3509;
    if (_3415)
    {
        float _3513 = _3501 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3503 = _3513;
    }
    float _3515 = _3503;
    float _3517 = _3515;
    if (_3415)
    {
        float _3519 = _3403 * _3507;
        _3427 = _3519;
    }
    float _3521 = _3427;
    if (!_3415)
    {
        _3493 = _3407;
    }
    float _3523 = _3493;
    float _3525 = _3523;
    if (_3415)
    {
        float _3527 = _3405 * _3507;
        _3497 = _3527;
    }
    float _3529 = _3497;
    if (_3415)
    {
        float _3531 = fma(_3477, _3471, _3515);
        _3511 = _3531;
    }
    float _3533 = _3511;
    if (_3415)
    {
        float _3535 = _3521 * _3521;
        _3525 = _3535;
    }
    float _3537 = _3525;
    if (!_3415)
    {
        _3517 = _3409;
    }
    float _3539 = _3517;
    float _3541 = _3539;
    if (_3415)
    {
        float _3543 = _3529 * _3529;
        _3541 = _3543;
    }
    float _3545 = _3541;
    float _3547 = fma(_3533, _3533, _3537);
    float _3549 = _3547 + _3545;
    float _3551 = _3375 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3553 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3555 = fma(_3483, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3553);
    float _3557 = precise::clamp(_3555, 0.0, 1.0);
    float _3559 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3561 = rsqrt(_3549);
    float _3563 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3551);
    float _3565 = _3375 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3567 = -_3557;
    float _3569 = _3567 + 1.0;
    float _3571 = fma(_3379, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3563);
    float _3573 = _3375 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3575 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3565);
    float _3577 = _3571 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3579 = fma(_3377, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3573);
    float _3581 = abs(_3569);
    float _3583 = log2(_3581);
    float _3585 = fma(_3379, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3575);
    float _3587 = _3577 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3589 = fma(_3379, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3579);
    float _3591 = _3585 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3593 = _3561 * _3521;
    float _3595 = -_3587;
    float _3597 = fma(_3595, _3559, 1.0);
    float _3599 = _3589 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3601 = _3591 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3603 = fma(_3379, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3449);
    float _3605 = _3561 * _3533;
    float _3607 = _3593 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3609 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3601);
    float _3611 = _3561 * _3529;
    float _3613 = _3603 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3615 = _3583 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3617 = -_3607;
    float _3619 = fma(_3605, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3617);
    float _3621 = fma(_3577, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3609);
    float _3623 = log2(_3597);
    float _3625 = _3591 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3627 = -_3611;
    float _3629 = fma(_3627, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3619);
    float _3631 = fma(_3613, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3621);
    float _3633 = _3591 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3635 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3625);
    float _3637 = fma(_3629, -0.5, 0.5);
    float _3639 = fma(_3629, 0.5, 0.5);
    float _3641 = exp2(_3615);
    float _3643 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3633);
    float _3645 = _3605 + 1.0;
    float _3647 = fma(_3639, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3649 = fma(_3577, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3643);
    float _3651 = fma(_3639, _3647, -0.212114393711090087890625);
    float _3653 = 1.0 / _3631;
    float _3655 = fma(_3577, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3635);
    float _3657 = _3623 * 0.693147182464599609375;
    float _3659 = fma(_3639, _3651, 1.570728778839111328125);
    float _3661 = sqrt(_3637);
    float _3663 = -_3605;
    float _3665 = fma(_3641, _3645, _3663);
    float _3667 = fma(_3613, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3649);
    float _3669 = fma(_3613, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3655);
    float _3671 = fma(_3665, 0.5, 0.5);
    float _3673 = _3667 * _3653;
    float _3675 = _3669 * _3653;
    float _3677 = _3657 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3679 = fma(_3673, 0.5, 0.5);
    float _3681 = fma(_3675, -0.5, 0.5);
    float _3683 = _3661 * 0.636619746685028076171875;
    float3 _9148 = float3(_3679, _3681, _3677);
    float _3685 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9148, float3(0.0), isnan(_9148)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9148, float3(0.0), isnan(_9148)), level(0.0)).x;
    float3 _9159 = float3(_3679, _3681, _3677);
    float4 _3687 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9159, float3(0.0), isnan(_9159)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9159, float3(0.0), isnan(_9159)), level(0.0)).xyzw;
    float _3689 = _3687.x;
    float _3691 = _3687.y;
    float _3693 = _3687.z;
    float _3695 = _3687.w;
    float _3697 = -_3659;
    float _3699 = fma(_3683, _3697, 1.0);
    float2 _9180 = float2(_3699, _3671);
    float3 _3703 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9180, float2(0.0), isnan(_9180)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9180, float2(0.0), isnan(_9180)), level(0.0)).xyz;
    float _3705 = _3703.x;
    float _3707 = _3703.y;
    float _3709 = _3703.z;
    float _3711 = _3583 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3713 = _3591 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_77.x = _3377;
    out.m_77.y = _3375;
    out.m_77.z = _3379;
    float _3715 = fma(_3599, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3713);
    float _3717 = exp2(_3711);
    float _3719 = fma(_3577, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3715);
    float _3721 = fma(_3613, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3719);
    float _3723 = _3721 + _3631;
    out.gl_Position.x = _3667;
    out.gl_Position.y = _3669;
    out.gl_Position.z = _3721;
    out.gl_Position.w = _3631;
    float _3725 = _3723 * 0.5;
    float _3727 = -_3717;
    float _3729 = _3727 + 1.0;
    float _3731 = _3729 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3733 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.z = _3725;
    out.m_79.w = _3631;
    out.m_49.x = _3733;
    float _3735 = _3731 * _3685;
    float _3737 = -_3731;
    float _3739 = _3737 + 1.0;
    float _3741 = _3695 * _3735;
    float _3743 = _3709 * _3735;
    float _3745 = fma(_3705, _3741, _3689);
    float _3747 = fma(_3707, _3741, _3691);
    float _3749 = _3695 * _3739;
    float _3751 = fma(_3695, _3743, _3693);
    out.m_81.x = _3745;
    out.m_81.y = _3747;
    out.m_81.z = _3751;
    out.m_81.w = _3749;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

