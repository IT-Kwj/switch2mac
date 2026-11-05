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
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_C [[id(6)]];
    sampler vp_t_tcb_CSmplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_32Smplr_w [[id(14)]];
    sampler vp_t_tcb_30Smplr_w [[id(15)]];
    sampler vp_t_tcb_1CSmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_73 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad4 [[user(locn4)]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_53 [[attribute(9)]];
    float4 m_51 [[attribute(10)]];
    float4 m_55 [[attribute(11)]];
};

static inline __attribute__((always_inline))
int _96(thread const int& _6886, thread const int& _6887, constant _10& support_buffer)
{
    float _6890 = as_type<float>(support_buffer._m4);
    int _6892 = _6887 + as_type<int>(_6890);
    int _6894 = 1 + _6892;
    float _6896 = support_buffer._m5[_6894].x;
    float _6898 = abs(_6896);
    bool _6900 = _6898 == 1.0;
    if (_6900)
    {
        return _6886;
    }
    float _6902 = float(_6886);
    float _6904 = _6902 / _6898;
    int _6906 = int(_6904);
    return _6906;
}

static inline __attribute__((always_inline))
int _97(thread const int& _6936, thread const int& _6937, constant _10& support_buffer)
{
    float _6940 = as_type<float>(support_buffer._m4);
    int _6942 = _6937 + as_type<int>(_6940);
    int _6944 = 1 + _6942;
    float _6946 = support_buffer._m5[_6944].x;
    bool _6948 = _6946 == 1.0;
    if (_6948)
    {
        return _6936;
    }
    float _6950 = float(_6936);
    float _6952 = _6950 * _6946;
    int _6954 = int(_6952);
    return _6954;
}

static inline __attribute__((always_inline))
void _94(thread const int& _6593, thread const int& _6594, thread const int& _6595, thread int& _6596, thread int& _6597, thread int& _6598, thread int& _6599, thread int& _6600, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _6603 = _6594;
    float _6605 = 0.0 + as_type<float>(_6593);
    bool _6607 = _6605 != 0.0;
    bool _6609 = isnan(_6605);
    bool _6611 = _6607 || _6609;
    bool _6613 = isnan(0.0);
    bool _6615 = _6611 || _6613;
    int _6617 = as_type<int>(_6605);
    int _6619 = _6615 ? (-1) : 0;
    if (!_6615)
    {
        float _6621 = as_type<float>(_6593) * 1.0;
        _6603 = as_type<int>(_6621);
    }
    int _6623 = _6603;
    bool _6625 = !_6615;
    int _6627 = _6623;
    int _6629 = _6623;
    if (!_6625)
    {
        bool _6631 = _6605 >= 0.0;
        bool _6633 = isnan(_6605);
        bool _6635 = _6631 || _6633;
        bool _6637 = isnan(0.0);
        bool _6639 = _6635 || _6637;
        _6619 = _6639 ? (-1) : 0;
        if (!_6639)
        {
            _6627 = 2147483647;
        }
        int _6641 = _6627;
        bool _6643 = !_6639;
        int _6645 = _6641;
        _6629 = _6641;
        if (!_6643)
        {
            float _6647 = abs(as_type<float>(_6593));
            float _6649 = 0.0 + _6647;
            bool _6651 = _6649 > as_type<float>(0x7f800000u /* inf */);
            bool _6653 = isnan(_6649);
            bool _6655 = _6651 || _6653;
            bool _6657 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _6659 = _6655 || _6657;
            _6617 = as_type<int>(_6649);
            _6619 = _6659 ? (-1) : 0;
            if (_6659)
            {
                float _6661 = as_type<float>(_6593) + 1.0;
                _6645 = as_type<int>(_6661);
            }
            int _6663 = _6645;
            int _6665 = _6663;
            _6629 = _6663;
            if (!_6659)
            {
                bool _6667 = _6649 != as_type<float>(0x7f800000u /* inf */);
                bool _6669 = isnan(_6649);
                bool _6671 = _6667 || _6669;
                bool _6673 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _6675 = _6671 || _6673;
                _6619 = _6675 ? (-1) : 0;
                if (!_6675)
                {
                    _6665 = _6593;
                }
                int _6677 = _6665;
                bool _6679 = !_6675;
                _6629 = _6677;
                if (!_6679)
                {
                    float _6681 = as_type<float>(_6593) * 18446744073709551616.0;
                    float _6683 = rsqrt(_6681);
                    float _6685 = _6681 * _6683;
                    float _6687 = _6683 * 0.5;
                    float _6689 = -_6685;
                    float _6691 = 0.0 + _6689;
                    float _6693 = fma(_6687, _6691, 0.5);
                    float _6695 = fma(_6685, _6693, _6685);
                    float _6697 = -_6695;
                    float _6699 = 0.0 + _6697;
                    float _6701 = fma(_6695, _6699, _6681);
                    float _6703 = fma(_6687, _6701, _6695);
                    float _6705 = _6703 * 2.3283064365386962890625e-10;
                    _6629 = as_type<int>(_6705);
                    _6617 = as_type<int>(_6695);
                }
            }
        }
    }
    int _6707 = _6629;
    int _6709 = _6617;
    int _6711 = _6619;
    _6596 = _6595;
    _6597 = 0;
    _6598 = _6707;
    _6599 = _6709;
    _6600 = _6711;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1221 = false;
    bool _1037 = false;
    bool _573 = false;
    bool _303 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _105 = int(_103);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2735 = as_type<float>(_121);
        out.gl_Position.z = _2735;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_49.w;
    float _127 = float(_105);
    float _129 = -_125;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_125);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    bool _143 = _131 >= _127;
    bool _145 = !_141;
    bool _147 = _143 || _145;
    float _149 = _131;
    if (_147)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _113;
    if (_147)
    {
        out.m_47.x = 0.0;
    }
    if (_147)
    {
        float _153 = _151 * 5.0;
        _123 = as_type<int>(_153);
    }
    int _155 = _123;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2799 = as_type<float>(_155);
        out.gl_Position.z = _2799;
    }
    if (_147)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _157 = in.m_51.w;
    float _159 = 1.0 / _127;
    float _161 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = in.m_49.x;
    float _175 = in.m_49.y;
    float _177 = in.m_49.z;
    float _179 = in.m_44.x;
    float _181 = in.m_44.y;
    float _183 = in.m_44.z;
    float _185 = 0.0;
    float _187 = _161;
    if (!_171)
    {
        float _189 = _161 * _161;
        float _191 = _189 * 0.5;
        _185 = _191;
    }
    float _193 = _185;
    float _195 = _193;
    if (!_171)
    {
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _197;
    }
    float _199 = _195;
    bool _201 = !_171;
    float _203 = _199;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _161 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _161);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_171;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _161 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _187 = _257;
    }
    float _259 = _187;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _263 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _265 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _269 = fma(_259, _173, _263);
    float _271 = fma(_259, _175, _265);
    float _273 = fma(_259, _177, _267);
    float _275 = fma(_269, _157, _179);
    float _277 = fma(_271, _157, _181);
    float _279 = fma(_273, _157, _183);
    float _281 = _131 * _159;
    bool _283 = !_261;
    float _301;
    if (!_283)
    {
        float _285 = in.m_53.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        _301 = _281;
    }
    _303 = false;
    float _305 = _301;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _309 = _305 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _313 = _305 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _317 = _305 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _335 = 1.0 / _321;
    float _337 = 1.0 / _325;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _341 = _305 + _339;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _345 = 1.0 / _329;
    float _347 = _313 * _335;
    bool _349 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _351 = isnan(_305);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = 1.0 / _333;
    float _363 = _309 * _337;
    bool _365 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _367 = isnan(_305);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _377;
    float _381 = -_375;
    float _383 = _381 + 1.0;
    float _385 = _317 * _345;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _391;
    float _395 = fma(_379, _347, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _397 = fma(_389, _347, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _399 = fma(_393, _347, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _401 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _403 = isnan(_305);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = _341 * _361;
    bool _415 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _417 = isnan(_305);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _359 * _383;
    float _429 = -_359;
    float _431 = _429 + 1.0;
    bool _433 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _435 = isnan(_305);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _449 = -_425;
    float _451 = _449 + 1.0;
    float _453 = _425 * _431;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _463 = _411 * _451;
    float _465 = -_411;
    float _467 = _465 + 1.0;
    float _469 = fma(_447, _363, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _471 = fma(_457, _363, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _473 = fma(_461, _363, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _475 = _443 * _467;
    float _477 = -_443;
    float _479 = _477 + 1.0;
    float _481 = _395 * _475;
    float _483 = _397 * _475;
    float _485 = _399 * _475;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _487;
    float _491 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[107].x, _481);
    float _493 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[107].y, _483);
    float _495 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[107].z, _485);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _497;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _501;
    float _505 = fma(_489, _385, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _507 = fma(_469, _463, _491);
    float _509 = fma(_473, _463, _495);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _515 = fma(_499, _385, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _517 = fma(_471, _463, _493);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _523 = fma(_503, _385, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _529 = fma(_505, _453, _507);
    float _531 = fma(_513, _413, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _533 = fma(_521, _413, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _535 = fma(_515, _453, _517);
    float _537 = fma(_527, _413, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _539 = fma(_523, _453, _509);
    float _541 = fma(_531, _427, _529);
    float _543 = fma(_533, _427, _535);
    float _545 = fma(_537, _427, _539);
    float _547 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[111].x, _541);
    float _549 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[111].y, _543);
    float _551 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[111].z, _545);
    bool _553 = !_343;
    float _571;
    if (!_553)
    {
        float _555 = in.m_53.x;
        float _557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _559 = _555 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _561 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _563 = _561 * _557;
        float _565 = floor(_563);
        float _567 = -_565;
        float _569 = _563 + _567;
        _571 = _569;
        _573 = true;
    }
    else
    {
        _571 = _281;
    }
    _573 = false;
    float _575 = _571;
    int _577 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _579 = _577;
    int _581 = 0;
    int _583 = _96(_579, _581, (*spvDescriptorSet0.support_buffer));
    float _585 = in.m_55.z;
    float _587 = 0.0 + _281;
    float _589 = precise::clamp(_587, 0.0, 1.0);
    float _591 = trunc(_585);
    int _593 = int(_591);
    int _595 = _583 + (-1);
    float _597 = float(_595);
    float _599 = _589 * _597;
    float _601 = trunc(_599);
    int _603 = int(_601);
    int _605 = _603;
    int _607 = 0;
    int _609 = _97(_605, _607, (*spvDescriptorSet0.support_buffer));
    int _611 = _593;
    int _613 = 0;
    int _615 = _97(_611, _613, (*spvDescriptorSet0.support_buffer));
    float4 _618 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_609, _615)), 0).xyzw;
    float _620 = _618.x;
    float _622 = _618.y;
    float _624 = _618.z;
    float _626 = _618.w;
    float _628 = in.m_53.x;
    float _630 = in.m_53.y;
    float _632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _634 = in.m_55.x;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _638 = _636 != 0;
    float _640 = _547 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _646 = in.m_55.y;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _650 = _648 != 0;
    float _652 = 1.0 / _644;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _660 = 0.0;
    float _662 = _646;
    if (_638)
    {
        float _664 = in.m_53.x;
        _660 = _664;
    }
    float _666 = _660;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _672 = 1.0 / _658;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _676 = _628 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _678 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[78].z, _654);
    float _680 = _630 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _682 = -_668;
    float _684 = fma(_676, 2.0, _682);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _686;
    float _690 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[78].w, _670);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _696 = fma(_680, -2.0, _674);
    float _698 = _688 * _652;
    float _700 = 1.0 / _694;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _706 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _708 = isnan(_575);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = -_131;
    float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[76].x, _684);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _726 = _704 * _672;
    bool _728 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _730 = isnan(_575);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -_716;
    float _742 = _740 + 1.0;
    float _744 = 1.0 / _724;
    bool _746 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _748 = isnan(_575);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _758;
    bool _762 = _630 > 0.5;
    bool _764 = _762 && _650;
    float _766 = _738 * _742;
    bool _768 = _666 > 0.5;
    bool _770 = _768 && _638;
    float _772 = -_738;
    float _774 = _772 + 1.0;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _778 = _575 + _776;
    bool _780 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _782 = isnan(_575);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _760 * _700;
    float _794 = -_756;
    float _796 = _794 + 1.0;
    float _798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _800 = _756 * _774;
    float _802 = fma(_698, _778, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _804 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _806 = isnan(_575);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = _790 * _796;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _822 = -_790;
    float _824 = _822 + 1.0;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _828 = _802;
    if (_638)
    {
        _826 = _634;
    }
    float _830 = _826;
    float _832 = _830;
    if (_764)
    {
        float _834 = -_646;
        float _836 = _834 + 1.0;
        _662 = _836;
    }
    float _838 = _662;
    float _840 = _820 * _744;
    float _842 = _814 * _824;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _846 = _575 + _844;
    if (_770)
    {
        float _848 = -_830;
        float _850 = _848 + 1.0;
        _832 = _850;
    }
    float _852 = _832;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _856 = _575 + _854;
    float _858 = _802 * _842;
    if (!_638)
    {
        _828 = _634;
    }
    float _860 = _828;
    float _862 = fma(_726, _846, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _864 = _860;
    if (_638)
    {
        _864 = _852;
    }
    float _866 = _864;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _870 = _575 + _868;
    float _872 = _798 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _874 = -_814;
    float _876 = _874 + 1.0;
    float _878 = fma(_792, _856, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _880 = fma(_840, _870, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _882 = fma(_872, _866, -0.5);
    float _884 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _678);
    float _886 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[115].x, _858);
    float _888 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _690);
    float _890 = _632 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _892 = fma(_884, _882, _720);
    float _894 = fma(_862, _816, _886);
    int _896 = _603 + 1;
    float _898 = fma(_890, _838, -0.5);
    float _900 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _696);
    float _902 = fma(_878, _800, _894);
    int _904 = min(_595, _896);
    float _906 = in.m_51.x;
    float _908 = in.m_51.y;
    float _910 = in.m_51.z;
    float _912 = fma(_880, _766, _902);
    float _914 = -_900;
    float _916 = fma(_888, _898, _914);
    float _918 = _892 + 0.5;
    float _920 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[119].x, _912);
    out.m_57.x = (*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _922 = _920 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _926 = _908 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _928 = _906 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _930 = _910 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _932 = _549 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _934 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    uint _941 = as_type<uint>(half2(float2(_626, 0.0)));
    uint _943 = extract_bits(_941, 0u, 8u);
    int _945 = int(_943) & 255;
    uint _947 = extract_bits(_941, 8u, 8u);
    int _949 = int(_947) & 255;
    int _951 = _949 << 8;
    int _953 = _945 | _951;
    bool _955 = _953 >= 32768;
    int _957 = _953 + (-1024);
    int _959 = _957;
    if (_955)
    {
        int _961 = ~_953;
        int _963 = _961 + 33792;
        int _965 = _963 + 1;
        _959 = _965;
    }
    int _967 = _959;
    int _969 = _967 + 30719;
    float _971 = float(_969);
    float _973 = fma(_971, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _975 = abs(_973);
    float _977 = -_975;
    float _979 = _977 + 1.0;
    bool _981 = _973 < 0.0;
    float _983 = float(_981);
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _987 = abs(_973);
    float _989 = fma(_987, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _991 = _916 + 0.5;
    int _993 = as_type<int>(_979) + (-218103808);
    float _995 = abs(_973);
    float _997 = fma(_995, _989, -0.212114393711090087890625);
    bool _999 = uint(_993) >= 1920991232u;
    float _1001 = _551 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1003 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1005 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1007 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1009 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = abs(_973);
    float _1015 = fma(_1013, _997, 1.570728778839111328125);
    bool _1017 = !_999;
    float _1035;
    if (!_1017)
    {
        int _1019 = as_type<int>(_979);
        int _1021 = as_type<int>(_916);
        int _1023 = 5008;
        int _1025;
        int _1027;
        int _1029;
        int _1031;
        int _1033;
        _94(_1019, _1021, _1023, _1025, _1027, _1029, _1031, _1033, out.gl_Position, out.gl_PointSize);
        _1035 = as_type<float>(_1029);
        _1037 = true;
    }
    else
    {
        float _1039 = rsqrt(_979);
        float _1041 = _979 * _1039;
        float _1043 = _1039 * 0.5;
        float _1045 = -_1041;
        float _1047 = 0.0 + _1045;
        float _1049 = fma(_1043, _1047, 0.5);
        float _1051 = fma(_1041, _1049, _1041);
        float _1053 = -_1051;
        float _1055 = 0.0 + _1053;
        float _1057 = fma(_1051, _1055, _979);
        float _1059 = fma(_1043, _1057, _1051);
        _1035 = _1059;
    }
    _1037 = false;
    float _1061 = _1035;
    int _1063 = _904;
    int _1065 = 0;
    int _1067 = _97(_1063, _1065, (*spvDescriptorSet0.support_buffer));
    int _1069 = _593;
    int _1071 = 0;
    int _1073 = _97(_1069, _1071, (*spvDescriptorSet0.support_buffer));
    float4 _1075 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1067, _1073)), 0).xyzw;
    float _1077 = _1075.x;
    float _1079 = _1075.y;
    float _1081 = _1075.z;
    float _1083 = _1075.w;
    float _1085 = floor(_599);
    float _1087 = _1015 * _1061;
    float _1089 = _983 * 2.0;
    float _1091 = _971 * 3.883221149444580078125;
    float _1093 = -_1089;
    float _1095 = fma(_1087, _1093, _1087);
    float _1097 = _1091 * 0.15915493667125701904296875;
    float _1099 = fma(_983, 3.1415927410125732421875, _1095);
    float _1101 = _1097 * 6.283185482025146484375;
    float _1103 = cos(_1101);
    float _1105 = _1099 * 0.15915493667125701904296875;
    float _1107 = -_1085;
    float _1109 = _599 + _1107;
    float _1111 = _1105 * 6.283185482025146484375;
    float _1113 = sin(_1111);
    float _1115 = _1097 * 6.283185482025146484375;
    float _1117 = sin(_1115);
    float _1119 = _1113 * _1103;
    float _1121 = _1113 * _1117;
    uint _1123 = as_type<uint>(half2(float2(_1083, 0.0)));
    float _1125 = -_620;
    float _1127 = _1125 + _1077;
    uint _1129 = extract_bits(_1123, 0u, 8u);
    int _1131 = int(_1129) & 255;
    uint _1133 = extract_bits(_1123, 8u, 8u);
    int _1135 = int(_1133) & 255;
    int _1137 = _1135 << 8;
    int _1139 = _1131 | _1137;
    float _1141 = fma(_1109, _1127, _620);
    bool _1143 = _1139 >= 32768;
    int _1145 = _1139 + (-1024);
    int _1147 = _1145;
    if (_1143)
    {
        int _1149 = ~_1139;
        int _1151 = _1149 + 33792;
        int _1153 = _1151 + 1;
        _1147 = _1153;
    }
    int _1155 = _1147;
    int _1157 = _1155 + 30719;
    float _1159 = float(_1157);
    float _1161 = -_622;
    float _1163 = _1161 + _1079;
    float _1165 = fma(_1159, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1167 = fma(_1109, _1163, _622);
    float _1169 = abs(_1165);
    float _1171 = -_1169;
    float _1173 = _1171 + 1.0;
    float _1175 = abs(_1165);
    float _1177 = fma(_1175, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1179 = _1165 < 0.0;
    float _1181 = float(_1179);
    int _1183 = as_type<int>(_1173) + (-218103808);
    float _1185 = abs(_1165);
    float _1187 = fma(_1185, _1177, -0.212114393711090087890625);
    bool _1189 = uint(_1183) >= 1920991232u;
    float _1191 = -_624;
    float _1193 = _1191 + _1081;
    float _1195 = abs(_1165);
    float _1197 = fma(_1195, _1187, 1.570728778839111328125);
    float _1199 = fma(_1109, _1193, _624);
    bool _1201 = !_1189;
    float _1219;
    if (!_1201)
    {
        int _1203 = as_type<int>(_1173);
        int _1205 = as_type<int>(_1079);
        int _1207 = 5920;
        int _1209;
        int _1211;
        int _1213;
        int _1215;
        int _1217;
        _94(_1203, _1205, _1207, _1209, _1211, _1213, _1215, _1217, out.gl_Position, out.gl_PointSize);
        _1219 = as_type<float>(_1213);
        _1221 = true;
    }
    else
    {
        float _1223 = rsqrt(_1173);
        float _1225 = _1173 * _1223;
        float _1227 = _1223 * 0.5;
        float _1229 = -_1225;
        float _1231 = 0.0 + _1229;
        float _1233 = fma(_1227, _1231, 0.5);
        float _1235 = fma(_1225, _1233, _1225);
        float _1237 = -_1235;
        float _1239 = 0.0 + _1237;
        float _1241 = fma(_1235, _1239, _1173);
        float _1243 = fma(_1227, _1241, _1235);
        _1219 = _1243;
    }
    _1221 = false;
    float _1245 = _1219;
    float _1247 = in.m_53.x;
    float _1249 = in.m_53.y;
    float _1251 = in.m_53.z;
    float _1253 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1255 = log2(_1253);
    float _1257 = in.m_59.x;
    float _1259 = in.m_59.y;
    float _1261 = in.m_59.z;
    float _1263 = in.m_61.x;
    float _1265 = in.m_61.y;
    float _1267 = in.m_61.z;
    float _1269 = _1255 * _131;
    float _1271 = exp2(_1269);
    float _1273 = _1251 * 2.0;
    float _1275 = _1247 * 2.0;
    float _1277 = _277 * _1259;
    float _1279 = floor(_1273);
    float _1281 = fma(_275, _1257, _1277);
    float _1283 = _1249 * 2.0;
    float _1285 = _277 * _1265;
    float _1287 = fma(_279, _1261, _1281);
    float _1289 = fma(_275, _1263, _1285);
    float _1291 = floor(_1283);
    int _1293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1295 = _1293 != 0;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1299 = _1297 != 0;
    int _1301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1303 = _1301 != 0;
    float _1305 = _1251 + _1247;
    float _1307 = fma(_279, _1267, _1289);
    float _1309 = _1249 + _1247;
    float _1311 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1313 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1311;
    float _1315 = _1305 + (-1.0);
    bool _1317 = !_1303;
    int _1319 = _1317 ? 0 : 1;
    float _1321 = floor(_1275);
    bool _1323 = _1279 > 0.0;
    float _1325 = _1309 + (-1.0);
    bool _1327 = _1279 >= 0.0;
    bool _1329 = isnan(_1279);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan(0.0);
    bool _1335 = _1331 || _1333;
    float _1337 = -_1271;
    float _1339 = _1337 + 1.0;
    float _1341 = _1307 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1343 = _1335 ? 0 : 1;
    float _1345 = _1247 + (-0.5);
    bool _1347 = _1291 >= 0.0;
    bool _1349 = isnan(_1291);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    float _1357 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1359 = ~_1343;
    int _1361 = _1359 + 1;
    int _1363 = _1361 + 1;
    float _1365 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1367 = _1287 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1369 = _1363;
    float _1371 = _1313;
    if (!_1323)
    {
        int _1373 = ~_1343;
        int _1375 = _1373 + 1;
        _1369 = _1375;
    }
    int _1377 = _1369;
    bool _1379 = _1291 > 0.0;
    float _1381 = in.m_63.x;
    float _1383 = in.m_63.y;
    float _1385 = in.m_63.z;
    bool _1387 = !_1295;
    int _1389 = _1387 ? 0 : 1;
    float _1391 = -_1367;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1395 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1397 = isnan(1.0);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1403 = _1399 || _1401;
    float _1405 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1407 = 1.0 + _1405;
    bool _1409 = _1321 > 0.0;
    bool _1411 = _1321 >= 0.0;
    bool _1413 = isnan(_1321);
    bool _1415 = _1411 || _1413;
    bool _1417 = isnan(0.0);
    bool _1419 = _1415 || _1417;
    float _1421 = 1.0 / _1407;
    int _1423 = abs(_1389);
    float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1427 = _1341 + _1425;
    bool _1429 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1431 = isnan(0.0);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1437 = _1433 || _1435;
    float _1439 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1441 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1439;
    float _1443 = float(_1377);
    float _1445 = float(_1423);
    float _1447 = abs(_1313);
    float _1449 = abs(_1441);
    float _1451 = precise::max(_1447, _1449);
    float _1453 = _1437 ? _1339 : 0.0;
    float _1455 = _1445 * _1443;
    int _1457 = _1355 ? 0 : 1;
    bool _1459 = _1451 >= 16.0;
    float _1461 = _1427;
    float _1463 = _1393;
    float _1465 = _1441;
    if (_1403)
    {
        float _1467 = _1453 * _1421;
        _149 = _1467;
    }
    float _1469 = _149;
    float _1471 = abs(_1427);
    float _1473 = abs(_1393);
    float _1475 = precise::max(_1471, _1473);
    int _1477 = ~_1457;
    int _1479 = _1477 + 1;
    int _1481 = _1479 + 1;
    bool _1483 = !_1299;
    int _1485 = _1483 ? 0 : 1;
    int _1487 = _1481;
    if (!_1379)
    {
        int _1489 = ~_1457;
        int _1491 = _1489 + 1;
        _1487 = _1491;
    }
    int _1493 = _1487;
    int _1495 = abs(_1319);
    float _1497 = _1455 * (-2.0);
    bool _1499 = _1475 >= 16.0;
    bool _1501 = _1499;
    if (_1459)
    {
        float _1503 = _1313 * 0.0625;
        _1371 = _1503;
    }
    float _1505 = _1371;
    int _1507 = abs(_1485);
    float _1509 = fma(_1497, _1381, _1381);
    float _1511 = float(_1495);
    float _1513 = fma(_1365, _1497, _1365);
    float _1515 = float(_1493);
    float _1517 = _1251 + (-0.5);
    int _1519 = _1419 ? 0 : 1;
    float _1521 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1509);
    float _1523 = _1511 * _1515;
    int _1525 = ~_1519;
    int _1527 = _1525 + 1;
    int _1529 = _1527 + 1;
    int _1531 = _1529;
    if (_1499)
    {
        float _1533 = _1427 * 0.0625;
        _1461 = _1533;
    }
    float _1535 = _1461;
    if (!_1409)
    {
        int _1537 = ~_1519;
        int _1539 = _1537 + 1;
        _1531 = _1539;
    }
    int _1541 = _1531;
    float _1543 = _1523 * (-2.0);
    if (_1499)
    {
        float _1545 = _1393 * 0.0625;
        _1463 = _1545;
    }
    float _1547 = _1463;
    float _1549 = fma(_1513, _1469, _1521);
    float _1551 = abs(_1535);
    bool _1553 = _1551 != 0.0;
    bool _1555 = isnan(_1551);
    bool _1557 = _1553 || _1555;
    bool _1559 = isnan(0.0);
    bool _1561 = _1557 || _1559;
    float _1563 = fma(_1543, _1385, _1385);
    float _1565 = fma(_1357, _1543, _1357);
    float _1567 = float(_1507);
    float _1569 = _1251 + _1249;
    float _1571 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1563);
    float _1573 = float(_1541);
    float _1575 = _1249 + (-0.5);
    float _1577 = abs(_1547);
    bool _1579 = _1577 == 0.0;
    bool _1581 = !_1561;
    bool _1583 = _1579 && _1581;
    float _1585 = fma(_1565, _1469, _1571);
    float _1587 = _1569 + (-1.0);
    float _1589 = _1567 * _1573;
    float _1591 = abs(_1547);
    bool _1593 = _1591 == 0.0;
    float _1595 = _1585 * 0.15915493667125701904296875;
    float _1597 = _1589 * (-2.0);
    float _1599 = _1549 * 0.15915493667125701904296875;
    float _1601 = _1595 * 6.283185482025146484375;
    float _1603 = sin(_1601);
    float _1605 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1607 = fma(_1597, _1383, _1383);
    int _1609 = as_type<int>(_1607);
    int _1611 = as_type<int>(_1573);
    float _1613 = _1595;
    if (_1583)
    {
        bool _1615 = as_type<int>(_1547) >= 0;
        _1501 = _1615;
    }
    bool _1617 = _1501;
    float _1619 = fma(_1605, _1597, _1605);
    float _1621 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1607);
    float _1623 = _1621;
    int _1625 = _1617 ? (-1) : 0;
    int _1627 = as_type<int>(_1619);
    bool _1629 = _1617;
    if (_1583)
    {
        int _1631 = _1617 ? 0 : 1078530011;
        _1609 = _1631;
    }
    int _1633 = _1609;
    float _1635 = _1599 * 6.283185482025146484375;
    float _1637 = sin(_1635);
    float _1639 = _1599 * 6.283185482025146484375;
    float _1641 = cos(_1639);
    float _1643 = fma(_1619, _1469, _1621);
    if (_1583)
    {
        int _1645 = int(0x80000000) & as_type<int>(_1535);
        int _1647 = _1633 | _1645;
        _1623 = as_type<float>(_1647);
    }
    float _1649 = _1623;
    bool _1651 = !_1561;
    bool _1653 = _1651 && _1593;
    float _1655 = _1649;
    float _1657 = _1649;
    if (!_1653)
    {
        float _1659 = abs(_1535);
        bool _1661 = _1659 != as_type<float>(0x7f800000u /* inf */);
        bool _1663 = isnan(_1659);
        bool _1665 = _1661 || _1663;
        bool _1667 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1669 = _1665 || _1667;
        float _1671 = abs(_1547);
        bool _1673 = _1671 == as_type<float>(0x7f800000u /* inf */);
        float _1675 = abs(_1547);
        bool _1677 = _1675 == as_type<float>(0x7f800000u /* inf */);
        bool _1679 = !_1669;
        bool _1681 = _1677 && _1679;
        if (_1681)
        {
            bool _1683 = as_type<int>(_1547) >= 0;
            _1625 = _1683 ? (-1) : 0;
        }
        int _1685 = _1625;
        _1629 = _1685 != 0;
        if (_1681)
        {
            _1627 = 1075235812;
        }
        int _1687 = _1627;
        int _1689 = _1687;
        if (_1681)
        {
            int _1691 = ~_1685;
            int _1693 = (_1691 != 0) ? _1687 : 1061752795;
            _1689 = _1693;
        }
        int _1695 = _1689;
        if (_1681)
        {
            int _1697 = int(0x80000000) & as_type<int>(_1535);
            int _1699 = _1695 | _1697;
            _1655 = as_type<float>(_1699);
        }
        float _1701 = _1655;
        bool _1703 = !_1669;
        bool _1705 = _1703 && _1673;
        _1657 = _1701;
        if (!_1705)
        {
            float _1707 = abs(_1535);
            float _1709 = abs(_1547);
            float _1711 = precise::max(_1707, _1709);
            float _1713 = abs(_1535);
            float _1715 = abs(_1547);
            float _1717 = precise::min(_1713, _1715);
            float _1719 = 1.0 / _1711;
            float _1721 = abs(_1535);
            float _1723 = abs(_1547);
            bool _1725 = _1721 > _1723;
            bool _1727 = as_type<int>(_1547) >= 0;
            float _1729 = _1717 * _1719;
            float _1731 = abs(_1535);
            float _1733 = abs(_1547);
            float _1735 = _1731 + _1733;
            int _1737 = as_type<int>(_1535) & int(0x80000000);
            float _1739 = _1729 * _1729;
            bool _1741 = _1735 > as_type<float>(0x7f800000u /* inf */);
            bool _1743 = isnan(_1735);
            bool _1745 = _1741 || _1743;
            bool _1747 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1749 = _1745 || _1747;
            float _1751 = _1739 + 11.33538818359375;
            float _1753 = fma(_1739, _1751, 28.84246826171875);
            float _1755 = fma(_1739, _1753, 19.6966705322265625);
            float _1757 = fma(_1739, -0.82336294651031494140625, -5.674867153167724609375);
            float _1759 = fma(_1739, _1757, -6.565555095672607421875);
            float _1761 = 1.0 / _1755;
            float _1763 = _1739 * _1759;
            float _1765 = _1729 * _1763;
            float _1767 = fma(_1765, _1761, _1729);
            float _1769 = _1767;
            _1657 = _1735;
            _1629 = _1727;
            if (_1725)
            {
                float _1771 = -_1767;
                float _1773 = _1771 + 1.57079637050628662109375;
                _1769 = _1773;
            }
            float _1775 = _1769;
            int _1777 = as_type<int>(_1775);
            if (!_1727)
            {
                float _1779 = -_1775;
                float _1781 = _1779 + 3.1415927410125732421875;
                _1777 = as_type<int>(_1781);
            }
            int _1783 = _1777;
            if (!_1749)
            {
                int _1785 = _1737 | _1783;
                _1657 = as_type<float>(_1785);
            }
        }
    }
    float _1787 = _1657;
    bool _1789 = _1629;
    bool _1791 = _1789;
    if (_1459)
    {
        float _1793 = _1441 * 0.0625;
        _1465 = _1793;
    }
    float _1795 = _1465;
    float _1797 = abs(_1505);
    bool _1799 = _1797 != 0.0;
    bool _1801 = isnan(_1797);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan(0.0);
    bool _1807 = _1803 || _1805;
    float _1809 = -_1787;
    float _1811 = _1643 + _1809;
    float _1813 = _1595 * 6.283185482025146484375;
    float _1815 = cos(_1813);
    float _1817 = _928 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1819 = abs(_1795);
    bool _1821 = _1819 == 0.0;
    bool _1823 = !_1807;
    bool _1825 = _1821 && _1823;
    float _1827 = _1811 * 0.15915493667125701904296875;
    float _1829 = abs(_1795);
    bool _1831 = _1829 == 0.0;
    float _1833 = _926 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1835 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1141);
    float _1837 = _1827 * 6.283185482025146484375;
    float _1839 = sin(_1837);
    float _1841 = _930 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1843 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1167);
    float _1845 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1199);
    float _1847 = _1835 * _1817;
    float _1849 = _1843 * _1833;
    float _1851 = _1845 * _1841;
    float _1853 = _1827 * 6.283185482025146484375;
    float _1855 = cos(_1853);
    if (_1825)
    {
        bool _1857 = as_type<int>(_1795) >= 0;
        _1791 = _1857;
    }
    bool _1859 = _1791;
    float _1861 = _1637 * _1815;
    int _1863 = _1859 ? (-1) : 0;
    if (_1825)
    {
        int _1865 = _1859 ? 0 : 1078530011;
        _1611 = _1865;
    }
    int _1867 = _1611;
    int _1869 = _1867;
    if (_1825)
    {
        int _1871 = int(0x80000000) & as_type<int>(_1505);
        int _1873 = _1867 | _1871;
        _1613 = as_type<float>(_1873);
    }
    float _1875 = _1613;
    bool _1877 = !_1807;
    bool _1879 = _1877 && _1831;
    float _1881 = _1875;
    float _1883 = _1875;
    if (!_1879)
    {
        float _1885 = abs(_1505);
        bool _1887 = _1885 != as_type<float>(0x7f800000u /* inf */);
        bool _1889 = isnan(_1885);
        bool _1891 = _1887 || _1889;
        bool _1893 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1895 = _1891 || _1893;
        float _1897 = abs(_1795);
        bool _1899 = _1897 == as_type<float>(0x7f800000u /* inf */);
        float _1901 = abs(_1795);
        bool _1903 = _1901 == as_type<float>(0x7f800000u /* inf */);
        bool _1905 = !_1895;
        bool _1907 = _1903 && _1905;
        if (_1907)
        {
            bool _1909 = as_type<int>(_1795) >= 0;
            _1863 = _1909 ? (-1) : 0;
        }
        int _1911 = _1863;
        if (_1907)
        {
            _1869 = 1075235812;
        }
        int _1913 = _1869;
        int _1915 = _1913;
        if (_1907)
        {
            int _1917 = ~_1911;
            int _1919 = (_1917 != 0) ? _1913 : 1061752795;
            _1915 = _1919;
        }
        int _1921 = _1915;
        if (_1907)
        {
            int _1923 = int(0x80000000) & as_type<int>(_1505);
            int _1925 = _1921 | _1923;
            _1881 = as_type<float>(_1925);
        }
        float _1927 = _1881;
        bool _1929 = !_1895;
        bool _1931 = _1929 && _1899;
        _1883 = _1927;
        if (!_1931)
        {
            float _1933 = abs(_1505);
            float _1935 = abs(_1795);
            float _1937 = precise::max(_1933, _1935);
            float _1939 = abs(_1505);
            float _1941 = abs(_1795);
            float _1943 = precise::min(_1939, _1941);
            float _1945 = 1.0 / _1937;
            float _1947 = abs(_1505);
            float _1949 = abs(_1795);
            bool _1951 = _1947 > _1949;
            bool _1953 = as_type<int>(_1795) >= 0;
            float _1955 = _1943 * _1945;
            float _1957 = _1955 * _1955;
            float _1959 = _1957 + 11.33538818359375;
            float _1961 = fma(_1957, _1959, 28.84246826171875);
            float _1963 = fma(_1957, _1961, 19.6966705322265625);
            float _1965 = fma(_1957, -0.82336294651031494140625, -5.674867153167724609375);
            float _1967 = fma(_1957, _1965, -6.565555095672607421875);
            float _1969 = 1.0 / _1963;
            float _1971 = _1957 * _1967;
            float _1973 = abs(_1505);
            float _1975 = abs(_1795);
            float _1977 = _1973 + _1975;
            int _1979 = as_type<int>(_1505) & int(0x80000000);
            float _1981 = _1955 * _1971;
            bool _1983 = _1977 > as_type<float>(0x7f800000u /* inf */);
            bool _1985 = isnan(_1977);
            bool _1987 = _1983 || _1985;
            bool _1989 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1991 = _1987 || _1989;
            float _1993 = fma(_1981, _1969, _1955);
            float _1995 = _1993;
            _1883 = _1977;
            if (_1951)
            {
                float _1997 = -_1993;
                float _1999 = _1997 + 1.57079637050628662109375;
                _1995 = _1999;
            }
            float _2001 = _1995;
            int _2003 = as_type<int>(_2001);
            if (!_1953)
            {
                float _2005 = -_2001;
                float _2007 = _2005 + 3.1415927410125732421875;
                _2003 = as_type<int>(_2007);
            }
            int _2009 = _2003;
            if (!_1991)
            {
                int _2011 = _1979 | _2009;
                _1883 = as_type<float>(_2011);
            }
        }
    }
    float _2013 = _1883;
    float _2015 = _2013 * (-0.15915493667125701904296875);
    float _2017 = -_1849;
    float _2019 = _1603 * _2017;
    float _2021 = _1637 * _1855;
    float _2023 = _1641 * _1839;
    float _2025 = _1855 * _1815;
    float _2027 = _1637 * _1839;
    float _2029 = _1641 * _1855;
    float _2031 = _1839 * _1815;
    float _2033 = _1861 * _1849;
    float _2035 = _2015 * 6.283185482025146484375;
    float _2037 = sin(_2035);
    float _2039 = -_2023;
    float _2041 = fma(_1603, _2021, _2039);
    float _2043 = fma(_2025, _1847, _2019);
    float _2045 = fma(_1603, _2027, _2029);
    float _2047 = _1641 * _1815;
    float _2049 = fma(_2041, _1847, _2033);
    float _2051 = fma(_2031, _1851, _2043);
    float _2053 = fma(_1603, _2029, _2027);
    float _2055 = _2015 * 6.283185482025146484375;
    float _2057 = cos(_2055);
    float _2059 = fma(_2045, _1851, _2049);
    float _2061 = _1341 + _2051;
    float _2063 = -_2021;
    float _2065 = fma(_1603, _2023, _2063);
    float _2067 = _1367 + _2059;
    float _2069 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2071 = _2061 + _2069;
    float _2073 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2075 = _2067 + _2073;
    float _2077 = _2037 * _2071;
    float _2079 = _2057 * _2071;
    float _2081 = -_2077;
    float _2083 = fma(_2057, _2075, _2081);
    float _2085 = in.m_65.x;
    float _2087 = in.m_65.y;
    float _2089 = in.m_65.z;
    float _2091 = fma(_2037, _2075, _2079);
    float _2093 = _2083 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2095 = _2091 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2099 = _2093 + _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2103 = _2095 + _2101;
    float _2105 = _2099 * _2099;
    float _2107 = fma(_2103, _2103, _2105);
    float _2109 = sqrt(_2107);
    float _2111 = _277 * _2087;
    float _2113 = fma(_275, _2085, _2111);
    float _2115 = _2047 * _1849;
    float _2117 = fma(_279, _2089, _2113);
    float _2119 = fma(_2053, _1847, _2115);
    bool _2121 = _2109 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2123 = _2117 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2125 = fma(_2065, _1851, _2119);
    float _2127 = _2123 + _2125;
    float _2129 = _2123;
    float _2131 = _2089;
    float _2133 = _2125;
    float _2135 = _2107;
    float _2137 = _2021;
    if (!_2121)
    {
        _2129 = _2095;
    }
    float _2139 = _2129;
    float _2141 = _2139;
    if (!_2121)
    {
        _2131 = _2093;
    }
    float _2143 = _2131;
    float _2145 = _2143;
    if (!_2121)
    {
        _2133 = _2127;
    }
    float _2147 = _2133;
    bool _2149 = !_2121;
    float _2151 = _2147;
    if (!_2149)
    {
        float _2153 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2157 = _2109 + _2155;
        float _2159 = _2127 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2161 = rsqrt(_2107);
        float _2163 = _2157 * _2153;
        float _2165 = _2163 * 0.15915493667125701904296875;
        float _2167 = _2165 * 6.283185482025146484375;
        float _2169 = cos(_2167);
        float _2171 = _2165 * 6.283185482025146484375;
        float _2173 = sin(_2171);
        float _2175 = _2169 + (-1.0);
        float _2177 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2179 = fma(_2173, _2159, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2181 = fma(_2127, _2169, _2177);
        float _2183 = _2161 * _2179;
        float _2185 = fma(_2103, _2183, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2187 = fma(_2099, _2183, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2151 = _2181;
        _2141 = _2185;
        _2145 = _2187;
        _2135 = _2161;
    }
    float _2189 = _2151;
    float _2191 = _2141;
    float _2193 = _2145;
    float _2195 = _2135;
    float _2197 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2199 = _2189 + _2197;
    float _2201 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2203 = _2191 + _2201;
    float _2205 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2207 = _2193 + _2205;
    float _2209 = _2199 * _2199;
    float _2211 = fma(_2203, _2203, _2209);
    float _2213 = fma(_2207, _2207, _2211);
    float _2215 = rsqrt(_2213);
    float _2217 = sqrt(_2213);
    float _2219 = _2215 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2221 = _2203 * _2219;
    float _2223 = _2207 * _2219;
    float _2225 = _2221 * _2221;
    float _2227 = _2223 * _2223;
    float _2229 = _2225 + _2227;
    float _2231 = sqrt(_2229);
    bool _2233 = _2231 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2237 = _2231 + _2235;
    float _2239 = _1815;
    float _2241 = _2229;
    float _2243 = _2237;
    float _2245 = _2221;
    float _2247 = _2223;
    float _2249 = _2225;
    float _2251 = _2227;
    if (_2233)
    {
        float _2253 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2239 = _2253;
    }
    float _2255 = _2239;
    if (_2233)
    {
        float _2257 = rsqrt(_2229);
        _2241 = _2257;
    }
    float _2259 = _2241;
    if (_2233)
    {
        float _2261 = _2237 * _2255;
        _2243 = _2261;
    }
    float _2263 = _2243;
    if (_2233)
    {
        float _2265 = _2263 * 0.15915493667125701904296875;
        _2137 = _2265;
    }
    float _2267 = _2137;
    float _2269 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2271 = _2195;
    if (_2233)
    {
        float _2273 = _2267 * 6.283185482025146484375;
        float _2275 = sin(_2273);
        _2271 = _2275;
    }
    float _2277 = _2271;
    float _2279 = precise::max(0.0, _2269);
    float _2281 = _2263;
    float _2283 = _2279;
    if (_2233)
    {
        float _2285 = _2267 * 6.283185482025146484375;
        float _2287 = cos(_2285);
        _2281 = _2287;
    }
    float _2289 = _2281;
    float _2291 = -_2219;
    float _2293 = -_2279;
    float _2295 = fma(_2199, _2291, _2293);
    float _2297 = _2295;
    if (_2233)
    {
        float _2299 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2283 = _2299;
    }
    float _2301 = _2283;
    float _2303 = _2277;
    float _2305 = _2301;
    if (_2233)
    {
        float _2307 = fma(_2277, _2301, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2303 = _2307;
    }
    float _2309 = _2303;
    float _2311 = _2309;
    if (_2233)
    {
        float _2313 = _2259 * _2309;
        _2311 = _2313;
    }
    float _2315 = _2311;
    float _2317 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2319 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    if (_2233)
    {
        float _2321 = _2289 + (-1.0);
        _2305 = _2321;
    }
    float _2323 = _2305;
    float _2325 = _2323;
    if (_2233)
    {
        float _2327 = _2221 * _2315;
        _2245 = _2327;
    }
    float _2329 = _2245;
    if (_2233)
    {
        float _2331 = _2223 * _2315;
        _2247 = _2331;
    }
    float _2333 = _2247;
    float _2335 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2317);
    if (_2233)
    {
        float _2337 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2325 = _2337;
    }
    float _2339 = _2325;
    if (_2233)
    {
        float _2341 = _2329 * _2329;
        _2249 = _2341;
    }
    float _2343 = _2249;
    if (_2233)
    {
        float _2345 = _2333 * _2333;
        _2251 = _2345;
    }
    float _2347 = _2251;
    float _2349 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2335);
    if (_2233)
    {
        float _2351 = fma(_2295, _2289, _2339);
        _2297 = _2351;
    }
    float _2353 = _2297;
    float _2355 = fma(_2353, _2353, _2343);
    float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2359 = fma(_2217, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2357);
    float _2361 = precise::clamp(_2359, 0.0, 1.0);
    float _2363 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2365 = _2355 + _2347;
    float _2367 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2369 = -_2361;
    float _2371 = _2369 + 1.0;
    float _2373 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2363);
    float _2375 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2367);
    float _2377 = rsqrt(_2365);
    float _2379 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2373);
    float _2381 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2375);
    float _2383 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2385 = _2379 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2387 = _2381 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2389 = abs(_2371);
    float _2391 = log2(_2389);
    float _2393 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2383);
    float _2395 = _2385 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2397 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2399 = _2385 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2401 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2393);
    float _2403 = -_2397;
    float _2405 = fma(_2403, _2319, 1.0);
    float _2407 = _2377 * _2353;
    float _2409 = _2401 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2411 = _2377 * _2329;
    float _2413 = _2377 * _2333;
    float _2415 = _2349 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2417 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2395);
    float _2419 = _2411 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2421 = log2(_2405);
    float _2423 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2425 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2417);
    float _2427 = -_2419;
    float _2429 = fma(_2407, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2427);
    float _2431 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2399);
    float _2433 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2425);
    float _2435 = -_2413;
    float _2437 = fma(_2435, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2429);
    float _2439 = exp2(_2423);
    float _2441 = _2385 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2443 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2431);
    float _2445 = fma(_2437, -0.5, 0.5);
    float _2447 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2441);
    float _2449 = fma(_2437, 0.5, 0.5);
    float _2451 = _2407 + 1.0;
    float _2453 = 1.0 / _2433;
    float _2455 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2447);
    float _2457 = fma(_2449, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2459 = _2421 * 0.693147182464599609375;
    float _2461 = _2459 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2463 = sqrt(_2445);
    float _2465 = -_2407;
    float _2467 = fma(_2439, _2451, _2465);
    float _2469 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2455);
    float _2471 = fma(_2449, _2457, -0.212114393711090087890625);
    float _2473 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2443);
    float _2475 = fma(_2449, _2471, 1.570728778839111328125);
    float _2477 = _2469 * _2453;
    float _2479 = _2473 * _2453;
    float _2481 = fma(_2467, 0.5, 0.5);
    float _2483 = fma(_2477, 0.5, 0.5);
    float _2485 = fma(_2479, -0.5, 0.5);
    float _2487 = _2463 * 0.636619746685028076171875;
    float3 _6234 = float3(_2483, _2485, _2461);
    float _2489 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6234, float3(0.0), isnan(_6234)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6234, float3(0.0), isnan(_6234)), level(0.0)).x;
    float _2491 = -_2475;
    float _2493 = fma(_2487, _2491, 1.0);
    float3 _6250 = float3(_2483, _2485, _2461);
    float4 _2495 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6250, float3(0.0), isnan(_6250)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6250, float3(0.0), isnan(_6250)), level(0.0)).xyzw;
    float _2497 = _2495.x;
    float _2499 = _2495.y;
    float _2501 = _2495.z;
    float _2503 = _2495.w;
    float2 _6266 = float2(_2493, _2481);
    float3 _2507 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6266, float2(0.0), isnan(_6266)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6266, float2(0.0), isnan(_6266)), level(0.0)).xyz;
    float _2509 = _2507.x;
    float _2511 = _2507.y;
    float _2513 = _2507.z;
    float _2515 = _1197 * _1245;
    float _2517 = _1181 * 2.0;
    float _2519 = _1159 * 3.883221149444580078125;
    bool _2521 = _1167 != 0.0;
    bool _2523 = isnan(_1167);
    bool _2525 = _2521 || _2523;
    bool _2527 = isnan(0.0);
    bool _2529 = _2525 || _2527;
    float _2531 = -_973;
    float _2533 = _2531 + _1165;
    float _2535 = -_2517;
    float _2537 = fma(_2515, _2535, _2515);
    float _2539 = _2519 * 0.15915493667125701904296875;
    bool _2541 = _1141 == 0.0;
    bool _2543 = !_2529;
    bool _2545 = _2541 && _2543;
    float _2547 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2549 = fma(_1181, 3.1415927410125732421875, _2537);
    float _2551 = fma(_1109, _2533, _973);
    float _2553 = _2539 * 6.283185482025146484375;
    float _2555 = cos(_2553);
    bool _2557 = _1199 == 0.0;
    bool _2559 = _2557 && _2545;
    float _2561 = _2549 * 0.15915493667125701904296875;
    out.m_67.x = _934;
    out.m_67.y = _1003;
    out.m_67.z = _1009;
    out.m_67.w = _922;
    out.m_69.x = _1005;
    out.m_69.y = _1007;
    out.m_69.z = _1011;
    out.m_69.w = _985;
    float _2563 = _2561 * 6.283185482025146484375;
    float _2565 = sin(_2563);
    out.m_71.x = _918;
    out.m_71.y = _991;
    out.m_73.x = _1341;
    float _2567 = _2539 * 6.283185482025146484375;
    float _2569 = sin(_2567);
    float _2571 = _2385 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_73.z = _1367;
    float _2573 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2571);
    float _2575 = _2433 * 0.5;
    float _2577 = _2469 + _2433;
    float _2579 = exp2(_2547);
    float _2581 = -_1119;
    float _2583 = fma(_2565, _2555, _2581);
    float _2585 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2587 = _2577 * 0.5;
    out.m_75.x = _2191;
    out.m_75.y = _2189;
    out.m_75.z = _2193;
    float _2589 = fma(_1109, _2583, _1119);
    float _2591 = -_1121;
    float _2593 = fma(_2565, _2569, _2591);
    float _2595 = _2589;
    float _2597 = _2551;
    if (!_2559)
    {
        float _2599 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2589);
        _2595 = _2599;
    }
    float _2601 = _2595;
    out.m_47.x = _2585;
    float _2603 = fma(_1109, _2593, _1121);
    float _2605 = _2603;
    if (!_2559)
    {
        float _2607 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2551);
        _2597 = _2607;
    }
    float _2609 = _2597;
    if (!_2559)
    {
        float _2611 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2603);
        _2605 = _2611;
    }
    float _2613 = _2605;
    float _2615 = -_2579;
    float _2617 = _2615 + 1.0;
    float _2619 = -_2609;
    float _2621 = _1603 * _2619;
    float _2623 = _1861 * _2609;
    float _2625 = _2047 * _2609;
    float _2627 = _2617 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2629 = fma(_2025, _2601, _2621);
    float _2631 = fma(_2041, _2601, _2623);
    float _2633 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2573);
    float _2635 = fma(_2053, _2601, _2625);
    float _2637 = fma(_2031, _2613, _2629);
    float _2639 = fma(_2045, _2613, _2631);
    float _2641 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2633);
    float _2643 = _2637 * _2037;
    float _2645 = _2637 * _2057;
    float _2647 = _2641 + _2433;
    float _2649 = fma(_2065, _2613, _2635);
    float _2651 = -_2643;
    float _2653 = fma(_2639, _2057, _2651);
    float _2655 = fma(_2473, -0.5, _2575);
    float _2657 = -_2627;
    float _2659 = _2657 + 1.0;
    float _2661 = fma(_2639, _2037, _2645);
    float _2663 = _2647 * 0.5;
    out.gl_Position.x = _2469;
    out.gl_Position.y = _2473;
    out.gl_Position.z = _2641;
    out.gl_Position.w = _2433;
    out.m_77.x = _2661;
    out.m_77.y = _2649;
    out.m_77.z = _2653;
    out.m_79.x = _2587;
    out.m_79.y = _2655;
    out.m_79.z = _2663;
    out.m_79.w = _2433;
    float _2665 = _2627 * _2489;
    float _2667 = _2503 * _2665;
    float _2669 = _2513 * _2665;
    float _2671 = fma(_2509, _2667, _2497);
    float _2673 = fma(_2511, _2667, _2499);
    float _2675 = _2503 * _2659;
    float _2677 = fma(_2503, _2669, _2501);
    out.m_81.x = _2671;
    out.m_81.y = _2673;
    out.m_81.z = _2677;
    out.m_81.w = _2675;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1221 = false;
    bool _1037 = false;
    bool _573 = false;
    bool _303 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _105 = int(_103);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2735 = as_type<float>(_121);
        out.gl_Position.z = _2735;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_49.w;
    float _127 = float(_105);
    float _129 = -_125;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_125);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    bool _143 = _131 >= _127;
    bool _145 = !_141;
    bool _147 = _143 || _145;
    float _149 = _131;
    if (_147)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _113;
    if (_147)
    {
        out.m_47.x = 0.0;
    }
    if (_147)
    {
        float _153 = _151 * 5.0;
        _123 = as_type<int>(_153);
    }
    int _155 = _123;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2799 = as_type<float>(_155);
        out.gl_Position.z = _2799;
    }
    if (_147)
    {
        return out;
    }
    float _157 = in.m_51.w;
    float _159 = 1.0 / _127;
    float _161 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = in.m_49.x;
    float _175 = in.m_49.y;
    float _177 = in.m_49.z;
    float _179 = in.m_44.x;
    float _181 = in.m_44.y;
    float _183 = in.m_44.z;
    float _185 = 0.0;
    float _187 = _161;
    if (!_171)
    {
        float _189 = _161 * _161;
        float _191 = _189 * 0.5;
        _185 = _191;
    }
    float _193 = _185;
    float _195 = _193;
    if (!_171)
    {
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _197;
    }
    float _199 = _195;
    bool _201 = !_171;
    float _203 = _199;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _161 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _161);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_171;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _161 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _187 = _257;
    }
    float _259 = _187;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _263 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _265 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _269 = fma(_259, _173, _263);
    float _271 = fma(_259, _175, _265);
    float _273 = fma(_259, _177, _267);
    float _275 = fma(_269, _157, _179);
    float _277 = fma(_271, _157, _181);
    float _279 = fma(_273, _157, _183);
    float _281 = _131 * _159;
    bool _283 = !_261;
    float _301;
    if (!_283)
    {
        float _285 = in.m_53.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        _301 = _281;
    }
    _303 = false;
    float _305 = _301;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _309 = _305 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _313 = _305 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _317 = _305 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _335 = 1.0 / _321;
    float _337 = 1.0 / _325;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _341 = _305 + _339;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _345 = 1.0 / _329;
    float _347 = _313 * _335;
    bool _349 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _351 = isnan(_305);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = 1.0 / _333;
    float _363 = _309 * _337;
    bool _365 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _367 = isnan(_305);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _377;
    float _381 = -_375;
    float _383 = _381 + 1.0;
    float _385 = _317 * _345;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _391;
    float _395 = fma(_379, _347, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _397 = fma(_389, _347, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _399 = fma(_393, _347, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _401 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _403 = isnan(_305);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = _341 * _361;
    bool _415 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _417 = isnan(_305);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _359 * _383;
    float _429 = -_359;
    float _431 = _429 + 1.0;
    bool _433 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _435 = isnan(_305);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _449 = -_425;
    float _451 = _449 + 1.0;
    float _453 = _425 * _431;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _463 = _411 * _451;
    float _465 = -_411;
    float _467 = _465 + 1.0;
    float _469 = fma(_447, _363, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _471 = fma(_457, _363, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _473 = fma(_461, _363, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _475 = _443 * _467;
    float _477 = -_443;
    float _479 = _477 + 1.0;
    float _481 = _395 * _475;
    float _483 = _397 * _475;
    float _485 = _399 * _475;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _487;
    float _491 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[107].x, _481);
    float _493 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[107].y, _483);
    float _495 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[107].z, _485);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _497;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _501;
    float _505 = fma(_489, _385, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _507 = fma(_469, _463, _491);
    float _509 = fma(_473, _463, _495);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _515 = fma(_499, _385, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _517 = fma(_471, _463, _493);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _523 = fma(_503, _385, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _529 = fma(_505, _453, _507);
    float _531 = fma(_513, _413, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _533 = fma(_521, _413, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _535 = fma(_515, _453, _517);
    float _537 = fma(_527, _413, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _539 = fma(_523, _453, _509);
    float _541 = fma(_531, _427, _529);
    float _543 = fma(_533, _427, _535);
    float _545 = fma(_537, _427, _539);
    float _547 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[111].x, _541);
    float _549 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[111].y, _543);
    float _551 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[111].z, _545);
    bool _553 = !_343;
    float _571;
    if (!_553)
    {
        float _555 = in.m_53.x;
        float _557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _559 = _555 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _561 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _563 = _561 * _557;
        float _565 = floor(_563);
        float _567 = -_565;
        float _569 = _563 + _567;
        _571 = _569;
        _573 = true;
    }
    else
    {
        _571 = _281;
    }
    _573 = false;
    float _575 = _571;
    int _577 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _579 = _577;
    int _581 = 0;
    int _583 = _96(_579, _581, (*spvDescriptorSet0.support_buffer));
    float _585 = in.m_55.z;
    float _587 = 0.0 + _281;
    float _589 = precise::clamp(_587, 0.0, 1.0);
    float _591 = trunc(_585);
    int _593 = int(_591);
    int _595 = _583 + (-1);
    float _597 = float(_595);
    float _599 = _589 * _597;
    float _601 = trunc(_599);
    int _603 = int(_601);
    int _605 = _603;
    int _607 = 0;
    int _609 = _97(_605, _607, (*spvDescriptorSet0.support_buffer));
    int _611 = _593;
    int _613 = 0;
    int _615 = _97(_611, _613, (*spvDescriptorSet0.support_buffer));
    float4 _618 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_609, _615)), 0).xyzw;
    float _620 = _618.x;
    float _622 = _618.y;
    float _624 = _618.z;
    float _626 = _618.w;
    float _628 = in.m_53.x;
    float _630 = in.m_53.y;
    float _632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _634 = in.m_55.x;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _638 = _636 != 0;
    float _640 = _547 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _646 = in.m_55.y;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _650 = _648 != 0;
    float _652 = 1.0 / _644;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _660 = 0.0;
    float _662 = _646;
    if (_638)
    {
        float _664 = in.m_53.x;
        _660 = _664;
    }
    float _666 = _660;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _672 = 1.0 / _658;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _676 = _628 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _678 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[78].z, _654);
    float _680 = _630 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _682 = -_668;
    float _684 = fma(_676, 2.0, _682);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _686;
    float _690 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[78].w, _670);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _696 = fma(_680, -2.0, _674);
    float _698 = _688 * _652;
    float _700 = 1.0 / _694;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _706 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _708 = isnan(_575);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = -_131;
    float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[76].x, _684);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _726 = _704 * _672;
    bool _728 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _730 = isnan(_575);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -_716;
    float _742 = _740 + 1.0;
    float _744 = 1.0 / _724;
    bool _746 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _748 = isnan(_575);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _758;
    bool _762 = _630 > 0.5;
    bool _764 = _762 && _650;
    float _766 = _738 * _742;
    bool _768 = _666 > 0.5;
    bool _770 = _768 && _638;
    float _772 = -_738;
    float _774 = _772 + 1.0;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _778 = _575 + _776;
    bool _780 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _782 = isnan(_575);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _760 * _700;
    float _794 = -_756;
    float _796 = _794 + 1.0;
    float _798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _800 = _756 * _774;
    float _802 = fma(_698, _778, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _804 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _806 = isnan(_575);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = _790 * _796;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _822 = -_790;
    float _824 = _822 + 1.0;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _828 = _802;
    if (_638)
    {
        _826 = _634;
    }
    float _830 = _826;
    float _832 = _830;
    if (_764)
    {
        float _834 = -_646;
        float _836 = _834 + 1.0;
        _662 = _836;
    }
    float _838 = _662;
    float _840 = _820 * _744;
    float _842 = _814 * _824;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _846 = _575 + _844;
    if (_770)
    {
        float _848 = -_830;
        float _850 = _848 + 1.0;
        _832 = _850;
    }
    float _852 = _832;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _856 = _575 + _854;
    float _858 = _802 * _842;
    if (!_638)
    {
        _828 = _634;
    }
    float _860 = _828;
    float _862 = fma(_726, _846, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _864 = _860;
    if (_638)
    {
        _864 = _852;
    }
    float _866 = _864;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _870 = _575 + _868;
    float _872 = _798 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _874 = -_814;
    float _876 = _874 + 1.0;
    float _878 = fma(_792, _856, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _880 = fma(_840, _870, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _882 = fma(_872, _866, -0.5);
    float _884 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _678);
    float _886 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[115].x, _858);
    float _888 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _690);
    float _890 = _632 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _892 = fma(_884, _882, _720);
    float _894 = fma(_862, _816, _886);
    int _896 = _603 + 1;
    float _898 = fma(_890, _838, -0.5);
    float _900 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _696);
    float _902 = fma(_878, _800, _894);
    int _904 = min(_595, _896);
    float _906 = in.m_51.x;
    float _908 = in.m_51.y;
    float _910 = in.m_51.z;
    float _912 = fma(_880, _766, _902);
    float _914 = -_900;
    float _916 = fma(_888, _898, _914);
    float _918 = _892 + 0.5;
    float _920 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[119].x, _912);
    out.m_57.x = (*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _922 = _920 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _926 = _908 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _928 = _906 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _930 = _910 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _932 = _549 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _934 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    uint _941 = as_type<uint>(half2(float2(_626, 0.0)));
    uint _943 = extract_bits(_941, 0u, 8u);
    int _945 = int(_943) & 255;
    uint _947 = extract_bits(_941, 8u, 8u);
    int _949 = int(_947) & 255;
    int _951 = _949 << 8;
    int _953 = _945 | _951;
    bool _955 = _953 >= 32768;
    int _957 = _953 + (-1024);
    int _959 = _957;
    if (_955)
    {
        int _961 = ~_953;
        int _963 = _961 + 33792;
        int _965 = _963 + 1;
        _959 = _965;
    }
    int _967 = _959;
    int _969 = _967 + 30719;
    float _971 = float(_969);
    float _973 = fma(_971, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _975 = abs(_973);
    float _977 = -_975;
    float _979 = _977 + 1.0;
    bool _981 = _973 < 0.0;
    float _983 = float(_981);
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _987 = abs(_973);
    float _989 = fma(_987, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _991 = _916 + 0.5;
    int _993 = as_type<int>(_979) + (-218103808);
    float _995 = abs(_973);
    float _997 = fma(_995, _989, -0.212114393711090087890625);
    bool _999 = uint(_993) >= 1920991232u;
    float _1001 = _551 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1003 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1005 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1007 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1009 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = abs(_973);
    float _1015 = fma(_1013, _997, 1.570728778839111328125);
    bool _1017 = !_999;
    float _1035;
    if (!_1017)
    {
        int _1019 = as_type<int>(_979);
        int _1021 = as_type<int>(_916);
        int _1023 = 5008;
        int _1025;
        int _1027;
        int _1029;
        int _1031;
        int _1033;
        _94(_1019, _1021, _1023, _1025, _1027, _1029, _1031, _1033, out.gl_Position, out.gl_PointSize);
        _1035 = as_type<float>(_1029);
        _1037 = true;
    }
    else
    {
        float _1039 = rsqrt(_979);
        float _1041 = _979 * _1039;
        float _1043 = _1039 * 0.5;
        float _1045 = -_1041;
        float _1047 = 0.0 + _1045;
        float _1049 = fma(_1043, _1047, 0.5);
        float _1051 = fma(_1041, _1049, _1041);
        float _1053 = -_1051;
        float _1055 = 0.0 + _1053;
        float _1057 = fma(_1051, _1055, _979);
        float _1059 = fma(_1043, _1057, _1051);
        _1035 = _1059;
    }
    _1037 = false;
    float _1061 = _1035;
    int _1063 = _904;
    int _1065 = 0;
    int _1067 = _97(_1063, _1065, (*spvDescriptorSet0.support_buffer));
    int _1069 = _593;
    int _1071 = 0;
    int _1073 = _97(_1069, _1071, (*spvDescriptorSet0.support_buffer));
    float4 _1075 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1067, _1073)), 0).xyzw;
    float _1077 = _1075.x;
    float _1079 = _1075.y;
    float _1081 = _1075.z;
    float _1083 = _1075.w;
    float _1085 = floor(_599);
    float _1087 = _1015 * _1061;
    float _1089 = _983 * 2.0;
    float _1091 = _971 * 3.883221149444580078125;
    float _1093 = -_1089;
    float _1095 = fma(_1087, _1093, _1087);
    float _1097 = _1091 * 0.15915493667125701904296875;
    float _1099 = fma(_983, 3.1415927410125732421875, _1095);
    float _1101 = _1097 * 6.283185482025146484375;
    float _1103 = cos(_1101);
    float _1105 = _1099 * 0.15915493667125701904296875;
    float _1107 = -_1085;
    float _1109 = _599 + _1107;
    float _1111 = _1105 * 6.283185482025146484375;
    float _1113 = sin(_1111);
    float _1115 = _1097 * 6.283185482025146484375;
    float _1117 = sin(_1115);
    float _1119 = _1113 * _1103;
    float _1121 = _1113 * _1117;
    uint _1123 = as_type<uint>(half2(float2(_1083, 0.0)));
    float _1125 = -_620;
    float _1127 = _1125 + _1077;
    uint _1129 = extract_bits(_1123, 0u, 8u);
    int _1131 = int(_1129) & 255;
    uint _1133 = extract_bits(_1123, 8u, 8u);
    int _1135 = int(_1133) & 255;
    int _1137 = _1135 << 8;
    int _1139 = _1131 | _1137;
    float _1141 = fma(_1109, _1127, _620);
    bool _1143 = _1139 >= 32768;
    int _1145 = _1139 + (-1024);
    int _1147 = _1145;
    if (_1143)
    {
        int _1149 = ~_1139;
        int _1151 = _1149 + 33792;
        int _1153 = _1151 + 1;
        _1147 = _1153;
    }
    int _1155 = _1147;
    int _1157 = _1155 + 30719;
    float _1159 = float(_1157);
    float _1161 = -_622;
    float _1163 = _1161 + _1079;
    float _1165 = fma(_1159, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1167 = fma(_1109, _1163, _622);
    float _1169 = abs(_1165);
    float _1171 = -_1169;
    float _1173 = _1171 + 1.0;
    float _1175 = abs(_1165);
    float _1177 = fma(_1175, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1179 = _1165 < 0.0;
    float _1181 = float(_1179);
    int _1183 = as_type<int>(_1173) + (-218103808);
    float _1185 = abs(_1165);
    float _1187 = fma(_1185, _1177, -0.212114393711090087890625);
    bool _1189 = uint(_1183) >= 1920991232u;
    float _1191 = -_624;
    float _1193 = _1191 + _1081;
    float _1195 = abs(_1165);
    float _1197 = fma(_1195, _1187, 1.570728778839111328125);
    float _1199 = fma(_1109, _1193, _624);
    bool _1201 = !_1189;
    float _1219;
    if (!_1201)
    {
        int _1203 = as_type<int>(_1173);
        int _1205 = as_type<int>(_1079);
        int _1207 = 5920;
        int _1209;
        int _1211;
        int _1213;
        int _1215;
        int _1217;
        _94(_1203, _1205, _1207, _1209, _1211, _1213, _1215, _1217, out.gl_Position, out.gl_PointSize);
        _1219 = as_type<float>(_1213);
        _1221 = true;
    }
    else
    {
        float _1223 = rsqrt(_1173);
        float _1225 = _1173 * _1223;
        float _1227 = _1223 * 0.5;
        float _1229 = -_1225;
        float _1231 = 0.0 + _1229;
        float _1233 = fma(_1227, _1231, 0.5);
        float _1235 = fma(_1225, _1233, _1225);
        float _1237 = -_1235;
        float _1239 = 0.0 + _1237;
        float _1241 = fma(_1235, _1239, _1173);
        float _1243 = fma(_1227, _1241, _1235);
        _1219 = _1243;
    }
    _1221 = false;
    float _1245 = _1219;
    float _1247 = in.m_53.x;
    float _1249 = in.m_53.y;
    float _1251 = in.m_53.z;
    float _1253 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1255 = log2(_1253);
    float _1257 = in.m_59.x;
    float _1259 = in.m_59.y;
    float _1261 = in.m_59.z;
    float _1263 = in.m_61.x;
    float _1265 = in.m_61.y;
    float _1267 = in.m_61.z;
    float _1269 = _1255 * _131;
    float _1271 = exp2(_1269);
    float _1273 = _1251 * 2.0;
    float _1275 = _1247 * 2.0;
    float _1277 = _277 * _1259;
    float _1279 = floor(_1273);
    float _1281 = fma(_275, _1257, _1277);
    float _1283 = _1249 * 2.0;
    float _1285 = _277 * _1265;
    float _1287 = fma(_279, _1261, _1281);
    float _1289 = fma(_275, _1263, _1285);
    float _1291 = floor(_1283);
    int _1293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1295 = _1293 != 0;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1299 = _1297 != 0;
    int _1301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1303 = _1301 != 0;
    float _1305 = _1251 + _1247;
    float _1307 = fma(_279, _1267, _1289);
    float _1309 = _1249 + _1247;
    float _1311 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1313 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1311;
    float _1315 = _1305 + (-1.0);
    bool _1317 = !_1303;
    int _1319 = _1317 ? 0 : 1;
    float _1321 = floor(_1275);
    bool _1323 = _1279 > 0.0;
    float _1325 = _1309 + (-1.0);
    bool _1327 = _1279 >= 0.0;
    bool _1329 = isnan(_1279);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan(0.0);
    bool _1335 = _1331 || _1333;
    float _1337 = -_1271;
    float _1339 = _1337 + 1.0;
    float _1341 = _1307 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1343 = _1335 ? 0 : 1;
    float _1345 = _1247 + (-0.5);
    bool _1347 = _1291 >= 0.0;
    bool _1349 = isnan(_1291);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    float _1357 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1359 = ~_1343;
    int _1361 = _1359 + 1;
    int _1363 = _1361 + 1;
    float _1365 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1367 = _1287 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1369 = _1363;
    float _1371 = _1313;
    if (!_1323)
    {
        int _1373 = ~_1343;
        int _1375 = _1373 + 1;
        _1369 = _1375;
    }
    int _1377 = _1369;
    bool _1379 = _1291 > 0.0;
    float _1381 = in.m_63.x;
    float _1383 = in.m_63.y;
    float _1385 = in.m_63.z;
    bool _1387 = !_1295;
    int _1389 = _1387 ? 0 : 1;
    float _1391 = -_1367;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1395 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1397 = isnan(1.0);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1403 = _1399 || _1401;
    float _1405 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1407 = 1.0 + _1405;
    bool _1409 = _1321 > 0.0;
    bool _1411 = _1321 >= 0.0;
    bool _1413 = isnan(_1321);
    bool _1415 = _1411 || _1413;
    bool _1417 = isnan(0.0);
    bool _1419 = _1415 || _1417;
    float _1421 = 1.0 / _1407;
    int _1423 = abs(_1389);
    float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1427 = _1341 + _1425;
    bool _1429 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1431 = isnan(0.0);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1437 = _1433 || _1435;
    float _1439 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1441 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1439;
    float _1443 = float(_1377);
    float _1445 = float(_1423);
    float _1447 = abs(_1313);
    float _1449 = abs(_1441);
    float _1451 = precise::max(_1447, _1449);
    float _1453 = _1437 ? _1339 : 0.0;
    float _1455 = _1445 * _1443;
    int _1457 = _1355 ? 0 : 1;
    bool _1459 = _1451 >= 16.0;
    float _1461 = _1427;
    float _1463 = _1393;
    float _1465 = _1441;
    if (_1403)
    {
        float _1467 = _1453 * _1421;
        _149 = _1467;
    }
    float _1469 = _149;
    float _1471 = abs(_1427);
    float _1473 = abs(_1393);
    float _1475 = precise::max(_1471, _1473);
    int _1477 = ~_1457;
    int _1479 = _1477 + 1;
    int _1481 = _1479 + 1;
    bool _1483 = !_1299;
    int _1485 = _1483 ? 0 : 1;
    int _1487 = _1481;
    if (!_1379)
    {
        int _1489 = ~_1457;
        int _1491 = _1489 + 1;
        _1487 = _1491;
    }
    int _1493 = _1487;
    int _1495 = abs(_1319);
    float _1497 = _1455 * (-2.0);
    bool _1499 = _1475 >= 16.0;
    bool _1501 = _1499;
    if (_1459)
    {
        float _1503 = _1313 * 0.0625;
        _1371 = _1503;
    }
    float _1505 = _1371;
    int _1507 = abs(_1485);
    float _1509 = fma(_1497, _1381, _1381);
    float _1511 = float(_1495);
    float _1513 = fma(_1365, _1497, _1365);
    float _1515 = float(_1493);
    float _1517 = _1251 + (-0.5);
    int _1519 = _1419 ? 0 : 1;
    float _1521 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1509);
    float _1523 = _1511 * _1515;
    int _1525 = ~_1519;
    int _1527 = _1525 + 1;
    int _1529 = _1527 + 1;
    int _1531 = _1529;
    if (_1499)
    {
        float _1533 = _1427 * 0.0625;
        _1461 = _1533;
    }
    float _1535 = _1461;
    if (!_1409)
    {
        int _1537 = ~_1519;
        int _1539 = _1537 + 1;
        _1531 = _1539;
    }
    int _1541 = _1531;
    float _1543 = _1523 * (-2.0);
    if (_1499)
    {
        float _1545 = _1393 * 0.0625;
        _1463 = _1545;
    }
    float _1547 = _1463;
    float _1549 = fma(_1513, _1469, _1521);
    float _1551 = abs(_1535);
    bool _1553 = _1551 != 0.0;
    bool _1555 = isnan(_1551);
    bool _1557 = _1553 || _1555;
    bool _1559 = isnan(0.0);
    bool _1561 = _1557 || _1559;
    float _1563 = fma(_1543, _1385, _1385);
    float _1565 = fma(_1357, _1543, _1357);
    float _1567 = float(_1507);
    float _1569 = _1251 + _1249;
    float _1571 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1563);
    float _1573 = float(_1541);
    float _1575 = _1249 + (-0.5);
    float _1577 = abs(_1547);
    bool _1579 = _1577 == 0.0;
    bool _1581 = !_1561;
    bool _1583 = _1579 && _1581;
    float _1585 = fma(_1565, _1469, _1571);
    float _1587 = _1569 + (-1.0);
    float _1589 = _1567 * _1573;
    float _1591 = abs(_1547);
    bool _1593 = _1591 == 0.0;
    float _1595 = _1585 * 0.15915493667125701904296875;
    float _1597 = _1589 * (-2.0);
    float _1599 = _1549 * 0.15915493667125701904296875;
    float _1601 = _1595 * 6.283185482025146484375;
    float _1603 = sin(_1601);
    float _1605 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1607 = fma(_1597, _1383, _1383);
    int _1609 = as_type<int>(_1607);
    int _1611 = as_type<int>(_1573);
    float _1613 = _1595;
    if (_1583)
    {
        bool _1615 = as_type<int>(_1547) >= 0;
        _1501 = _1615;
    }
    bool _1617 = _1501;
    float _1619 = fma(_1605, _1597, _1605);
    float _1621 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1607);
    float _1623 = _1621;
    int _1625 = _1617 ? (-1) : 0;
    int _1627 = as_type<int>(_1619);
    bool _1629 = _1617;
    if (_1583)
    {
        int _1631 = _1617 ? 0 : 1078530011;
        _1609 = _1631;
    }
    int _1633 = _1609;
    float _1635 = _1599 * 6.283185482025146484375;
    float _1637 = sin(_1635);
    float _1639 = _1599 * 6.283185482025146484375;
    float _1641 = cos(_1639);
    float _1643 = fma(_1619, _1469, _1621);
    if (_1583)
    {
        int _1645 = int(0x80000000) & as_type<int>(_1535);
        int _1647 = _1633 | _1645;
        _1623 = as_type<float>(_1647);
    }
    float _1649 = _1623;
    bool _1651 = !_1561;
    bool _1653 = _1651 && _1593;
    float _1655 = _1649;
    float _1657 = _1649;
    if (!_1653)
    {
        float _1659 = abs(_1535);
        bool _1661 = _1659 != as_type<float>(0x7f800000u /* inf */);
        bool _1663 = isnan(_1659);
        bool _1665 = _1661 || _1663;
        bool _1667 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1669 = _1665 || _1667;
        float _1671 = abs(_1547);
        bool _1673 = _1671 == as_type<float>(0x7f800000u /* inf */);
        float _1675 = abs(_1547);
        bool _1677 = _1675 == as_type<float>(0x7f800000u /* inf */);
        bool _1679 = !_1669;
        bool _1681 = _1677 && _1679;
        if (_1681)
        {
            bool _1683 = as_type<int>(_1547) >= 0;
            _1625 = _1683 ? (-1) : 0;
        }
        int _1685 = _1625;
        _1629 = _1685 != 0;
        if (_1681)
        {
            _1627 = 1075235812;
        }
        int _1687 = _1627;
        int _1689 = _1687;
        if (_1681)
        {
            int _1691 = ~_1685;
            int _1693 = (_1691 != 0) ? _1687 : 1061752795;
            _1689 = _1693;
        }
        int _1695 = _1689;
        if (_1681)
        {
            int _1697 = int(0x80000000) & as_type<int>(_1535);
            int _1699 = _1695 | _1697;
            _1655 = as_type<float>(_1699);
        }
        float _1701 = _1655;
        bool _1703 = !_1669;
        bool _1705 = _1703 && _1673;
        _1657 = _1701;
        if (!_1705)
        {
            float _1707 = abs(_1535);
            float _1709 = abs(_1547);
            float _1711 = precise::max(_1707, _1709);
            float _1713 = abs(_1535);
            float _1715 = abs(_1547);
            float _1717 = precise::min(_1713, _1715);
            float _1719 = 1.0 / _1711;
            float _1721 = abs(_1535);
            float _1723 = abs(_1547);
            bool _1725 = _1721 > _1723;
            bool _1727 = as_type<int>(_1547) >= 0;
            float _1729 = _1717 * _1719;
            float _1731 = abs(_1535);
            float _1733 = abs(_1547);
            float _1735 = _1731 + _1733;
            int _1737 = as_type<int>(_1535) & int(0x80000000);
            float _1739 = _1729 * _1729;
            bool _1741 = _1735 > as_type<float>(0x7f800000u /* inf */);
            bool _1743 = isnan(_1735);
            bool _1745 = _1741 || _1743;
            bool _1747 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1749 = _1745 || _1747;
            float _1751 = _1739 + 11.33538818359375;
            float _1753 = fma(_1739, _1751, 28.84246826171875);
            float _1755 = fma(_1739, _1753, 19.6966705322265625);
            float _1757 = fma(_1739, -0.82336294651031494140625, -5.674867153167724609375);
            float _1759 = fma(_1739, _1757, -6.565555095672607421875);
            float _1761 = 1.0 / _1755;
            float _1763 = _1739 * _1759;
            float _1765 = _1729 * _1763;
            float _1767 = fma(_1765, _1761, _1729);
            float _1769 = _1767;
            _1657 = _1735;
            _1629 = _1727;
            if (_1725)
            {
                float _1771 = -_1767;
                float _1773 = _1771 + 1.57079637050628662109375;
                _1769 = _1773;
            }
            float _1775 = _1769;
            int _1777 = as_type<int>(_1775);
            if (!_1727)
            {
                float _1779 = -_1775;
                float _1781 = _1779 + 3.1415927410125732421875;
                _1777 = as_type<int>(_1781);
            }
            int _1783 = _1777;
            if (!_1749)
            {
                int _1785 = _1737 | _1783;
                _1657 = as_type<float>(_1785);
            }
        }
    }
    float _1787 = _1657;
    bool _1789 = _1629;
    bool _1791 = _1789;
    if (_1459)
    {
        float _1793 = _1441 * 0.0625;
        _1465 = _1793;
    }
    float _1795 = _1465;
    float _1797 = abs(_1505);
    bool _1799 = _1797 != 0.0;
    bool _1801 = isnan(_1797);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan(0.0);
    bool _1807 = _1803 || _1805;
    float _1809 = -_1787;
    float _1811 = _1643 + _1809;
    float _1813 = _1595 * 6.283185482025146484375;
    float _1815 = cos(_1813);
    float _1817 = _928 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1819 = abs(_1795);
    bool _1821 = _1819 == 0.0;
    bool _1823 = !_1807;
    bool _1825 = _1821 && _1823;
    float _1827 = _1811 * 0.15915493667125701904296875;
    float _1829 = abs(_1795);
    bool _1831 = _1829 == 0.0;
    float _1833 = _926 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1835 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1141);
    float _1837 = _1827 * 6.283185482025146484375;
    float _1839 = sin(_1837);
    float _1841 = _930 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1843 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1167);
    float _1845 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1199);
    float _1847 = _1835 * _1817;
    float _1849 = _1843 * _1833;
    float _1851 = _1845 * _1841;
    float _1853 = _1827 * 6.283185482025146484375;
    float _1855 = cos(_1853);
    if (_1825)
    {
        bool _1857 = as_type<int>(_1795) >= 0;
        _1791 = _1857;
    }
    bool _1859 = _1791;
    float _1861 = _1637 * _1815;
    int _1863 = _1859 ? (-1) : 0;
    if (_1825)
    {
        int _1865 = _1859 ? 0 : 1078530011;
        _1611 = _1865;
    }
    int _1867 = _1611;
    int _1869 = _1867;
    if (_1825)
    {
        int _1871 = int(0x80000000) & as_type<int>(_1505);
        int _1873 = _1867 | _1871;
        _1613 = as_type<float>(_1873);
    }
    float _1875 = _1613;
    bool _1877 = !_1807;
    bool _1879 = _1877 && _1831;
    float _1881 = _1875;
    float _1883 = _1875;
    if (!_1879)
    {
        float _1885 = abs(_1505);
        bool _1887 = _1885 != as_type<float>(0x7f800000u /* inf */);
        bool _1889 = isnan(_1885);
        bool _1891 = _1887 || _1889;
        bool _1893 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1895 = _1891 || _1893;
        float _1897 = abs(_1795);
        bool _1899 = _1897 == as_type<float>(0x7f800000u /* inf */);
        float _1901 = abs(_1795);
        bool _1903 = _1901 == as_type<float>(0x7f800000u /* inf */);
        bool _1905 = !_1895;
        bool _1907 = _1903 && _1905;
        if (_1907)
        {
            bool _1909 = as_type<int>(_1795) >= 0;
            _1863 = _1909 ? (-1) : 0;
        }
        int _1911 = _1863;
        if (_1907)
        {
            _1869 = 1075235812;
        }
        int _1913 = _1869;
        int _1915 = _1913;
        if (_1907)
        {
            int _1917 = ~_1911;
            int _1919 = (_1917 != 0) ? _1913 : 1061752795;
            _1915 = _1919;
        }
        int _1921 = _1915;
        if (_1907)
        {
            int _1923 = int(0x80000000) & as_type<int>(_1505);
            int _1925 = _1921 | _1923;
            _1881 = as_type<float>(_1925);
        }
        float _1927 = _1881;
        bool _1929 = !_1895;
        bool _1931 = _1929 && _1899;
        _1883 = _1927;
        if (!_1931)
        {
            float _1933 = abs(_1505);
            float _1935 = abs(_1795);
            float _1937 = precise::max(_1933, _1935);
            float _1939 = abs(_1505);
            float _1941 = abs(_1795);
            float _1943 = precise::min(_1939, _1941);
            float _1945 = 1.0 / _1937;
            float _1947 = abs(_1505);
            float _1949 = abs(_1795);
            bool _1951 = _1947 > _1949;
            bool _1953 = as_type<int>(_1795) >= 0;
            float _1955 = _1943 * _1945;
            float _1957 = _1955 * _1955;
            float _1959 = _1957 + 11.33538818359375;
            float _1961 = fma(_1957, _1959, 28.84246826171875);
            float _1963 = fma(_1957, _1961, 19.6966705322265625);
            float _1965 = fma(_1957, -0.82336294651031494140625, -5.674867153167724609375);
            float _1967 = fma(_1957, _1965, -6.565555095672607421875);
            float _1969 = 1.0 / _1963;
            float _1971 = _1957 * _1967;
            float _1973 = abs(_1505);
            float _1975 = abs(_1795);
            float _1977 = _1973 + _1975;
            int _1979 = as_type<int>(_1505) & int(0x80000000);
            float _1981 = _1955 * _1971;
            bool _1983 = _1977 > as_type<float>(0x7f800000u /* inf */);
            bool _1985 = isnan(_1977);
            bool _1987 = _1983 || _1985;
            bool _1989 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1991 = _1987 || _1989;
            float _1993 = fma(_1981, _1969, _1955);
            float _1995 = _1993;
            _1883 = _1977;
            if (_1951)
            {
                float _1997 = -_1993;
                float _1999 = _1997 + 1.57079637050628662109375;
                _1995 = _1999;
            }
            float _2001 = _1995;
            int _2003 = as_type<int>(_2001);
            if (!_1953)
            {
                float _2005 = -_2001;
                float _2007 = _2005 + 3.1415927410125732421875;
                _2003 = as_type<int>(_2007);
            }
            int _2009 = _2003;
            if (!_1991)
            {
                int _2011 = _1979 | _2009;
                _1883 = as_type<float>(_2011);
            }
        }
    }
    float _2013 = _1883;
    float _2015 = _2013 * (-0.15915493667125701904296875);
    float _2017 = -_1849;
    float _2019 = _1603 * _2017;
    float _2021 = _1637 * _1855;
    float _2023 = _1641 * _1839;
    float _2025 = _1855 * _1815;
    float _2027 = _1637 * _1839;
    float _2029 = _1641 * _1855;
    float _2031 = _1839 * _1815;
    float _2033 = _1861 * _1849;
    float _2035 = _2015 * 6.283185482025146484375;
    float _2037 = sin(_2035);
    float _2039 = -_2023;
    float _2041 = fma(_1603, _2021, _2039);
    float _2043 = fma(_2025, _1847, _2019);
    float _2045 = fma(_1603, _2027, _2029);
    float _2047 = _1641 * _1815;
    float _2049 = fma(_2041, _1847, _2033);
    float _2051 = fma(_2031, _1851, _2043);
    float _2053 = fma(_1603, _2029, _2027);
    float _2055 = _2015 * 6.283185482025146484375;
    float _2057 = cos(_2055);
    float _2059 = fma(_2045, _1851, _2049);
    float _2061 = _1341 + _2051;
    float _2063 = -_2021;
    float _2065 = fma(_1603, _2023, _2063);
    float _2067 = _1367 + _2059;
    float _2069 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2071 = _2061 + _2069;
    float _2073 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2075 = _2067 + _2073;
    float _2077 = _2037 * _2071;
    float _2079 = _2057 * _2071;
    float _2081 = -_2077;
    float _2083 = fma(_2057, _2075, _2081);
    float _2085 = in.m_65.x;
    float _2087 = in.m_65.y;
    float _2089 = in.m_65.z;
    float _2091 = fma(_2037, _2075, _2079);
    float _2093 = _2083 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2095 = _2091 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2099 = _2093 + _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2103 = _2095 + _2101;
    float _2105 = _2099 * _2099;
    float _2107 = fma(_2103, _2103, _2105);
    float _2109 = sqrt(_2107);
    float _2111 = _277 * _2087;
    float _2113 = fma(_275, _2085, _2111);
    float _2115 = _2047 * _1849;
    float _2117 = fma(_279, _2089, _2113);
    float _2119 = fma(_2053, _1847, _2115);
    bool _2121 = _2109 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2123 = _2117 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2125 = fma(_2065, _1851, _2119);
    float _2127 = _2123 + _2125;
    float _2129 = _2123;
    float _2131 = _2089;
    float _2133 = _2125;
    float _2135 = _2107;
    float _2137 = _2021;
    if (!_2121)
    {
        _2129 = _2095;
    }
    float _2139 = _2129;
    float _2141 = _2139;
    if (!_2121)
    {
        _2131 = _2093;
    }
    float _2143 = _2131;
    float _2145 = _2143;
    if (!_2121)
    {
        _2133 = _2127;
    }
    float _2147 = _2133;
    bool _2149 = !_2121;
    float _2151 = _2147;
    if (!_2149)
    {
        float _2153 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2157 = _2109 + _2155;
        float _2159 = _2127 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2161 = rsqrt(_2107);
        float _2163 = _2157 * _2153;
        float _2165 = _2163 * 0.15915493667125701904296875;
        float _2167 = _2165 * 6.283185482025146484375;
        float _2169 = cos(_2167);
        float _2171 = _2165 * 6.283185482025146484375;
        float _2173 = sin(_2171);
        float _2175 = _2169 + (-1.0);
        float _2177 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2179 = fma(_2173, _2159, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2181 = fma(_2127, _2169, _2177);
        float _2183 = _2161 * _2179;
        float _2185 = fma(_2103, _2183, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2187 = fma(_2099, _2183, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2151 = _2181;
        _2141 = _2185;
        _2145 = _2187;
        _2135 = _2161;
    }
    float _2189 = _2151;
    float _2191 = _2141;
    float _2193 = _2145;
    float _2195 = _2135;
    float _2197 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2199 = _2189 + _2197;
    float _2201 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2203 = _2191 + _2201;
    float _2205 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2207 = _2193 + _2205;
    float _2209 = _2199 * _2199;
    float _2211 = fma(_2203, _2203, _2209);
    float _2213 = fma(_2207, _2207, _2211);
    float _2215 = rsqrt(_2213);
    float _2217 = sqrt(_2213);
    float _2219 = _2215 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2221 = _2203 * _2219;
    float _2223 = _2207 * _2219;
    float _2225 = _2221 * _2221;
    float _2227 = _2223 * _2223;
    float _2229 = _2225 + _2227;
    float _2231 = sqrt(_2229);
    bool _2233 = _2231 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2237 = _2231 + _2235;
    float _2239 = _1815;
    float _2241 = _2229;
    float _2243 = _2237;
    float _2245 = _2221;
    float _2247 = _2223;
    float _2249 = _2225;
    float _2251 = _2227;
    if (_2233)
    {
        float _2253 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2239 = _2253;
    }
    float _2255 = _2239;
    if (_2233)
    {
        float _2257 = rsqrt(_2229);
        _2241 = _2257;
    }
    float _2259 = _2241;
    if (_2233)
    {
        float _2261 = _2237 * _2255;
        _2243 = _2261;
    }
    float _2263 = _2243;
    if (_2233)
    {
        float _2265 = _2263 * 0.15915493667125701904296875;
        _2137 = _2265;
    }
    float _2267 = _2137;
    float _2269 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2271 = _2195;
    if (_2233)
    {
        float _2273 = _2267 * 6.283185482025146484375;
        float _2275 = sin(_2273);
        _2271 = _2275;
    }
    float _2277 = _2271;
    float _2279 = precise::max(0.0, _2269);
    float _2281 = _2263;
    float _2283 = _2279;
    if (_2233)
    {
        float _2285 = _2267 * 6.283185482025146484375;
        float _2287 = cos(_2285);
        _2281 = _2287;
    }
    float _2289 = _2281;
    float _2291 = -_2219;
    float _2293 = -_2279;
    float _2295 = fma(_2199, _2291, _2293);
    float _2297 = _2295;
    if (_2233)
    {
        float _2299 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2283 = _2299;
    }
    float _2301 = _2283;
    float _2303 = _2277;
    float _2305 = _2301;
    if (_2233)
    {
        float _2307 = fma(_2277, _2301, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2303 = _2307;
    }
    float _2309 = _2303;
    float _2311 = _2309;
    if (_2233)
    {
        float _2313 = _2259 * _2309;
        _2311 = _2313;
    }
    float _2315 = _2311;
    float _2317 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2319 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    if (_2233)
    {
        float _2321 = _2289 + (-1.0);
        _2305 = _2321;
    }
    float _2323 = _2305;
    float _2325 = _2323;
    if (_2233)
    {
        float _2327 = _2221 * _2315;
        _2245 = _2327;
    }
    float _2329 = _2245;
    if (_2233)
    {
        float _2331 = _2223 * _2315;
        _2247 = _2331;
    }
    float _2333 = _2247;
    float _2335 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2317);
    if (_2233)
    {
        float _2337 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2325 = _2337;
    }
    float _2339 = _2325;
    if (_2233)
    {
        float _2341 = _2329 * _2329;
        _2249 = _2341;
    }
    float _2343 = _2249;
    if (_2233)
    {
        float _2345 = _2333 * _2333;
        _2251 = _2345;
    }
    float _2347 = _2251;
    float _2349 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2335);
    if (_2233)
    {
        float _2351 = fma(_2295, _2289, _2339);
        _2297 = _2351;
    }
    float _2353 = _2297;
    float _2355 = fma(_2353, _2353, _2343);
    float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2359 = fma(_2217, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2357);
    float _2361 = precise::clamp(_2359, 0.0, 1.0);
    float _2363 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2365 = _2355 + _2347;
    float _2367 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2369 = -_2361;
    float _2371 = _2369 + 1.0;
    float _2373 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2363);
    float _2375 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2367);
    float _2377 = rsqrt(_2365);
    float _2379 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2373);
    float _2381 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2375);
    float _2383 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2385 = _2379 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2387 = _2381 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2389 = abs(_2371);
    float _2391 = log2(_2389);
    float _2393 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2383);
    float _2395 = _2385 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2397 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2399 = _2385 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2401 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2393);
    float _2403 = -_2397;
    float _2405 = fma(_2403, _2319, 1.0);
    float _2407 = _2377 * _2353;
    float _2409 = _2401 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2411 = _2377 * _2329;
    float _2413 = _2377 * _2333;
    float _2415 = _2349 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2417 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2395);
    float _2419 = _2411 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2421 = log2(_2405);
    float _2423 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2425 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2417);
    float _2427 = -_2419;
    float _2429 = fma(_2407, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2427);
    float _2431 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2399);
    float _2433 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2425);
    float _2435 = -_2413;
    float _2437 = fma(_2435, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2429);
    float _2439 = exp2(_2423);
    float _2441 = _2385 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2443 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2431);
    float _2445 = fma(_2437, -0.5, 0.5);
    float _2447 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2441);
    float _2449 = fma(_2437, 0.5, 0.5);
    float _2451 = _2407 + 1.0;
    float _2453 = 1.0 / _2433;
    float _2455 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2447);
    float _2457 = fma(_2449, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2459 = _2421 * 0.693147182464599609375;
    float _2461 = _2459 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2463 = sqrt(_2445);
    float _2465 = -_2407;
    float _2467 = fma(_2439, _2451, _2465);
    float _2469 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2455);
    float _2471 = fma(_2449, _2457, -0.212114393711090087890625);
    float _2473 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2443);
    float _2475 = fma(_2449, _2471, 1.570728778839111328125);
    float _2477 = _2469 * _2453;
    float _2479 = _2473 * _2453;
    float _2481 = fma(_2467, 0.5, 0.5);
    float _2483 = fma(_2477, 0.5, 0.5);
    float _2485 = fma(_2479, -0.5, 0.5);
    float _2487 = _2463 * 0.636619746685028076171875;
    float3 _6234 = float3(_2483, _2485, _2461);
    float _2489 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6234, float3(0.0), isnan(_6234)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6234, float3(0.0), isnan(_6234)), level(0.0)).x;
    float _2491 = -_2475;
    float _2493 = fma(_2487, _2491, 1.0);
    float3 _6250 = float3(_2483, _2485, _2461);
    float4 _2495 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6250, float3(0.0), isnan(_6250)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6250, float3(0.0), isnan(_6250)), level(0.0)).xyzw;
    float _2497 = _2495.x;
    float _2499 = _2495.y;
    float _2501 = _2495.z;
    float _2503 = _2495.w;
    float2 _6266 = float2(_2493, _2481);
    float3 _2507 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6266, float2(0.0), isnan(_6266)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6266, float2(0.0), isnan(_6266)), level(0.0)).xyz;
    float _2509 = _2507.x;
    float _2511 = _2507.y;
    float _2513 = _2507.z;
    float _2515 = _1197 * _1245;
    float _2517 = _1181 * 2.0;
    float _2519 = _1159 * 3.883221149444580078125;
    bool _2521 = _1167 != 0.0;
    bool _2523 = isnan(_1167);
    bool _2525 = _2521 || _2523;
    bool _2527 = isnan(0.0);
    bool _2529 = _2525 || _2527;
    float _2531 = -_973;
    float _2533 = _2531 + _1165;
    float _2535 = -_2517;
    float _2537 = fma(_2515, _2535, _2515);
    float _2539 = _2519 * 0.15915493667125701904296875;
    bool _2541 = _1141 == 0.0;
    bool _2543 = !_2529;
    bool _2545 = _2541 && _2543;
    float _2547 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2549 = fma(_1181, 3.1415927410125732421875, _2537);
    float _2551 = fma(_1109, _2533, _973);
    float _2553 = _2539 * 6.283185482025146484375;
    float _2555 = cos(_2553);
    bool _2557 = _1199 == 0.0;
    bool _2559 = _2557 && _2545;
    float _2561 = _2549 * 0.15915493667125701904296875;
    out.m_67.x = _934;
    out.m_67.y = _1003;
    out.m_67.z = _1009;
    out.m_67.w = _922;
    out.m_69.x = _1005;
    out.m_69.y = _1007;
    out.m_69.z = _1011;
    out.m_69.w = _985;
    float _2563 = _2561 * 6.283185482025146484375;
    float _2565 = sin(_2563);
    out.m_71.x = _918;
    out.m_71.y = _991;
    out.m_73.x = _1341;
    float _2567 = _2539 * 6.283185482025146484375;
    float _2569 = sin(_2567);
    float _2571 = _2385 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_73.z = _1367;
    float _2573 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2571);
    float _2575 = _2433 * 0.5;
    float _2577 = _2469 + _2433;
    float _2579 = exp2(_2547);
    float _2581 = -_1119;
    float _2583 = fma(_2565, _2555, _2581);
    float _2585 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2587 = _2577 * 0.5;
    out.m_75.x = _2191;
    out.m_75.y = _2189;
    out.m_75.z = _2193;
    float _2589 = fma(_1109, _2583, _1119);
    float _2591 = -_1121;
    float _2593 = fma(_2565, _2569, _2591);
    float _2595 = _2589;
    float _2597 = _2551;
    if (!_2559)
    {
        float _2599 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2589);
        _2595 = _2599;
    }
    float _2601 = _2595;
    out.m_47.x = _2585;
    float _2603 = fma(_1109, _2593, _1121);
    float _2605 = _2603;
    if (!_2559)
    {
        float _2607 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2551);
        _2597 = _2607;
    }
    float _2609 = _2597;
    if (!_2559)
    {
        float _2611 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2603);
        _2605 = _2611;
    }
    float _2613 = _2605;
    float _2615 = -_2579;
    float _2617 = _2615 + 1.0;
    float _2619 = -_2609;
    float _2621 = _1603 * _2619;
    float _2623 = _1861 * _2609;
    float _2625 = _2047 * _2609;
    float _2627 = _2617 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2629 = fma(_2025, _2601, _2621);
    float _2631 = fma(_2041, _2601, _2623);
    float _2633 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2573);
    float _2635 = fma(_2053, _2601, _2625);
    float _2637 = fma(_2031, _2613, _2629);
    float _2639 = fma(_2045, _2613, _2631);
    float _2641 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2633);
    float _2643 = _2637 * _2037;
    float _2645 = _2637 * _2057;
    float _2647 = _2641 + _2433;
    float _2649 = fma(_2065, _2613, _2635);
    float _2651 = -_2643;
    float _2653 = fma(_2639, _2057, _2651);
    float _2655 = fma(_2473, -0.5, _2575);
    float _2657 = -_2627;
    float _2659 = _2657 + 1.0;
    float _2661 = fma(_2639, _2037, _2645);
    float _2663 = _2647 * 0.5;
    out.gl_Position.x = _2469;
    out.gl_Position.y = _2473;
    out.gl_Position.z = _2641;
    out.gl_Position.w = _2433;
    out.m_77.x = _2661;
    out.m_77.y = _2649;
    out.m_77.z = _2653;
    out.m_79.x = _2587;
    out.m_79.y = _2655;
    out.m_79.z = _2663;
    out.m_79.w = _2433;
    float _2665 = _2627 * _2489;
    float _2667 = _2503 * _2665;
    float _2669 = _2513 * _2665;
    float _2671 = fma(_2509, _2667, _2497);
    float _2673 = fma(_2511, _2667, _2499);
    float _2675 = _2503 * _2659;
    float _2677 = fma(_2503, _2669, _2501);
    out.m_81.x = _2671;
    out.m_81.y = _2673;
    out.m_81.z = _2677;
    out.m_81.w = _2675;
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
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1221 = false;
    bool _1037 = false;
    bool _573 = false;
    bool _303 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
    float _103 = trunc(_101);
    int _105 = int(_103);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2735 = as_type<float>(_121);
        out.gl_Position.z = _2735;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_49.w;
    float _127 = float(_105);
    float _129 = -_125;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_125);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    bool _143 = _131 >= _127;
    bool _145 = !_141;
    bool _147 = _143 || _145;
    float _149 = _131;
    if (_147)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _113;
    if (_147)
    {
        out.m_47.x = 0.0;
    }
    if (_147)
    {
        float _153 = _151 * 5.0;
        _123 = as_type<int>(_153);
    }
    int _155 = _123;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2799 = as_type<float>(_155);
        out.gl_Position.z = _2799;
    }
    if (_147)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _157 = in.m_51.w;
    float _159 = 1.0 / _127;
    float _161 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = in.m_49.x;
    float _175 = in.m_49.y;
    float _177 = in.m_49.z;
    float _179 = in.m_44.x;
    float _181 = in.m_44.y;
    float _183 = in.m_44.z;
    float _185 = 0.0;
    float _187 = _161;
    if (!_171)
    {
        float _189 = _161 * _161;
        float _191 = _189 * 0.5;
        _185 = _191;
    }
    float _193 = _185;
    float _195 = _193;
    if (!_171)
    {
        float _197 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _197;
    }
    float _199 = _195;
    bool _201 = !_171;
    float _203 = _199;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _161 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _161);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_171;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _161 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _187 = _257;
    }
    float _259 = _187;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _263 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _265 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _267 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _269 = fma(_259, _173, _263);
    float _271 = fma(_259, _175, _265);
    float _273 = fma(_259, _177, _267);
    float _275 = fma(_269, _157, _179);
    float _277 = fma(_271, _157, _181);
    float _279 = fma(_273, _157, _183);
    float _281 = _131 * _159;
    bool _283 = !_261;
    float _301;
    if (!_283)
    {
        float _285 = in.m_53.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        _301 = _281;
    }
    _303 = false;
    float _305 = _301;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _309 = _305 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _313 = _305 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _317 = _305 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _335 = 1.0 / _321;
    float _337 = 1.0 / _325;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _341 = _305 + _339;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _345 = 1.0 / _329;
    float _347 = _313 * _335;
    bool _349 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _351 = isnan(_305);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = 1.0 / _333;
    float _363 = _309 * _337;
    bool _365 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _367 = isnan(_305);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _377;
    float _381 = -_375;
    float _383 = _381 + 1.0;
    float _385 = _317 * _345;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _391;
    float _395 = fma(_379, _347, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _397 = fma(_389, _347, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _399 = fma(_393, _347, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _401 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _403 = isnan(_305);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = _341 * _361;
    bool _415 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _417 = isnan(_305);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _359 * _383;
    float _429 = -_359;
    float _431 = _429 + 1.0;
    bool _433 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _435 = isnan(_305);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _449 = -_425;
    float _451 = _449 + 1.0;
    float _453 = _425 * _431;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _463 = _411 * _451;
    float _465 = -_411;
    float _467 = _465 + 1.0;
    float _469 = fma(_447, _363, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _471 = fma(_457, _363, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _473 = fma(_461, _363, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _475 = _443 * _467;
    float _477 = -_443;
    float _479 = _477 + 1.0;
    float _481 = _395 * _475;
    float _483 = _397 * _475;
    float _485 = _399 * _475;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _487;
    float _491 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[107].x, _481);
    float _493 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[107].y, _483);
    float _495 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[107].z, _485);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _497;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _501;
    float _505 = fma(_489, _385, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _507 = fma(_469, _463, _491);
    float _509 = fma(_473, _463, _495);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _515 = fma(_499, _385, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _517 = fma(_471, _463, _493);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _523 = fma(_503, _385, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _529 = fma(_505, _453, _507);
    float _531 = fma(_513, _413, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _533 = fma(_521, _413, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _535 = fma(_515, _453, _517);
    float _537 = fma(_527, _413, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _539 = fma(_523, _453, _509);
    float _541 = fma(_531, _427, _529);
    float _543 = fma(_533, _427, _535);
    float _545 = fma(_537, _427, _539);
    float _547 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[111].x, _541);
    float _549 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[111].y, _543);
    float _551 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[111].z, _545);
    bool _553 = !_343;
    float _571;
    if (!_553)
    {
        float _555 = in.m_53.x;
        float _557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _559 = _555 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _561 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _563 = _561 * _557;
        float _565 = floor(_563);
        float _567 = -_565;
        float _569 = _563 + _567;
        _571 = _569;
        _573 = true;
    }
    else
    {
        _571 = _281;
    }
    _573 = false;
    float _575 = _571;
    int _577 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _579 = _577;
    int _581 = 0;
    int _583 = _96(_579, _581, (*spvDescriptorSet0.support_buffer));
    float _585 = in.m_55.z;
    float _587 = 0.0 + _281;
    float _589 = precise::clamp(_587, 0.0, 1.0);
    float _591 = trunc(_585);
    int _593 = int(_591);
    int _595 = _583 + (-1);
    float _597 = float(_595);
    float _599 = _589 * _597;
    float _601 = trunc(_599);
    int _603 = int(_601);
    int _605 = _603;
    int _607 = 0;
    int _609 = _97(_605, _607, (*spvDescriptorSet0.support_buffer));
    int _611 = _593;
    int _613 = 0;
    int _615 = _97(_611, _613, (*spvDescriptorSet0.support_buffer));
    float4 _618 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_609, _615)), 0).xyzw;
    float _620 = _618.x;
    float _622 = _618.y;
    float _624 = _618.z;
    float _626 = _618.w;
    float _628 = in.m_53.x;
    float _630 = in.m_53.y;
    float _632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _634 = in.m_55.x;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _638 = _636 != 0;
    float _640 = _547 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _646 = in.m_55.y;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _650 = _648 != 0;
    float _652 = 1.0 / _644;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _660 = 0.0;
    float _662 = _646;
    if (_638)
    {
        float _664 = in.m_53.x;
        _660 = _664;
    }
    float _666 = _660;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _672 = 1.0 / _658;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _676 = _628 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _678 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[78].z, _654);
    float _680 = _630 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _682 = -_668;
    float _684 = fma(_676, 2.0, _682);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _686;
    float _690 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[78].w, _670);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _696 = fma(_680, -2.0, _674);
    float _698 = _688 * _652;
    float _700 = 1.0 / _694;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _706 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _708 = isnan(_575);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = -_131;
    float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[76].x, _684);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _726 = _704 * _672;
    bool _728 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _730 = isnan(_575);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -_716;
    float _742 = _740 + 1.0;
    float _744 = 1.0 / _724;
    bool _746 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _748 = isnan(_575);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _758;
    bool _762 = _630 > 0.5;
    bool _764 = _762 && _650;
    float _766 = _738 * _742;
    bool _768 = _666 > 0.5;
    bool _770 = _768 && _638;
    float _772 = -_738;
    float _774 = _772 + 1.0;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _778 = _575 + _776;
    bool _780 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _782 = isnan(_575);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _760 * _700;
    float _794 = -_756;
    float _796 = _794 + 1.0;
    float _798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _800 = _756 * _774;
    float _802 = fma(_698, _778, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _804 = _575 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _806 = isnan(_575);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = _790 * _796;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _822 = -_790;
    float _824 = _822 + 1.0;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _828 = _802;
    if (_638)
    {
        _826 = _634;
    }
    float _830 = _826;
    float _832 = _830;
    if (_764)
    {
        float _834 = -_646;
        float _836 = _834 + 1.0;
        _662 = _836;
    }
    float _838 = _662;
    float _840 = _820 * _744;
    float _842 = _814 * _824;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _846 = _575 + _844;
    if (_770)
    {
        float _848 = -_830;
        float _850 = _848 + 1.0;
        _832 = _850;
    }
    float _852 = _832;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _856 = _575 + _854;
    float _858 = _802 * _842;
    if (!_638)
    {
        _828 = _634;
    }
    float _860 = _828;
    float _862 = fma(_726, _846, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _864 = _860;
    if (_638)
    {
        _864 = _852;
    }
    float _866 = _864;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _870 = _575 + _868;
    float _872 = _798 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _874 = -_814;
    float _876 = _874 + 1.0;
    float _878 = fma(_792, _856, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _880 = fma(_840, _870, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _882 = fma(_872, _866, -0.5);
    float _884 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _678);
    float _886 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[115].x, _858);
    float _888 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _690);
    float _890 = _632 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _892 = fma(_884, _882, _720);
    float _894 = fma(_862, _816, _886);
    int _896 = _603 + 1;
    float _898 = fma(_890, _838, -0.5);
    float _900 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _696);
    float _902 = fma(_878, _800, _894);
    int _904 = min(_595, _896);
    float _906 = in.m_51.x;
    float _908 = in.m_51.y;
    float _910 = in.m_51.z;
    float _912 = fma(_880, _766, _902);
    float _914 = -_900;
    float _916 = fma(_888, _898, _914);
    float _918 = _892 + 0.5;
    float _920 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[119].x, _912);
    out.m_57.x = (*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _922 = _920 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _926 = _908 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _928 = _906 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _930 = _910 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _932 = _549 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _934 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    uint _941 = as_type<uint>(half2(float2(_626, 0.0)));
    uint _943 = extract_bits(_941, 0u, 8u);
    int _945 = int(_943) & 255;
    uint _947 = extract_bits(_941, 8u, 8u);
    int _949 = int(_947) & 255;
    int _951 = _949 << 8;
    int _953 = _945 | _951;
    bool _955 = _953 >= 32768;
    int _957 = _953 + (-1024);
    int _959 = _957;
    if (_955)
    {
        int _961 = ~_953;
        int _963 = _961 + 33792;
        int _965 = _963 + 1;
        _959 = _965;
    }
    int _967 = _959;
    int _969 = _967 + 30719;
    float _971 = float(_969);
    float _973 = fma(_971, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _975 = abs(_973);
    float _977 = -_975;
    float _979 = _977 + 1.0;
    bool _981 = _973 < 0.0;
    float _983 = float(_981);
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _987 = abs(_973);
    float _989 = fma(_987, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _991 = _916 + 0.5;
    int _993 = as_type<int>(_979) + (-218103808);
    float _995 = abs(_973);
    float _997 = fma(_995, _989, -0.212114393711090087890625);
    bool _999 = uint(_993) >= 1920991232u;
    float _1001 = _551 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1003 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1005 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1007 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1009 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = _924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1013 = abs(_973);
    float _1015 = fma(_1013, _997, 1.570728778839111328125);
    bool _1017 = !_999;
    float _1035;
    if (!_1017)
    {
        int _1019 = as_type<int>(_979);
        int _1021 = as_type<int>(_916);
        int _1023 = 5008;
        int _1025;
        int _1027;
        int _1029;
        int _1031;
        int _1033;
        _94(_1019, _1021, _1023, _1025, _1027, _1029, _1031, _1033, out.gl_Position, out.gl_PointSize);
        _1035 = as_type<float>(_1029);
        _1037 = true;
    }
    else
    {
        float _1039 = rsqrt(_979);
        float _1041 = _979 * _1039;
        float _1043 = _1039 * 0.5;
        float _1045 = -_1041;
        float _1047 = 0.0 + _1045;
        float _1049 = fma(_1043, _1047, 0.5);
        float _1051 = fma(_1041, _1049, _1041);
        float _1053 = -_1051;
        float _1055 = 0.0 + _1053;
        float _1057 = fma(_1051, _1055, _979);
        float _1059 = fma(_1043, _1057, _1051);
        _1035 = _1059;
    }
    _1037 = false;
    float _1061 = _1035;
    int _1063 = _904;
    int _1065 = 0;
    int _1067 = _97(_1063, _1065, (*spvDescriptorSet0.support_buffer));
    int _1069 = _593;
    int _1071 = 0;
    int _1073 = _97(_1069, _1071, (*spvDescriptorSet0.support_buffer));
    float4 _1075 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1067, _1073)), 0).xyzw;
    float _1077 = _1075.x;
    float _1079 = _1075.y;
    float _1081 = _1075.z;
    float _1083 = _1075.w;
    float _1085 = floor(_599);
    float _1087 = _1015 * _1061;
    float _1089 = _983 * 2.0;
    float _1091 = _971 * 3.883221149444580078125;
    float _1093 = -_1089;
    float _1095 = fma(_1087, _1093, _1087);
    float _1097 = _1091 * 0.15915493667125701904296875;
    float _1099 = fma(_983, 3.1415927410125732421875, _1095);
    float _1101 = _1097 * 6.283185482025146484375;
    float _1103 = cos(_1101);
    float _1105 = _1099 * 0.15915493667125701904296875;
    float _1107 = -_1085;
    float _1109 = _599 + _1107;
    float _1111 = _1105 * 6.283185482025146484375;
    float _1113 = sin(_1111);
    float _1115 = _1097 * 6.283185482025146484375;
    float _1117 = sin(_1115);
    float _1119 = _1113 * _1103;
    float _1121 = _1113 * _1117;
    uint _1123 = as_type<uint>(half2(float2(_1083, 0.0)));
    float _1125 = -_620;
    float _1127 = _1125 + _1077;
    uint _1129 = extract_bits(_1123, 0u, 8u);
    int _1131 = int(_1129) & 255;
    uint _1133 = extract_bits(_1123, 8u, 8u);
    int _1135 = int(_1133) & 255;
    int _1137 = _1135 << 8;
    int _1139 = _1131 | _1137;
    float _1141 = fma(_1109, _1127, _620);
    bool _1143 = _1139 >= 32768;
    int _1145 = _1139 + (-1024);
    int _1147 = _1145;
    if (_1143)
    {
        int _1149 = ~_1139;
        int _1151 = _1149 + 33792;
        int _1153 = _1151 + 1;
        _1147 = _1153;
    }
    int _1155 = _1147;
    int _1157 = _1155 + 30719;
    float _1159 = float(_1157);
    float _1161 = -_622;
    float _1163 = _1161 + _1079;
    float _1165 = fma(_1159, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1167 = fma(_1109, _1163, _622);
    float _1169 = abs(_1165);
    float _1171 = -_1169;
    float _1173 = _1171 + 1.0;
    float _1175 = abs(_1165);
    float _1177 = fma(_1175, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1179 = _1165 < 0.0;
    float _1181 = float(_1179);
    int _1183 = as_type<int>(_1173) + (-218103808);
    float _1185 = abs(_1165);
    float _1187 = fma(_1185, _1177, -0.212114393711090087890625);
    bool _1189 = uint(_1183) >= 1920991232u;
    float _1191 = -_624;
    float _1193 = _1191 + _1081;
    float _1195 = abs(_1165);
    float _1197 = fma(_1195, _1187, 1.570728778839111328125);
    float _1199 = fma(_1109, _1193, _624);
    bool _1201 = !_1189;
    float _1219;
    if (!_1201)
    {
        int _1203 = as_type<int>(_1173);
        int _1205 = as_type<int>(_1079);
        int _1207 = 5920;
        int _1209;
        int _1211;
        int _1213;
        int _1215;
        int _1217;
        _94(_1203, _1205, _1207, _1209, _1211, _1213, _1215, _1217, out.gl_Position, out.gl_PointSize);
        _1219 = as_type<float>(_1213);
        _1221 = true;
    }
    else
    {
        float _1223 = rsqrt(_1173);
        float _1225 = _1173 * _1223;
        float _1227 = _1223 * 0.5;
        float _1229 = -_1225;
        float _1231 = 0.0 + _1229;
        float _1233 = fma(_1227, _1231, 0.5);
        float _1235 = fma(_1225, _1233, _1225);
        float _1237 = -_1235;
        float _1239 = 0.0 + _1237;
        float _1241 = fma(_1235, _1239, _1173);
        float _1243 = fma(_1227, _1241, _1235);
        _1219 = _1243;
    }
    _1221 = false;
    float _1245 = _1219;
    float _1247 = in.m_53.x;
    float _1249 = in.m_53.y;
    float _1251 = in.m_53.z;
    float _1253 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1255 = log2(_1253);
    float _1257 = in.m_59.x;
    float _1259 = in.m_59.y;
    float _1261 = in.m_59.z;
    float _1263 = in.m_61.x;
    float _1265 = in.m_61.y;
    float _1267 = in.m_61.z;
    float _1269 = _1255 * _131;
    float _1271 = exp2(_1269);
    float _1273 = _1251 * 2.0;
    float _1275 = _1247 * 2.0;
    float _1277 = _277 * _1259;
    float _1279 = floor(_1273);
    float _1281 = fma(_275, _1257, _1277);
    float _1283 = _1249 * 2.0;
    float _1285 = _277 * _1265;
    float _1287 = fma(_279, _1261, _1281);
    float _1289 = fma(_275, _1263, _1285);
    float _1291 = floor(_1283);
    int _1293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1295 = _1293 != 0;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1299 = _1297 != 0;
    int _1301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1303 = _1301 != 0;
    float _1305 = _1251 + _1247;
    float _1307 = fma(_279, _1267, _1289);
    float _1309 = _1249 + _1247;
    float _1311 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1313 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1311;
    float _1315 = _1305 + (-1.0);
    bool _1317 = !_1303;
    int _1319 = _1317 ? 0 : 1;
    float _1321 = floor(_1275);
    bool _1323 = _1279 > 0.0;
    float _1325 = _1309 + (-1.0);
    bool _1327 = _1279 >= 0.0;
    bool _1329 = isnan(_1279);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan(0.0);
    bool _1335 = _1331 || _1333;
    float _1337 = -_1271;
    float _1339 = _1337 + 1.0;
    float _1341 = _1307 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1343 = _1335 ? 0 : 1;
    float _1345 = _1247 + (-0.5);
    bool _1347 = _1291 >= 0.0;
    bool _1349 = isnan(_1291);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.0);
    bool _1355 = _1351 || _1353;
    float _1357 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1359 = ~_1343;
    int _1361 = _1359 + 1;
    int _1363 = _1361 + 1;
    float _1365 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1367 = _1287 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1369 = _1363;
    float _1371 = _1313;
    if (!_1323)
    {
        int _1373 = ~_1343;
        int _1375 = _1373 + 1;
        _1369 = _1375;
    }
    int _1377 = _1369;
    bool _1379 = _1291 > 0.0;
    float _1381 = in.m_63.x;
    float _1383 = in.m_63.y;
    float _1385 = in.m_63.z;
    bool _1387 = !_1295;
    int _1389 = _1387 ? 0 : 1;
    float _1391 = -_1367;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1395 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1397 = isnan(1.0);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1403 = _1399 || _1401;
    float _1405 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1407 = 1.0 + _1405;
    bool _1409 = _1321 > 0.0;
    bool _1411 = _1321 >= 0.0;
    bool _1413 = isnan(_1321);
    bool _1415 = _1411 || _1413;
    bool _1417 = isnan(0.0);
    bool _1419 = _1415 || _1417;
    float _1421 = 1.0 / _1407;
    int _1423 = abs(_1389);
    float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1427 = _1341 + _1425;
    bool _1429 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1431 = isnan(0.0);
    bool _1433 = _1429 || _1431;
    bool _1435 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1437 = _1433 || _1435;
    float _1439 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1441 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1439;
    float _1443 = float(_1377);
    float _1445 = float(_1423);
    float _1447 = abs(_1313);
    float _1449 = abs(_1441);
    float _1451 = precise::max(_1447, _1449);
    float _1453 = _1437 ? _1339 : 0.0;
    float _1455 = _1445 * _1443;
    int _1457 = _1355 ? 0 : 1;
    bool _1459 = _1451 >= 16.0;
    float _1461 = _1427;
    float _1463 = _1393;
    float _1465 = _1441;
    if (_1403)
    {
        float _1467 = _1453 * _1421;
        _149 = _1467;
    }
    float _1469 = _149;
    float _1471 = abs(_1427);
    float _1473 = abs(_1393);
    float _1475 = precise::max(_1471, _1473);
    int _1477 = ~_1457;
    int _1479 = _1477 + 1;
    int _1481 = _1479 + 1;
    bool _1483 = !_1299;
    int _1485 = _1483 ? 0 : 1;
    int _1487 = _1481;
    if (!_1379)
    {
        int _1489 = ~_1457;
        int _1491 = _1489 + 1;
        _1487 = _1491;
    }
    int _1493 = _1487;
    int _1495 = abs(_1319);
    float _1497 = _1455 * (-2.0);
    bool _1499 = _1475 >= 16.0;
    bool _1501 = _1499;
    if (_1459)
    {
        float _1503 = _1313 * 0.0625;
        _1371 = _1503;
    }
    float _1505 = _1371;
    int _1507 = abs(_1485);
    float _1509 = fma(_1497, _1381, _1381);
    float _1511 = float(_1495);
    float _1513 = fma(_1365, _1497, _1365);
    float _1515 = float(_1493);
    float _1517 = _1251 + (-0.5);
    int _1519 = _1419 ? 0 : 1;
    float _1521 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1509);
    float _1523 = _1511 * _1515;
    int _1525 = ~_1519;
    int _1527 = _1525 + 1;
    int _1529 = _1527 + 1;
    int _1531 = _1529;
    if (_1499)
    {
        float _1533 = _1427 * 0.0625;
        _1461 = _1533;
    }
    float _1535 = _1461;
    if (!_1409)
    {
        int _1537 = ~_1519;
        int _1539 = _1537 + 1;
        _1531 = _1539;
    }
    int _1541 = _1531;
    float _1543 = _1523 * (-2.0);
    if (_1499)
    {
        float _1545 = _1393 * 0.0625;
        _1463 = _1545;
    }
    float _1547 = _1463;
    float _1549 = fma(_1513, _1469, _1521);
    float _1551 = abs(_1535);
    bool _1553 = _1551 != 0.0;
    bool _1555 = isnan(_1551);
    bool _1557 = _1553 || _1555;
    bool _1559 = isnan(0.0);
    bool _1561 = _1557 || _1559;
    float _1563 = fma(_1543, _1385, _1385);
    float _1565 = fma(_1357, _1543, _1357);
    float _1567 = float(_1507);
    float _1569 = _1251 + _1249;
    float _1571 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1563);
    float _1573 = float(_1541);
    float _1575 = _1249 + (-0.5);
    float _1577 = abs(_1547);
    bool _1579 = _1577 == 0.0;
    bool _1581 = !_1561;
    bool _1583 = _1579 && _1581;
    float _1585 = fma(_1565, _1469, _1571);
    float _1587 = _1569 + (-1.0);
    float _1589 = _1567 * _1573;
    float _1591 = abs(_1547);
    bool _1593 = _1591 == 0.0;
    float _1595 = _1585 * 0.15915493667125701904296875;
    float _1597 = _1589 * (-2.0);
    float _1599 = _1549 * 0.15915493667125701904296875;
    float _1601 = _1595 * 6.283185482025146484375;
    float _1603 = sin(_1601);
    float _1605 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1607 = fma(_1597, _1383, _1383);
    int _1609 = as_type<int>(_1607);
    int _1611 = as_type<int>(_1573);
    float _1613 = _1595;
    if (_1583)
    {
        bool _1615 = as_type<int>(_1547) >= 0;
        _1501 = _1615;
    }
    bool _1617 = _1501;
    float _1619 = fma(_1605, _1597, _1605);
    float _1621 = fma(_1575, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1607);
    float _1623 = _1621;
    int _1625 = _1617 ? (-1) : 0;
    int _1627 = as_type<int>(_1619);
    bool _1629 = _1617;
    if (_1583)
    {
        int _1631 = _1617 ? 0 : 1078530011;
        _1609 = _1631;
    }
    int _1633 = _1609;
    float _1635 = _1599 * 6.283185482025146484375;
    float _1637 = sin(_1635);
    float _1639 = _1599 * 6.283185482025146484375;
    float _1641 = cos(_1639);
    float _1643 = fma(_1619, _1469, _1621);
    if (_1583)
    {
        int _1645 = int(0x80000000) & as_type<int>(_1535);
        int _1647 = _1633 | _1645;
        _1623 = as_type<float>(_1647);
    }
    float _1649 = _1623;
    bool _1651 = !_1561;
    bool _1653 = _1651 && _1593;
    float _1655 = _1649;
    float _1657 = _1649;
    if (!_1653)
    {
        float _1659 = abs(_1535);
        bool _1661 = _1659 != as_type<float>(0x7f800000u /* inf */);
        bool _1663 = isnan(_1659);
        bool _1665 = _1661 || _1663;
        bool _1667 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1669 = _1665 || _1667;
        float _1671 = abs(_1547);
        bool _1673 = _1671 == as_type<float>(0x7f800000u /* inf */);
        float _1675 = abs(_1547);
        bool _1677 = _1675 == as_type<float>(0x7f800000u /* inf */);
        bool _1679 = !_1669;
        bool _1681 = _1677 && _1679;
        if (_1681)
        {
            bool _1683 = as_type<int>(_1547) >= 0;
            _1625 = _1683 ? (-1) : 0;
        }
        int _1685 = _1625;
        _1629 = _1685 != 0;
        if (_1681)
        {
            _1627 = 1075235812;
        }
        int _1687 = _1627;
        int _1689 = _1687;
        if (_1681)
        {
            int _1691 = ~_1685;
            int _1693 = (_1691 != 0) ? _1687 : 1061752795;
            _1689 = _1693;
        }
        int _1695 = _1689;
        if (_1681)
        {
            int _1697 = int(0x80000000) & as_type<int>(_1535);
            int _1699 = _1695 | _1697;
            _1655 = as_type<float>(_1699);
        }
        float _1701 = _1655;
        bool _1703 = !_1669;
        bool _1705 = _1703 && _1673;
        _1657 = _1701;
        if (!_1705)
        {
            float _1707 = abs(_1535);
            float _1709 = abs(_1547);
            float _1711 = precise::max(_1707, _1709);
            float _1713 = abs(_1535);
            float _1715 = abs(_1547);
            float _1717 = precise::min(_1713, _1715);
            float _1719 = 1.0 / _1711;
            float _1721 = abs(_1535);
            float _1723 = abs(_1547);
            bool _1725 = _1721 > _1723;
            bool _1727 = as_type<int>(_1547) >= 0;
            float _1729 = _1717 * _1719;
            float _1731 = abs(_1535);
            float _1733 = abs(_1547);
            float _1735 = _1731 + _1733;
            int _1737 = as_type<int>(_1535) & int(0x80000000);
            float _1739 = _1729 * _1729;
            bool _1741 = _1735 > as_type<float>(0x7f800000u /* inf */);
            bool _1743 = isnan(_1735);
            bool _1745 = _1741 || _1743;
            bool _1747 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1749 = _1745 || _1747;
            float _1751 = _1739 + 11.33538818359375;
            float _1753 = fma(_1739, _1751, 28.84246826171875);
            float _1755 = fma(_1739, _1753, 19.6966705322265625);
            float _1757 = fma(_1739, -0.82336294651031494140625, -5.674867153167724609375);
            float _1759 = fma(_1739, _1757, -6.565555095672607421875);
            float _1761 = 1.0 / _1755;
            float _1763 = _1739 * _1759;
            float _1765 = _1729 * _1763;
            float _1767 = fma(_1765, _1761, _1729);
            float _1769 = _1767;
            _1657 = _1735;
            _1629 = _1727;
            if (_1725)
            {
                float _1771 = -_1767;
                float _1773 = _1771 + 1.57079637050628662109375;
                _1769 = _1773;
            }
            float _1775 = _1769;
            int _1777 = as_type<int>(_1775);
            if (!_1727)
            {
                float _1779 = -_1775;
                float _1781 = _1779 + 3.1415927410125732421875;
                _1777 = as_type<int>(_1781);
            }
            int _1783 = _1777;
            if (!_1749)
            {
                int _1785 = _1737 | _1783;
                _1657 = as_type<float>(_1785);
            }
        }
    }
    float _1787 = _1657;
    bool _1789 = _1629;
    bool _1791 = _1789;
    if (_1459)
    {
        float _1793 = _1441 * 0.0625;
        _1465 = _1793;
    }
    float _1795 = _1465;
    float _1797 = abs(_1505);
    bool _1799 = _1797 != 0.0;
    bool _1801 = isnan(_1797);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan(0.0);
    bool _1807 = _1803 || _1805;
    float _1809 = -_1787;
    float _1811 = _1643 + _1809;
    float _1813 = _1595 * 6.283185482025146484375;
    float _1815 = cos(_1813);
    float _1817 = _928 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1819 = abs(_1795);
    bool _1821 = _1819 == 0.0;
    bool _1823 = !_1807;
    bool _1825 = _1821 && _1823;
    float _1827 = _1811 * 0.15915493667125701904296875;
    float _1829 = abs(_1795);
    bool _1831 = _1829 == 0.0;
    float _1833 = _926 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1835 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1141);
    float _1837 = _1827 * 6.283185482025146484375;
    float _1839 = sin(_1837);
    float _1841 = _930 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1843 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1167);
    float _1845 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1199);
    float _1847 = _1835 * _1817;
    float _1849 = _1843 * _1833;
    float _1851 = _1845 * _1841;
    float _1853 = _1827 * 6.283185482025146484375;
    float _1855 = cos(_1853);
    if (_1825)
    {
        bool _1857 = as_type<int>(_1795) >= 0;
        _1791 = _1857;
    }
    bool _1859 = _1791;
    float _1861 = _1637 * _1815;
    int _1863 = _1859 ? (-1) : 0;
    if (_1825)
    {
        int _1865 = _1859 ? 0 : 1078530011;
        _1611 = _1865;
    }
    int _1867 = _1611;
    int _1869 = _1867;
    if (_1825)
    {
        int _1871 = int(0x80000000) & as_type<int>(_1505);
        int _1873 = _1867 | _1871;
        _1613 = as_type<float>(_1873);
    }
    float _1875 = _1613;
    bool _1877 = !_1807;
    bool _1879 = _1877 && _1831;
    float _1881 = _1875;
    float _1883 = _1875;
    if (!_1879)
    {
        float _1885 = abs(_1505);
        bool _1887 = _1885 != as_type<float>(0x7f800000u /* inf */);
        bool _1889 = isnan(_1885);
        bool _1891 = _1887 || _1889;
        bool _1893 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1895 = _1891 || _1893;
        float _1897 = abs(_1795);
        bool _1899 = _1897 == as_type<float>(0x7f800000u /* inf */);
        float _1901 = abs(_1795);
        bool _1903 = _1901 == as_type<float>(0x7f800000u /* inf */);
        bool _1905 = !_1895;
        bool _1907 = _1903 && _1905;
        if (_1907)
        {
            bool _1909 = as_type<int>(_1795) >= 0;
            _1863 = _1909 ? (-1) : 0;
        }
        int _1911 = _1863;
        if (_1907)
        {
            _1869 = 1075235812;
        }
        int _1913 = _1869;
        int _1915 = _1913;
        if (_1907)
        {
            int _1917 = ~_1911;
            int _1919 = (_1917 != 0) ? _1913 : 1061752795;
            _1915 = _1919;
        }
        int _1921 = _1915;
        if (_1907)
        {
            int _1923 = int(0x80000000) & as_type<int>(_1505);
            int _1925 = _1921 | _1923;
            _1881 = as_type<float>(_1925);
        }
        float _1927 = _1881;
        bool _1929 = !_1895;
        bool _1931 = _1929 && _1899;
        _1883 = _1927;
        if (!_1931)
        {
            float _1933 = abs(_1505);
            float _1935 = abs(_1795);
            float _1937 = precise::max(_1933, _1935);
            float _1939 = abs(_1505);
            float _1941 = abs(_1795);
            float _1943 = precise::min(_1939, _1941);
            float _1945 = 1.0 / _1937;
            float _1947 = abs(_1505);
            float _1949 = abs(_1795);
            bool _1951 = _1947 > _1949;
            bool _1953 = as_type<int>(_1795) >= 0;
            float _1955 = _1943 * _1945;
            float _1957 = _1955 * _1955;
            float _1959 = _1957 + 11.33538818359375;
            float _1961 = fma(_1957, _1959, 28.84246826171875);
            float _1963 = fma(_1957, _1961, 19.6966705322265625);
            float _1965 = fma(_1957, -0.82336294651031494140625, -5.674867153167724609375);
            float _1967 = fma(_1957, _1965, -6.565555095672607421875);
            float _1969 = 1.0 / _1963;
            float _1971 = _1957 * _1967;
            float _1973 = abs(_1505);
            float _1975 = abs(_1795);
            float _1977 = _1973 + _1975;
            int _1979 = as_type<int>(_1505) & int(0x80000000);
            float _1981 = _1955 * _1971;
            bool _1983 = _1977 > as_type<float>(0x7f800000u /* inf */);
            bool _1985 = isnan(_1977);
            bool _1987 = _1983 || _1985;
            bool _1989 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1991 = _1987 || _1989;
            float _1993 = fma(_1981, _1969, _1955);
            float _1995 = _1993;
            _1883 = _1977;
            if (_1951)
            {
                float _1997 = -_1993;
                float _1999 = _1997 + 1.57079637050628662109375;
                _1995 = _1999;
            }
            float _2001 = _1995;
            int _2003 = as_type<int>(_2001);
            if (!_1953)
            {
                float _2005 = -_2001;
                float _2007 = _2005 + 3.1415927410125732421875;
                _2003 = as_type<int>(_2007);
            }
            int _2009 = _2003;
            if (!_1991)
            {
                int _2011 = _1979 | _2009;
                _1883 = as_type<float>(_2011);
            }
        }
    }
    float _2013 = _1883;
    float _2015 = _2013 * (-0.15915493667125701904296875);
    float _2017 = -_1849;
    float _2019 = _1603 * _2017;
    float _2021 = _1637 * _1855;
    float _2023 = _1641 * _1839;
    float _2025 = _1855 * _1815;
    float _2027 = _1637 * _1839;
    float _2029 = _1641 * _1855;
    float _2031 = _1839 * _1815;
    float _2033 = _1861 * _1849;
    float _2035 = _2015 * 6.283185482025146484375;
    float _2037 = sin(_2035);
    float _2039 = -_2023;
    float _2041 = fma(_1603, _2021, _2039);
    float _2043 = fma(_2025, _1847, _2019);
    float _2045 = fma(_1603, _2027, _2029);
    float _2047 = _1641 * _1815;
    float _2049 = fma(_2041, _1847, _2033);
    float _2051 = fma(_2031, _1851, _2043);
    float _2053 = fma(_1603, _2029, _2027);
    float _2055 = _2015 * 6.283185482025146484375;
    float _2057 = cos(_2055);
    float _2059 = fma(_2045, _1851, _2049);
    float _2061 = _1341 + _2051;
    float _2063 = -_2021;
    float _2065 = fma(_1603, _2023, _2063);
    float _2067 = _1367 + _2059;
    float _2069 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2071 = _2061 + _2069;
    float _2073 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2075 = _2067 + _2073;
    float _2077 = _2037 * _2071;
    float _2079 = _2057 * _2071;
    float _2081 = -_2077;
    float _2083 = fma(_2057, _2075, _2081);
    float _2085 = in.m_65.x;
    float _2087 = in.m_65.y;
    float _2089 = in.m_65.z;
    float _2091 = fma(_2037, _2075, _2079);
    float _2093 = _2083 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2095 = _2091 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2099 = _2093 + _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2103 = _2095 + _2101;
    float _2105 = _2099 * _2099;
    float _2107 = fma(_2103, _2103, _2105);
    float _2109 = sqrt(_2107);
    float _2111 = _277 * _2087;
    float _2113 = fma(_275, _2085, _2111);
    float _2115 = _2047 * _1849;
    float _2117 = fma(_279, _2089, _2113);
    float _2119 = fma(_2053, _1847, _2115);
    bool _2121 = _2109 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2123 = _2117 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2125 = fma(_2065, _1851, _2119);
    float _2127 = _2123 + _2125;
    float _2129 = _2123;
    float _2131 = _2089;
    float _2133 = _2125;
    float _2135 = _2107;
    float _2137 = _2021;
    if (!_2121)
    {
        _2129 = _2095;
    }
    float _2139 = _2129;
    float _2141 = _2139;
    if (!_2121)
    {
        _2131 = _2093;
    }
    float _2143 = _2131;
    float _2145 = _2143;
    if (!_2121)
    {
        _2133 = _2127;
    }
    float _2147 = _2133;
    bool _2149 = !_2121;
    float _2151 = _2147;
    if (!_2149)
    {
        float _2153 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2157 = _2109 + _2155;
        float _2159 = _2127 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2161 = rsqrt(_2107);
        float _2163 = _2157 * _2153;
        float _2165 = _2163 * 0.15915493667125701904296875;
        float _2167 = _2165 * 6.283185482025146484375;
        float _2169 = cos(_2167);
        float _2171 = _2165 * 6.283185482025146484375;
        float _2173 = sin(_2171);
        float _2175 = _2169 + (-1.0);
        float _2177 = _2175 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2179 = fma(_2173, _2159, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2181 = fma(_2127, _2169, _2177);
        float _2183 = _2161 * _2179;
        float _2185 = fma(_2103, _2183, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2187 = fma(_2099, _2183, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2151 = _2181;
        _2141 = _2185;
        _2145 = _2187;
        _2135 = _2161;
    }
    float _2189 = _2151;
    float _2191 = _2141;
    float _2193 = _2145;
    float _2195 = _2135;
    float _2197 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2199 = _2189 + _2197;
    float _2201 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2203 = _2191 + _2201;
    float _2205 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2207 = _2193 + _2205;
    float _2209 = _2199 * _2199;
    float _2211 = fma(_2203, _2203, _2209);
    float _2213 = fma(_2207, _2207, _2211);
    float _2215 = rsqrt(_2213);
    float _2217 = sqrt(_2213);
    float _2219 = _2215 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2221 = _2203 * _2219;
    float _2223 = _2207 * _2219;
    float _2225 = _2221 * _2221;
    float _2227 = _2223 * _2223;
    float _2229 = _2225 + _2227;
    float _2231 = sqrt(_2229);
    bool _2233 = _2231 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2237 = _2231 + _2235;
    float _2239 = _1815;
    float _2241 = _2229;
    float _2243 = _2237;
    float _2245 = _2221;
    float _2247 = _2223;
    float _2249 = _2225;
    float _2251 = _2227;
    if (_2233)
    {
        float _2253 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2239 = _2253;
    }
    float _2255 = _2239;
    if (_2233)
    {
        float _2257 = rsqrt(_2229);
        _2241 = _2257;
    }
    float _2259 = _2241;
    if (_2233)
    {
        float _2261 = _2237 * _2255;
        _2243 = _2261;
    }
    float _2263 = _2243;
    if (_2233)
    {
        float _2265 = _2263 * 0.15915493667125701904296875;
        _2137 = _2265;
    }
    float _2267 = _2137;
    float _2269 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2271 = _2195;
    if (_2233)
    {
        float _2273 = _2267 * 6.283185482025146484375;
        float _2275 = sin(_2273);
        _2271 = _2275;
    }
    float _2277 = _2271;
    float _2279 = precise::max(0.0, _2269);
    float _2281 = _2263;
    float _2283 = _2279;
    if (_2233)
    {
        float _2285 = _2267 * 6.283185482025146484375;
        float _2287 = cos(_2285);
        _2281 = _2287;
    }
    float _2289 = _2281;
    float _2291 = -_2219;
    float _2293 = -_2279;
    float _2295 = fma(_2199, _2291, _2293);
    float _2297 = _2295;
    if (_2233)
    {
        float _2299 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2283 = _2299;
    }
    float _2301 = _2283;
    float _2303 = _2277;
    float _2305 = _2301;
    if (_2233)
    {
        float _2307 = fma(_2277, _2301, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2303 = _2307;
    }
    float _2309 = _2303;
    float _2311 = _2309;
    if (_2233)
    {
        float _2313 = _2259 * _2309;
        _2311 = _2313;
    }
    float _2315 = _2311;
    float _2317 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2319 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    if (_2233)
    {
        float _2321 = _2289 + (-1.0);
        _2305 = _2321;
    }
    float _2323 = _2305;
    float _2325 = _2323;
    if (_2233)
    {
        float _2327 = _2221 * _2315;
        _2245 = _2327;
    }
    float _2329 = _2245;
    if (_2233)
    {
        float _2331 = _2223 * _2315;
        _2247 = _2331;
    }
    float _2333 = _2247;
    float _2335 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2317);
    if (_2233)
    {
        float _2337 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2325 = _2337;
    }
    float _2339 = _2325;
    if (_2233)
    {
        float _2341 = _2329 * _2329;
        _2249 = _2341;
    }
    float _2343 = _2249;
    if (_2233)
    {
        float _2345 = _2333 * _2333;
        _2251 = _2345;
    }
    float _2347 = _2251;
    float _2349 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2335);
    if (_2233)
    {
        float _2351 = fma(_2295, _2289, _2339);
        _2297 = _2351;
    }
    float _2353 = _2297;
    float _2355 = fma(_2353, _2353, _2343);
    float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2359 = fma(_2217, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2357);
    float _2361 = precise::clamp(_2359, 0.0, 1.0);
    float _2363 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2365 = _2355 + _2347;
    float _2367 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2369 = -_2361;
    float _2371 = _2369 + 1.0;
    float _2373 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2363);
    float _2375 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2367);
    float _2377 = rsqrt(_2365);
    float _2379 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2373);
    float _2381 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2375);
    float _2383 = _2189 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2385 = _2379 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2387 = _2381 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2389 = abs(_2371);
    float _2391 = log2(_2389);
    float _2393 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2383);
    float _2395 = _2385 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2397 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2399 = _2385 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2401 = fma(_2193, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2393);
    float _2403 = -_2397;
    float _2405 = fma(_2403, _2319, 1.0);
    float _2407 = _2377 * _2353;
    float _2409 = _2401 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2411 = _2377 * _2329;
    float _2413 = _2377 * _2333;
    float _2415 = _2349 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2417 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2395);
    float _2419 = _2411 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2421 = log2(_2405);
    float _2423 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2425 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2417);
    float _2427 = -_2419;
    float _2429 = fma(_2407, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2427);
    float _2431 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2399);
    float _2433 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2425);
    float _2435 = -_2413;
    float _2437 = fma(_2435, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2429);
    float _2439 = exp2(_2423);
    float _2441 = _2385 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2443 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2431);
    float _2445 = fma(_2437, -0.5, 0.5);
    float _2447 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2441);
    float _2449 = fma(_2437, 0.5, 0.5);
    float _2451 = _2407 + 1.0;
    float _2453 = 1.0 / _2433;
    float _2455 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2447);
    float _2457 = fma(_2449, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2459 = _2421 * 0.693147182464599609375;
    float _2461 = _2459 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2463 = sqrt(_2445);
    float _2465 = -_2407;
    float _2467 = fma(_2439, _2451, _2465);
    float _2469 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2455);
    float _2471 = fma(_2449, _2457, -0.212114393711090087890625);
    float _2473 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2443);
    float _2475 = fma(_2449, _2471, 1.570728778839111328125);
    float _2477 = _2469 * _2453;
    float _2479 = _2473 * _2453;
    float _2481 = fma(_2467, 0.5, 0.5);
    float _2483 = fma(_2477, 0.5, 0.5);
    float _2485 = fma(_2479, -0.5, 0.5);
    float _2487 = _2463 * 0.636619746685028076171875;
    float3 _6234 = float3(_2483, _2485, _2461);
    float _2489 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6234, float3(0.0), isnan(_6234)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6234, float3(0.0), isnan(_6234)), level(0.0)).x;
    float _2491 = -_2475;
    float _2493 = fma(_2487, _2491, 1.0);
    float3 _6250 = float3(_2483, _2485, _2461);
    float4 _2495 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6250, float3(0.0), isnan(_6250)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6250, float3(0.0), isnan(_6250)), level(0.0)).xyzw;
    float _2497 = _2495.x;
    float _2499 = _2495.y;
    float _2501 = _2495.z;
    float _2503 = _2495.w;
    float2 _6266 = float2(_2493, _2481);
    float3 _2507 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6266, float2(0.0), isnan(_6266)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6266, float2(0.0), isnan(_6266)), level(0.0)).xyz;
    float _2509 = _2507.x;
    float _2511 = _2507.y;
    float _2513 = _2507.z;
    float _2515 = _1197 * _1245;
    float _2517 = _1181 * 2.0;
    float _2519 = _1159 * 3.883221149444580078125;
    bool _2521 = _1167 != 0.0;
    bool _2523 = isnan(_1167);
    bool _2525 = _2521 || _2523;
    bool _2527 = isnan(0.0);
    bool _2529 = _2525 || _2527;
    float _2531 = -_973;
    float _2533 = _2531 + _1165;
    float _2535 = -_2517;
    float _2537 = fma(_2515, _2535, _2515);
    float _2539 = _2519 * 0.15915493667125701904296875;
    bool _2541 = _1141 == 0.0;
    bool _2543 = !_2529;
    bool _2545 = _2541 && _2543;
    float _2547 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2549 = fma(_1181, 3.1415927410125732421875, _2537);
    float _2551 = fma(_1109, _2533, _973);
    float _2553 = _2539 * 6.283185482025146484375;
    float _2555 = cos(_2553);
    bool _2557 = _1199 == 0.0;
    bool _2559 = _2557 && _2545;
    float _2561 = _2549 * 0.15915493667125701904296875;
    out.m_67.x = _934;
    out.m_67.y = _1003;
    out.m_67.z = _1009;
    out.m_67.w = _922;
    out.m_69.x = _1005;
    out.m_69.y = _1007;
    out.m_69.z = _1011;
    out.m_69.w = _985;
    float _2563 = _2561 * 6.283185482025146484375;
    float _2565 = sin(_2563);
    out.m_71.x = _918;
    out.m_71.y = _991;
    out.m_73.x = _1341;
    float _2567 = _2539 * 6.283185482025146484375;
    float _2569 = sin(_2567);
    float _2571 = _2385 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_73.z = _1367;
    float _2573 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2571);
    float _2575 = _2433 * 0.5;
    float _2577 = _2469 + _2433;
    float _2579 = exp2(_2547);
    float _2581 = -_1119;
    float _2583 = fma(_2565, _2555, _2581);
    float _2585 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2587 = _2577 * 0.5;
    out.m_75.x = _2191;
    out.m_75.y = _2189;
    out.m_75.z = _2193;
    float _2589 = fma(_1109, _2583, _1119);
    float _2591 = -_1121;
    float _2593 = fma(_2565, _2569, _2591);
    float _2595 = _2589;
    float _2597 = _2551;
    if (!_2559)
    {
        float _2599 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2589);
        _2595 = _2599;
    }
    float _2601 = _2595;
    out.m_47.x = _2585;
    float _2603 = fma(_1109, _2593, _1121);
    float _2605 = _2603;
    if (!_2559)
    {
        float _2607 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2551);
        _2597 = _2607;
    }
    float _2609 = _2597;
    if (!_2559)
    {
        float _2611 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2603);
        _2605 = _2611;
    }
    float _2613 = _2605;
    float _2615 = -_2579;
    float _2617 = _2615 + 1.0;
    float _2619 = -_2609;
    float _2621 = _1603 * _2619;
    float _2623 = _1861 * _2609;
    float _2625 = _2047 * _2609;
    float _2627 = _2617 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2629 = fma(_2025, _2601, _2621);
    float _2631 = fma(_2041, _2601, _2623);
    float _2633 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2573);
    float _2635 = fma(_2053, _2601, _2625);
    float _2637 = fma(_2031, _2613, _2629);
    float _2639 = fma(_2045, _2613, _2631);
    float _2641 = fma(_2415, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2633);
    float _2643 = _2637 * _2037;
    float _2645 = _2637 * _2057;
    float _2647 = _2641 + _2433;
    float _2649 = fma(_2065, _2613, _2635);
    float _2651 = -_2643;
    float _2653 = fma(_2639, _2057, _2651);
    float _2655 = fma(_2473, -0.5, _2575);
    float _2657 = -_2627;
    float _2659 = _2657 + 1.0;
    float _2661 = fma(_2639, _2037, _2645);
    float _2663 = _2647 * 0.5;
    out.gl_Position.x = _2469;
    out.gl_Position.y = _2473;
    out.gl_Position.z = _2641;
    out.gl_Position.w = _2433;
    out.m_77.x = _2661;
    out.m_77.y = _2649;
    out.m_77.z = _2653;
    out.m_79.x = _2587;
    out.m_79.y = _2655;
    out.m_79.z = _2663;
    out.m_79.w = _2433;
    float _2665 = _2627 * _2489;
    float _2667 = _2503 * _2665;
    float _2669 = _2513 * _2665;
    float _2671 = fma(_2509, _2667, _2497);
    float _2673 = fma(_2511, _2667, _2499);
    float _2675 = _2503 * _2659;
    float _2677 = fma(_2503, _2669, _2501);
    out.m_81.x = _2671;
    out.m_81.y = _2673;
    out.m_81.z = _2677;
    out.m_81.w = _2675;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

