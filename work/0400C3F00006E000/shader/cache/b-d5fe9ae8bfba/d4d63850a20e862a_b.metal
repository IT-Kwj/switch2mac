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
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c9 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d_array<float> vp_t_tcb_14 [[id(17)]];
    sampler vp_t_tcb_14Smplr [[id(18)]];
    texture2d<float> vp_t_tcb_1C [[id(19)]];
    sampler vp_t_tcb_1CSmplr [[id(20)]];
    sampler vp_t_tcb_24Smplr_w [[id(21)]];
    sampler vp_t_tcb_32Smplr_w [[id(22)]];
    sampler vp_t_tcb_30Smplr_w [[id(23)]];
    sampler vp_t_tcb_14Smplr_w [[id(24)]];
    sampler vp_t_tcb_1CSmplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

struct main0_out
{
    float4 m_73 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_97 [[user(locn3)]];
    float4 m_85 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 m_99 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_71 [[attribute(6)]];
    float4 m_67 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_83 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _114(thread const int& _11010, thread const int& _11011, constant _10& support_buffer)
{
    float _11014 = as_type<float>(support_buffer._m4);
    int _11016 = _11011 + as_type<int>(_11014);
    int _11018 = 1 + _11016;
    float _11020 = support_buffer._m5[_11018].x;
    float _11022 = abs(_11020);
    bool _11024 = _11022 == 1.0;
    if (_11024)
    {
        return _11010;
    }
    float _11026 = float(_11010);
    float _11028 = _11026 / _11022;
    int _11030 = int(_11028);
    return _11030;
}

static inline __attribute__((always_inline))
int _115(thread const int& _11060, thread const int& _11061, constant _10& support_buffer)
{
    float _11064 = as_type<float>(support_buffer._m4);
    int _11066 = _11061 + as_type<int>(_11064);
    int _11068 = 1 + _11066;
    float _11070 = support_buffer._m5[_11068].x;
    bool _11072 = _11070 == 1.0;
    if (_11072)
    {
        return _11060;
    }
    float _11074 = float(_11060);
    float _11076 = _11074 * _11070;
    int _11078 = int(_11076);
    return _11078;
}

static inline __attribute__((always_inline))
void _112(thread const int& _10705, thread const int& _10706, thread const int& _10707, thread const int& _10708, thread int& _10709, thread int& _10710, thread int& _10711, thread int& _10712, thread int& _10713, thread int& _10714, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _10717 = _10706;
    int _10719 = _10707;
    float _10721 = 0.0 + as_type<float>(_10705);
    bool _10723 = _10721 != 0.0;
    bool _10725 = isnan(_10721);
    bool _10727 = _10723 || _10725;
    bool _10729 = isnan(0.0);
    bool _10731 = _10727 || _10729;
    int _10733 = as_type<int>(_10721);
    int _10735 = _10731 ? (-1) : 0;
    if (!_10731)
    {
        float _10737 = as_type<float>(_10705) * 1.0;
        _10717 = as_type<int>(_10737);
    }
    int _10739 = _10717;
    bool _10741 = !_10731;
    int _10743 = _10739;
    int _10745 = _10739;
    if (!_10741)
    {
        bool _10747 = _10721 >= 0.0;
        bool _10749 = isnan(_10721);
        bool _10751 = _10747 || _10749;
        bool _10753 = isnan(0.0);
        bool _10755 = _10751 || _10753;
        _10735 = _10755 ? (-1) : 0;
        if (!_10755)
        {
            _10743 = 2147483647;
        }
        int _10757 = _10743;
        bool _10759 = !_10755;
        int _10761 = _10757;
        _10745 = _10757;
        if (!_10759)
        {
            float _10763 = abs(as_type<float>(_10705));
            float _10765 = 0.0 + _10763;
            bool _10767 = _10765 > as_type<float>(0x7f800000u /* inf */);
            bool _10769 = isnan(_10765);
            bool _10771 = _10767 || _10769;
            bool _10773 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _10775 = _10771 || _10773;
            _10733 = as_type<int>(_10765);
            _10735 = _10775 ? (-1) : 0;
            if (_10775)
            {
                float _10777 = as_type<float>(_10705) + 1.0;
                _10761 = as_type<int>(_10777);
            }
            int _10779 = _10761;
            int _10781 = _10779;
            _10745 = _10779;
            if (!_10775)
            {
                bool _10783 = _10765 != as_type<float>(0x7f800000u /* inf */);
                bool _10785 = isnan(_10765);
                bool _10787 = _10783 || _10785;
                bool _10789 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _10791 = _10787 || _10789;
                _10735 = _10791 ? (-1) : 0;
                if (!_10791)
                {
                    _10781 = _10705;
                }
                int _10793 = _10781;
                bool _10795 = !_10791;
                _10745 = _10793;
                if (!_10795)
                {
                    float _10797 = as_type<float>(_10705) * 18446744073709551616.0;
                    float _10799 = rsqrt(_10797);
                    float _10801 = _10797 * _10799;
                    float _10803 = _10799 * 0.5;
                    float _10805 = -_10801;
                    float _10807 = 0.0 + _10805;
                    float _10809 = fma(_10803, _10807, 0.5);
                    float _10811 = fma(_10801, _10809, _10801);
                    float _10813 = -_10811;
                    float _10815 = 0.0 + _10813;
                    float _10817 = fma(_10811, _10815, _10797);
                    float _10819 = fma(_10803, _10817, _10811);
                    float _10821 = _10819 * 2.3283064365386962890625e-10;
                    _10733 = as_type<int>(_10819);
                    _10745 = as_type<int>(_10821);
                    _10719 = as_type<int>(_10807);
                }
            }
        }
    }
    int _10823 = _10733;
    int _10825 = _10745;
    int _10827 = _10719;
    int _10829 = _10735;
    _10709 = _10708;
    _10710 = 0;
    _10711 = _10823;
    _10712 = _10825;
    _10713 = _10827;
    _10714 = _10829;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3899 = false;
    bool _2131 = false;
    bool _1943 = false;
    bool _1395 = false;
    bool _1215 = false;
    bool _997 = false;
    bool _709 = false;
    bool _325 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_58.w;
    float _121 = trunc(_119);
    int _123 = int(_121);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    float _133 = _131;
    if (!_127)
    {
        out.m_61.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4244 = as_type<float>(_139);
        out.gl_Position.z = _4244;
    }
    if (!_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_63.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_123);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_61.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4314 = as_type<float>(_177);
        out.gl_Position.z = _4314;
    }
    if (_169)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _179 = in.m_65.y;
    float _181 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _183 = in.m_67.w;
    bool _185 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _187 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _189 = _185 || _187;
    bool _191 = isnan(1.0);
    bool _193 = _189 || _191;
    float _195 = in.m_63.x;
    float _197 = in.m_63.y;
    float _199 = in.m_63.z;
    float _201 = in.m_58.x;
    float _203 = in.m_58.y;
    float _205 = in.m_58.z;
    float _207 = 0.0;
    float _209 = _181;
    if (!_193)
    {
        float _211 = _181 * _181;
        float _213 = _211 * 0.5;
        _207 = _213;
    }
    float _215 = _207;
    float _217 = _215;
    if (!_193)
    {
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _219;
    }
    float _221 = _217;
    out.m_69.y = _179;
    bool _223 = !_193;
    float _225 = _221;
    float _227 = _179;
    if (!_223)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _181 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _181);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _257;
    }
    float _259 = _225;
    bool _261 = !_193;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _181 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _209 = _281;
    }
    float _283 = _209;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _287 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _291 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _293 = fma(_283, _195, _287);
    float _295 = fma(_283, _197, _289);
    float _297 = fma(_283, _199, _291);
    float _299 = fma(_293, _183, _201);
    float _301 = fma(_295, _183, _203);
    float _303 = fma(_297, _183, _205);
    bool _305 = !_285;
    float _323;
    if (!_305)
    {
        float _307 = in.m_71.x;
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _311 = _307 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        float _327 = float(_123);
        float _329 = 1.0 / _327;
        float _331 = _157 * _329;
        _323 = _331;
    }
    _325 = false;
    float _333 = _323;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _351 = 1.0 / _337;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _361 = 1.0 / _345;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _365 = _333 + _363;
    bool _367 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _369 = isnan(_333);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = 1.0 / _341;
    float _381 = _365 * _351;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _385 = _333 + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _389 = _333 + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _393 = _333 + _391;
    bool _395 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _397 = 1.0 / _349;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _401 = _333 + _399;
    float _403 = _385 * _361;
    bool _405 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _407 = isnan(_333);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = 1.0 / _355;
    float _419 = _401 * _379;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _423 = _333 + _421;
    float _425 = -_415;
    float _427 = _425 + 1.0;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _433;
    float _437 = 1.0 / _359;
    float _439 = _389 * _397;
    bool _441 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _443 = isnan(_333);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = fma(_435, _381, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _455 = _423 * _417;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = _451 * _427;
    float _463 = -_451;
    float _465 = _463 + 1.0;
    float _467 = fma(_431, _381, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _469 = fma(_459, _381, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _471 = -_377;
    float _473 = _471 + 1.0;
    float _475 = _377 * _465;
    float _477 = _393 * _437;
    bool _479 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _481 = isnan(_333);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _495 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _497 = isnan(_333);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _515 = -_489;
    float _517 = _515 + 1.0;
    bool _519 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _521 = isnan(_333);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = fma(_493, _419, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _533 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _535 = isnan(_333);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = fma(_509, _419, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _547 = fma(_513, _419, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _549 = _505 * _517;
    float _551 = -_505;
    float _553 = _551 + 1.0;
    float _555 = -_543;
    float _557 = _555 + 1.0;
    float _559 = _489 * _473;
    float _561 = _543 * _553;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _567;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _571;
    float _575 = _529 * _557;
    float _577 = fma(_565, _403, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _579 = fma(_569, _403, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _581 = fma(_573, _403, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _583 = _453 * _575;
    float _585 = _469 * _575;
    float _587 = -_529;
    float _589 = _587 + 1.0;
    float _591 = _467 * _575;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _605 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].y, _585);
    float _607 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].x, _591);
    float _609 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].z, _583);
    float _611 = fma(_595, _439, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _613 = fma(_599, _439, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _615 = fma(_603, _439, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _617 = fma(_545, _561, _605);
    float _619 = fma(_531, _561, _607);
    float _621 = fma(_547, _561, _609);
    float _623 = fma(_577, _549, _617);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _625;
    float _629 = fma(_579, _549, _619);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _631;
    float _635 = fma(_581, _549, _621);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _637;
    float _641 = fma(_627, _455, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _643 = fma(_611, _559, _629);
    float _645 = fma(_633, _455, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _647 = fma(_613, _559, _623);
    float _649 = fma(_615, _559, _635);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _655 = fma(_639, _455, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _665 = fma(_653, _477, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _667 = fma(_641, _475, _647);
    float _669 = fma(_645, _475, _643);
    float _671 = fma(_659, _477, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _673 = fma(_663, _477, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _675 = fma(_655, _475, _649);
    float _677 = fma(_665, _461, _667);
    float _679 = fma(_671, _461, _669);
    float _681 = fma(_673, _461, _675);
    float _683 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[149].y, _677);
    float _685 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[149].x, _679);
    float _687 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[149].z, _681);
    bool _689 = !_395;
    float _707;
    if (!_689)
    {
        float _691 = in.m_71.x;
        float _693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _695 = _691 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[11].x, _157);
        float _699 = _697 * _693;
        float _701 = floor(_699);
        float _703 = -_701;
        float _705 = _699 + _703;
        _707 = _705;
        _709 = true;
    }
    else
    {
        float _711 = float(_123);
        float _713 = 1.0 / _711;
        float _715 = _157 * _713;
        _707 = _715;
    }
    _709 = false;
    float _717 = _707;
    float _719 = in.m_67.x;
    float _721 = in.m_67.y;
    float _723 = in.m_67.z;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _727 = _717 + _725;
    bool _729 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _731 = isnan(_717);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _741;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _749;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _757 = 1.0 / _743;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _761 = _717 + _759;
    bool _763 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _765 = isnan(_717);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    float _775 = 1.0 / _747;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _779 = _717 + _777;
    bool _781 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _783 = 1.0 / _755;
    float _785 = _779 * _757;
    bool _787 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _789 = isnan(_717);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = _687 * _723;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _803 = _717 + _801;
    float _805 = _683 * _721;
    float _807 = -_797;
    float _809 = _807 + 1.0;
    float _811 = 1.0 / _751;
    float _813 = _727 * _775;
    float _815 = _739 * _809;
    float _817 = -_739;
    float _819 = _817 + 1.0;
    bool _821 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _823 = isnan(_717);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = _685 * _719;
    float _835 = _803 * _783;
    bool _837 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _839 = isnan(_717);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _849;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _857 = -_847;
    float _859 = _857 + 1.0;
    float _861 = _847 * _819;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _865 = _863 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _867 = _761 * _811;
    float _869 = _831 * _859;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _871;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _875;
    float _879 = -_831;
    float _881 = _879 + 1.0;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _887 = fma(_873, _785, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _889 = fma(_877, _785, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _891 = _773 * _881;
    float _893 = fma(_851, _785, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _895 = fma(_855, _813, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _897 = fma(_885, _813, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _899 = fma(_865, _813, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _901 = _887 * _891;
    float _903 = _889 * _891;
    float _905 = _893 * _891;
    float _907 = -_773;
    float _909 = _907 + 1.0;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _911;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _915;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _919;
    float _923 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[107].y, _903);
    float _925 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[107].z, _905);
    float _927 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[107].x, _901);
    float _929 = fma(_913, _867, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _931 = fma(_897, _869, _923);
    float _933 = fma(_899, _869, _925);
    float _935 = fma(_921, _867, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _937 = fma(_895, _869, _927);
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _947 = fma(_917, _867, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _953 = fma(_929, _861, _937);
    float _955 = fma(_941, _835, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _957 = fma(_945, _835, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _959 = fma(_935, _861, _931);
    float _961 = fma(_951, _835, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _963 = fma(_947, _861, _933);
    float _965 = fma(_955, _815, _953);
    float _967 = fma(_957, _815, _959);
    float _969 = fma(_961, _815, _963);
    float _971 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[111].x, _965);
    float _973 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[111].y, _967);
    float _975 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[111].z, _969);
    bool _977 = !_781;
    float _995;
    if (!_977)
    {
        float _979 = in.m_71.x;
        float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _983 = _979 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _985 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[11].y, _157);
        float _987 = _985 * _981;
        float _989 = floor(_987);
        float _991 = -_989;
        float _993 = _987 + _991;
        _995 = _993;
        _997 = true;
    }
    else
    {
        float _999 = float(_123);
        float _1001 = 1.0 / _999;
        float _1003 = _157 * _1001;
        _995 = _1003;
    }
    _997 = false;
    float _1005 = _995;
    float _1007 = _971 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1009 = _973 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1013 = _1011 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1019 = 1.0 / _1013;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1025;
    bool _1029 = _1005 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1031 = isnan(_1005);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1043 = _1041 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1045 = _1005 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1047 = isnan(_1005);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1053 = _1049 || _1051;
    float _1055 = float(_1053);
    float _1057 = _975 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1059 = 1.0 / _1017;
    bool _1061 = _1005 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1063 = isnan(_1005);
    bool _1065 = _1061 || _1063;
    bool _1067 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1069 = _1065 || _1067;
    float _1071 = float(_1069);
    bool _1073 = _1005 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1075 = isnan(_1005);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    bool _1085 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1087 = -_1071;
    float _1089 = _1087 + 1.0;
    float _1091 = 1.0 / _1023;
    float _1093 = _1027 * _1019;
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1097 = _1005 + _1095;
    float _1099 = _1083 * _1089;
    float _1101 = -_1083;
    float _1103 = _1101 + 1.0;
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1107 = _1005 + _1105;
    float _1109 = fma(_1093, _1097, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1111 = -_1039;
    float _1113 = _1111 + 1.0;
    float _1115 = 1.0 / _1043;
    float _1117 = -_1055;
    float _1119 = _1117 + 1.0;
    float _1121 = _1109 * _1099;
    float _1123 = _1071 * _1113;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1125;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1131 = _1129 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1133 = _1039 * _1119;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1139 = _1127 * _1059;
    float _1141 = _1131 * _1091;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1145 = _1005 + _1143;
    bool _1147 = _1005 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1149 = isnan(_1005);
    bool _1151 = _1147 || _1149;
    bool _1153 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1155 = _1151 || _1153;
    float _1157 = float(_1155);
    float _1159 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1121);
    float _1161 = fma(_1139, _1107, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1163 = fma(_1141, _1145, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1167 = _1005 + _1165;
    float _1169 = _1137 * _1115;
    float _1171 = -_1157;
    float _1173 = _1171 + 1.0;
    float _1175 = fma(_1163, _1123, _1159);
    float _1177 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = fma(_1169, _1167, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1181 = _1055 * _1173;
    float _1183 = fma(_1161, _1133, _1175);
    float _1185 = fma(_1179, _1181, _1183);
    float _1187 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1189 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1191 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1185);
    float _1193 = _1191 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_73.x = _1177;
    out.m_73.y = _1187;
    out.m_73.z = _1189;
    out.m_73.w = _1193;
    bool _1195 = !_1085;
    float _1213;
    if (!_1195)
    {
        float _1197 = in.m_71.x;
        float _1199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1201 = _1197 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1203 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[11].z, _157);
        float _1205 = _1203 * _1199;
        float _1207 = floor(_1205);
        float _1209 = -_1207;
        float _1211 = _1205 + _1209;
        _1213 = _1211;
        _1215 = true;
    }
    else
    {
        float _1217 = float(_123);
        float _1219 = 1.0 / _1217;
        float _1221 = _157 * _1219;
        _1213 = _1221;
    }
    _1215 = false;
    float _1223 = _1213;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1227 = _1223 + _1225;
    bool _1229 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1231 = isnan(_1223);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1243 = _1223 + _1241;
    bool _1245 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1247 = isnan(_1223);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1253 = _1249 || _1251;
    float _1255 = float(_1253);
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1263 = _1261 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1265 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1267 = isnan(_1223);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = 1.0 / _1259;
    bool _1279 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1281 = 1.0 / _1263;
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1283;
    float _1287 = _1227 * _1277;
    float _1289 = -_1239;
    float _1291 = _1289 + 1.0;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1293;
    float _1297 = fma(_1285, _1287, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1299 = _1275 * _1291;
    float _1301 = -_1275;
    float _1303 = _1301 + 1.0;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1305;
    float _1309 = fma(_1295, _1287, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1311 = _1243 * _1281;
    float _1313 = _1255 * _1303;
    float _1315 = fma(_1307, _1287, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1317 = -_1255;
    float _1319 = _1317 + 1.0;
    float _1321 = _1297 * _1313;
    float _1323 = _1315 * _1313;
    float _1325 = _1309 * _1313;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1329 = _1327 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1337 = _1335 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1339 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1323);
    float _1341 = fma(_1329, _1311, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1343 = fma(_1333, _1311, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1345 = fma(_1337, _1311, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1347 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1321);
    float _1349 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1325);
    float _1351 = fma(_1341, _1299, _1339);
    float _1353 = fma(_1343, _1299, _1347);
    float _1355 = fma(_1345, _1299, _1349);
    float _1357 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1351);
    float _1359 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1353);
    float _1361 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1355);
    float _1363 = _1357 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1365 = _1359 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1367 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1369 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1371 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1373 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_75.x = _1369;
    out.m_75.y = _1371;
    out.m_75.z = _1373;
    bool _1375 = !_1279;
    float _1393;
    if (!_1375)
    {
        float _1377 = in.m_71.x;
        float _1379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1381 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[14].x, _157);
        float _1385 = _1383 * _1379;
        float _1387 = floor(_1385);
        float _1389 = -_1387;
        float _1391 = _1385 + _1389;
        _1393 = _1391;
        _1395 = true;
    }
    else
    {
        float _1397 = float(_123);
        float _1399 = 1.0 / _1397;
        float _1401 = _157 * _1399;
        _1393 = _1401;
    }
    _1395 = false;
    float _1403 = _1393;
    int _1405 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1407 = _1405;
    int _1409 = 0;
    int _1411 = _114(_1407, _1409, (*spvDescriptorSet0.support_buffer));
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1419 = _1417 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1423 = _1421 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1425 = 1.0 / _1415;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1427;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1433 = _1431 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1435 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1437 = isnan(_1403);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1443 = _1439 || _1441;
    float _1445 = float(_1443);
    bool _1447 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1449 = isnan(_1403);
    bool _1451 = _1447 || _1449;
    bool _1453 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1455 = _1451 || _1453;
    float _1457 = float(_1455);
    float _1459 = 1.0 / _1419;
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1463 = _1461 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1465 = -_1445;
    float _1467 = _1465 + 1.0;
    float _1469 = 1.0 / _1423;
    float _1471 = _1429 * _1425;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1475 = _1473 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1483 = _1481 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1485 = 1.0 / _1433;
    bool _1487 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1489 = isnan(_1403);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1495 = _1491 || _1493;
    float _1497 = float(_1495);
    float _1499 = _1479 * _1459;
    bool _1501 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1503 = isnan(_1403);
    bool _1505 = _1501 || _1503;
    bool _1507 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1509 = _1505 || _1507;
    float _1511 = float(_1509);
    float _1513 = -_1497;
    float _1515 = _1513 + 1.0;
    float _1517 = _1475 * _1469;
    float _1519 = 1.0 / _1463;
    bool _1521 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1523 = isnan(_1403);
    bool _1525 = _1521 || _1523;
    bool _1527 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1529 = _1525 || _1527;
    float _1531 = float(_1529);
    float _1533 = _1511 * _1515;
    float _1535 = -_1511;
    float _1537 = _1535 + 1.0;
    float _1539 = -_1531;
    float _1541 = _1539 + 1.0;
    float _1543 = _1531 * _1537;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1549;
    float _1553 = _1445 * _1541;
    bool _1555 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1557 = isnan(_1403);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = _1547 * _1485;
    float _1569 = _1457 * _1467;
    float _1571 = -_1457;
    float _1573 = _1571 + 1.0;
    float _1575 = 1.0 / _1483;
    float _1577 = _1551 * _1519;
    bool _1579 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1581 = isnan(_1403);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    float _1591 = _1565 * _1573;
    float _1593 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1595 = _1403 + _1593;
    float _1597 = -_1565;
    float _1599 = _1597 + 1.0;
    float _1601 = fma(_1471, _1595, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1603 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1605 = _1603 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1607 = _1589 * _1599;
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1611 = _1609 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1615 = _1403 + _1613;
    float _1617 = -_1589;
    float _1619 = _1617 + 1.0;
    float _1621 = _1601 * _1607;
    float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1625 = _1403 + _1623;
    float _1627 = fma(_1517, _1615, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1629 = 1.0 / _1611;
    float _1631 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1621);
    float _1633 = _1605 * _1575;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1637 = _1403 + _1635;
    float _1639 = fma(_1499, _1625, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1641 = fma(_1627, _1591, _1631);
    float _1643 = in.m_71.x;
    float _1645 = in.m_71.y;
    float _1647 = fma(_1567, _1637, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1651 = _1403 + _1649;
    float _1653 = fma(_1639, _1569, _1641);
    bool _1655 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1657 = isnan(_1403);
    bool _1659 = _1655 || _1657;
    bool _1661 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1663 = _1659 || _1661;
    float _1665 = float(_1663);
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1669 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1667;
    float _1671 = fma(_1577, _1651, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1675 = _1403 + _1673;
    float _1677 = fma(_1647, _1553, _1653);
    float _1679 = _1669 * _1629;
    float _1681 = -_1665;
    float _1683 = _1681 + 1.0;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1687 = _1403 + _1685;
    float _1689 = fma(_1633, _1675, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1691 = fma(_1671, _1543, _1677);
    float _1693 = _1497 * _1683;
    float _1695 = fma(_1679, _1687, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1697 = in.m_65.z;
    float _1699 = fma(_1689, _1533, _1691);
    float _1701 = fma(_1695, _1693, _1699);
    float _1703 = -_1643;
    float _1705 = fma(0.5, _1703, 1.0);
    float _1707 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1701);
    float _1709 = _1707 * _1705;
    float _1711 = precise::clamp(_1709, 0.0, 1.0);
    float _1713 = trunc(_1697);
    int _1715 = int(_1713);
    int _1717 = _1411 + (-1);
    float _1719 = float(_1717);
    float _1721 = _1711 * _1719;
    float _1723 = trunc(_1721);
    int _1725 = int(_1723);
    int _1727 = _1725;
    int _1729 = 0;
    int _1731 = _115(_1727, _1729, (*spvDescriptorSet0.support_buffer));
    int _1733 = _1715;
    int _1735 = 0;
    int _1737 = _115(_1733, _1735, (*spvDescriptorSet0.support_buffer));
    float4 _1740 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1731, _1737)), 0).xyzw;
    float _1742 = _1740.x;
    float _1744 = _1740.y;
    float _1746 = _1740.z;
    float _1748 = _1740.w;
    float _1750 = in.m_65.x;
    float _1752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1756 = _1754 != 0;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1760 = _1758 != 0;
    float _1762 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1764 = _1645 > 0.5;
    bool _1766 = _1764 && _1760;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1770 = _1719;
    float _1772 = _1591;
    if (_1756)
    {
        float _1774 = in.m_71.x;
        _1770 = _1774;
    }
    float _1776 = _1770;
    float _1778 = fma(_1645, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1768);
    if (_1766)
    {
        float _1780 = -_179;
        float _1782 = _1780 + 1.0;
        _227 = _1782;
    }
    float _1784 = _227;
    if (_1756)
    {
        _1772 = _1750;
    }
    float _1786 = _1772;
    bool _1788 = _1776 > 0.5;
    bool _1790 = _1788 && _1756;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1794 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1796 = -_1792;
    float _1798 = fma(_1794, 2.0, _1796);
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1802 = _1786;
    float _1804 = _1792;
    if (_1790)
    {
        float _1806 = -_1786;
        float _1808 = _1806 + 1.0;
        _1802 = _1808;
    }
    float _1810 = _1802;
    if (!_1756)
    {
        _1804 = _1750;
    }
    float _1812 = _1804;
    float _1814 = -_157;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1798);
    float _1818 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1800);
    float _1820 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1822 = _1812;
    if (_1756)
    {
        _1822 = _1810;
    }
    float _1824 = _1822;
    float _1826 = _1762 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1828 = fma(_1820, _1784, -0.5);
    float _1830 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1818);
    float _1832 = fma(_1826, _1824, -0.5);
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1836 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1838 = fma(_1830, _1832, _1816);
    int _1840 = _1725 + 1;
    float _1842 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1778);
    float _1844 = fma(_1836, -2.0, _1834);
    float _1846 = _1838 + 0.5;
    int _1848 = min(_1717, _1840);
    float _1850 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1844);
    float _1852 = -_1850;
    float _1854 = fma(_1842, _1828, _1852);
    float _1856 = _1854 + 0.5;
    uint _1859 = as_type<uint>(half2(float2(_1748, 0.0)));
    uint _1861 = extract_bits(_1859, 0u, 8u);
    int _1863 = int(_1861) & 255;
    uint _1865 = extract_bits(_1859, 8u, 8u);
    int _1867 = int(_1865) & 255;
    int _1869 = _1867 << 8;
    int _1871 = _1863 | _1869;
    bool _1873 = _1871 >= 32768;
    int _1875 = _1871 + (-1024);
    int _1877 = _1875;
    if (_1873)
    {
        int _1879 = ~_1871;
        int _1881 = _1879 + 33792;
        int _1883 = _1881 + 1;
        _1877 = _1883;
    }
    int _1885 = _1877;
    int _1887 = _1885 + 30719;
    float _1889 = float(_1887);
    float _1891 = fma(_1889, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1893 = abs(_1891);
    float _1895 = -_1893;
    float _1897 = _1895 + 1.0;
    bool _1899 = _1891 < 0.0;
    float _1901 = float(_1899);
    float _1903 = abs(_1891);
    float _1905 = fma(_1903, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1907 = as_type<int>(_1897) + (-218103808);
    float _1909 = abs(_1891);
    float _1911 = fma(_1909, _1905, -0.212114393711090087890625);
    bool _1913 = uint(_1907) >= 1920991232u;
    float _1915 = abs(_1891);
    float _1917 = fma(_1915, _1911, 1.570728778839111328125);
    bool _1919 = !_1913;
    float _1941;
    if (!_1919)
    {
        int _1921 = as_type<int>(_1897);
        int _1923 = _1717;
        int _1925 = as_type<int>(_1816);
        int _1927 = 9536;
        int _1929;
        int _1931;
        int _1933;
        int _1935;
        int _1937;
        int _1939;
        _112(_1921, _1923, _1925, _1927, _1929, _1931, _1933, _1935, _1937, _1939, out.gl_Position, out.gl_PointSize);
        _1941 = as_type<float>(_1935);
        _1943 = true;
    }
    else
    {
        float _1945 = rsqrt(_1897);
        float _1947 = _1897 * _1945;
        float _1949 = _1945 * 0.5;
        float _1951 = -_1947;
        float _1953 = 0.0 + _1951;
        float _1955 = fma(_1949, _1953, 0.5);
        float _1957 = fma(_1947, _1955, _1947);
        float _1959 = -_1957;
        float _1961 = 0.0 + _1959;
        float _1963 = fma(_1957, _1961, _1897);
        float _1965 = fma(_1949, _1963, _1957);
        _1941 = _1965;
    }
    _1943 = false;
    float _1967 = _1941;
    int _1969 = _1848;
    int _1971 = 0;
    int _1973 = _115(_1969, _1971, (*spvDescriptorSet0.support_buffer));
    int _1975 = _1715;
    int _1977 = 0;
    int _1979 = _115(_1975, _1977, (*spvDescriptorSet0.support_buffer));
    float4 _1981 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1973, _1979)), 0).xyzw;
    float _1983 = _1981.x;
    float _1985 = _1981.y;
    float _1987 = _1981.z;
    float _1989 = _1981.w;
    float _1991 = _1917 * _1967;
    float _1993 = _1901 * 2.0;
    float _1995 = _1889 * 3.883221149444580078125;
    float _1997 = floor(_1721);
    float _1999 = -_1993;
    float _2001 = fma(_1991, _1999, _1991);
    float _2003 = _1995 * 0.15915493667125701904296875;
    float _2005 = fma(_1901, 3.1415927410125732421875, _2001);
    float _2007 = _2003 * 6.283185482025146484375;
    float _2009 = cos(_2007);
    float _2011 = _2005 * 0.15915493667125701904296875;
    float _2013 = _2011 * 6.283185482025146484375;
    float _2015 = sin(_2013);
    float _2017 = -_1997;
    float _2019 = _1721 + _2017;
    float _2021 = _2003 * 6.283185482025146484375;
    float _2023 = sin(_2021);
    float _2025 = _2015 * _2009;
    float _2027 = _2015 * _2023;
    uint _2029 = as_type<uint>(half2(float2(_1989, 0.0)));
    float _2031 = -_1746;
    float _2033 = _2031 + _1987;
    float _2035 = -_1742;
    float _2037 = _2035 + _1983;
    uint _2039 = extract_bits(_2029, 0u, 8u);
    int _2041 = int(_2039) & 255;
    uint _2043 = extract_bits(_2029, 8u, 8u);
    int _2045 = int(_2043) & 255;
    int _2047 = _2045 << 8;
    int _2049 = _2041 | _2047;
    float _2051 = fma(_2019, _2033, _1746);
    float _2053 = fma(_2019, _2037, _1742);
    bool _2055 = _2049 >= 32768;
    int _2057 = _2049 + (-1024);
    int _2059 = _2057;
    if (_2055)
    {
        int _2061 = ~_2049;
        int _2063 = _2061 + 33792;
        int _2065 = _2063 + 1;
        _2059 = _2065;
    }
    int _2067 = _2059;
    int _2069 = _2067 + 30719;
    float _2071 = float(_2069);
    float _2073 = fma(_2071, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2075 = abs(_2073);
    float _2077 = -_2075;
    float _2079 = _2077 + 1.0;
    bool _2081 = _2073 < 0.0;
    float _2083 = float(_2081);
    float _2085 = abs(_2073);
    float _2087 = fma(_2085, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2089 = as_type<int>(_2079) + (-218103808);
    float _2091 = abs(_2073);
    float _2093 = fma(_2091, _2087, -0.212114393711090087890625);
    bool _2095 = uint(_2089) >= 1920991232u;
    float _2097 = -_1744;
    float _2099 = _2097 + _1985;
    float _2101 = abs(_2073);
    float _2103 = fma(_2101, _2093, 1.570728778839111328125);
    float _2105 = fma(_2019, _2099, _1744);
    bool _2107 = !_2095;
    float _2129;
    if (!_2107)
    {
        int _2109 = as_type<int>(_2079);
        int _2111 = as_type<int>(_1985);
        int _2113 = as_type<int>(_2079);
        int _2115 = 10448;
        int _2117;
        int _2119;
        int _2121;
        int _2123;
        int _2125;
        int _2127;
        _112(_2109, _2111, _2113, _2115, _2117, _2119, _2121, _2123, _2125, _2127, out.gl_Position, out.gl_PointSize);
        _2129 = as_type<float>(_2123);
        _2131 = true;
    }
    else
    {
        float _2133 = rsqrt(_2079);
        float _2135 = _2079 * _2133;
        float _2137 = _2133 * 0.5;
        float _2139 = -_2135;
        float _2141 = 0.0 + _2139;
        float _2143 = fma(_2137, _2141, 0.5);
        float _2145 = fma(_2135, _2143, _2135);
        float _2147 = -_2145;
        float _2149 = 0.0 + _2147;
        float _2151 = fma(_2145, _2149, _2079);
        float _2153 = fma(_2137, _2151, _2145);
        _2129 = _2153;
    }
    _2131 = false;
    float _2155 = _2129;
    float _2157 = _301 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2159 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2157);
    float _2161 = _301 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2163 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2159);
    float _2165 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2161);
    float _2167 = _2163 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2169 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2165);
    float _2171 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2173 = _2169 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2175 = floor(_2171);
    float _2177 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2179 = floor(_2177);
    float _2181 = -_2175;
    float _2183 = _2171 + _2181;
    float _2185 = -_2179;
    float _2187 = _2177 + _2185;
    float2 _7416 = float2(_2183, _2187);
    float _2189 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7416, float2(0.0), isnan(_7416)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7416, float2(0.0), isnan(_7416)), level(0.0)).x;
    float _2191 = in.m_71.x;
    float _2193 = in.m_71.y;
    float _2195 = in.m_71.z;
    float _2197 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2199 = log2(_2197);
    float _2201 = _301 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2203 = _799 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2205 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2201);
    float _2207 = _805 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2209 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2205);
    float _2211 = _833 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2213 = _2209 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2215 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2217 = _2199 * _157;
    float _2219 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2221 = _2213 + _2215;
    float _2223 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2219);
    float _2225 = exp2(_2217);
    float _2227 = _2191 * 2.0;
    float _2229 = _2193 * 2.0;
    float _2231 = _2195 * 2.0;
    float _2233 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2235 = floor(_2227);
    float _2237 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2233);
    float _2239 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2237);
    float _2241 = floor(_2229);
    float _2243 = -_2225;
    float _2245 = _2243 + 1.0;
    float _2247 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _2249 = _2235 > 0.0;
    float _2251 = floor(_2231);
    bool _2253 = _2235 >= 0.0;
    bool _2255 = isnan(_2235);
    bool _2257 = _2253 || _2255;
    bool _2259 = isnan(0.0);
    bool _2261 = _2257 || _2259;
    int _2263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2265 = _2263 != 0;
    int _2267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2269 = _2267 != 0;
    int _2271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2273 = _2271 != 0;
    float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2277 = 1.0 + _2275;
    int _2279 = _2261 ? 0 : 1;
    float _2281 = trunc(_2247);
    int _2283 = int(_2281);
    bool _2285 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2287 = isnan(1.0);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2293 = _2289 || _2291;
    float _2295 = _2195 + _2193;
    bool _2297 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2299 = isnan(0.0);
    bool _2301 = _2297 || _2299;
    bool _2303 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2305 = _2301 || _2303;
    float _2307 = 1.0 / _2277;
    float _2309 = _2295 + (-1.0);
    int _2311 = ~_2279;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    int _2317 = _2315;
    int _2319 = 2;
    if (!_2249)
    {
        int _2321 = ~_2279;
        int _2323 = _2321 + 1;
        _2317 = _2323;
    }
    int _2325 = _2317;
    float _2327 = fma(_2309, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2329 = _2305 ? _2245 : 0.0;
    bool _2331 = !_2269;
    int _2333 = _2331 ? 0 : 1;
    bool _2335 = _2241 > 0.0;
    bool _2337 = _2241 >= 0.0;
    bool _2339 = isnan(_2241);
    bool _2341 = _2337 || _2339;
    bool _2343 = isnan(0.0);
    bool _2345 = _2341 || _2343;
    float _2347 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2223);
    int _2349 = abs(_2333);
    float _2351 = in.m_77.x;
    float _2353 = in.m_77.y;
    float _2355 = in.m_77.z;
    if (_2293)
    {
        float _2357 = _2329 * _2307;
        _159 = _2357;
    }
    float _2359 = _159;
    float _2361 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2363 = _2347 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2365 = float(_2349);
    float _2367 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2361);
    float _2369 = float(_2325);
    float _2371 = 1.0 / _2363;
    bool _2373 = _2251 > 0.0;
    float _2375 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2367);
    bool _2377 = _2251 >= 0.0;
    bool _2379 = isnan(_2251);
    bool _2381 = _2377 || _2379;
    bool _2383 = isnan(0.0);
    bool _2385 = _2381 || _2383;
    float _2387 = _2365 * _2369;
    bool _2389 = !_2265;
    int _2391 = _2389 ? 0 : 1;
    float _2393 = _2375 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2395 = _2345 ? 0 : 1;
    int _2397 = abs(_2391);
    float _2399 = _2393 + _2363;
    float _2401 = _2387 * (-2.0);
    int _2403 = _2385 ? 0 : 1;
    int _2405 = ~_2395;
    int _2407 = _2405 + 1;
    int _2409 = _2407 + 1;
    int _2411 = _2409;
    if (!_2335)
    {
        int _2413 = ~_2395;
        int _2415 = _2413 + 1;
        _2411 = _2415;
    }
    int _2417 = _2411;
    float _2419 = fma(_2401, _2353, _2353);
    float _2421 = _2193 + (-0.5);
    int _2423 = ~_2403;
    int _2425 = _2423 + 1;
    int _2427 = _2425 + 1;
    float _2429 = fma(_2327, _2401, _2327);
    int _2431 = _2427;
    if (!_2373)
    {
        int _2433 = ~_2403;
        int _2435 = _2433 + 1;
        _2431 = _2435;
    }
    int _2437 = _2431;
    float _2439 = fma(_2421, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2419);
    float _2441 = _2399 * _2371;
    float _2443 = _2441 * 0.5;
    bool _2445 = !_2273;
    int _2447 = _2445 ? 0 : 1;
    float _2449 = _2193 + _2191;
    float _2451 = fma(_2429, _2359, _2439);
    float _2453 = float(_2397);
    float _2455 = _2449 + (-1.0);
    float _2457 = float(_2437);
    float _2459 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2461 = fma(_2443, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2459);
    int _2463 = abs(_2447);
    float _2465 = _2195 + _2191;
    float _2467 = _2453 * _2457;
    float _2469 = float(_2463);
    float _2471 = _2465 + (-1.0);
    float _2473 = float(_2417);
    float _2475 = _2467 * (-2.0);
    float _2477 = 1.0 / _2461;
    float _2479 = fma(_2471, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2481 = _2469 * _2473;
    float _2483 = fma(_2475, _2351, _2351);
    float _2485 = fma(_2455, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2487 = _2191 + (-0.5);
    float _2489 = _2481 * (-2.0);
    float _2491 = _2195 + (-0.5);
    float _2493 = fma(_2485, _2475, _2485);
    float _2495 = fma(_2487, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2483);
    float _2497 = fma(_2489, _2355, _2355);
    float _2499 = fma(_2479, _2489, _2479);
    float _2501 = _2451 * 0.15915493667125701904296875;
    float _2503 = fma(_2493, _2359, _2495);
    float _2505 = fma(_2491, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2497);
    float _2507 = _2501 * 6.283185482025146484375;
    float _2509 = sin(_2507);
    float _2511 = _2503 * 0.15915493667125701904296875;
    float _2513 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2515 = _2477 * _2513;
    float _2517 = fma(_2499, _2359, _2505);
    float _2519 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2521 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2105);
    float _2523 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2053);
    float _2525 = _2517 * 0.15915493667125701904296875;
    bool _2527 = _2515 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2529 = _2511 * 6.283185482025146484375;
    float _2531 = cos(_2529);
    bool _2533 = _2515 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2535 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2519);
    bool _2537 = !_2527;
    int _2539 = _2537 ? 0 : 1;
    float _2541 = _2521 * _2207;
    float _2543 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2051);
    float _2545 = _2523 * _2211;
    int _2547 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2549 = _2283 + _2547;
    int _2551 = _2549 + 1;
    float _2553 = _2501 * 6.283185482025146484375;
    float _2555 = cos(_2553);
    float _2557 = _2543 * _2203;
    int _2559 = _2551;
    if (!_2527)
    {
        _2319 = 1;
    }
    int _2561 = _2319;
    int _2563 = _2561;
    if (!_2533)
    {
        _2563 = _2539;
    }
    int _2565 = _2563;
    float _2567 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2535);
    float _2569 = _2511 * 6.283185482025146484375;
    float _2571 = sin(_2569);
    float _2573 = _2531 * _2509;
    int _2575 = _2565 << 6;
    float _2577 = _2567 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2579 = _2551 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2581 = _2575 + 64;
    uint _2583 = uint(int(uint(_2581) >> uint(2)));
    uint _2585 = uint(int(uint(int(_2583)) >> uint(2)));
    int _2587 = int(_2583) & 3;
    float _2589 = (*spvDescriptorSet0.vp_c15)._m0[int(_2585)][_2587];
    int _2591 = int(_2583) + 1;
    uint _2593 = uint(int(uint(_2591) >> uint(2)));
    int _2595 = _2591 & 3;
    float _2597 = (*spvDescriptorSet0.vp_c15)._m0[int(_2593)][_2595];
    bool _2599 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2601 = isnan(0.5);
    bool _2603 = _2599 || _2601;
    bool _2605 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2607 = _2603 || _2605;
    float _2609 = _2525 * 6.283185482025146484375;
    float _2611 = cos(_2609);
    float _2613 = _2531 * _2555;
    float _2615 = _2525 * 6.283185482025146484375;
    float _2617 = sin(_2615);
    float _2619 = _2571 * _2555;
    float _2621 = _2571 * _2509;
    float _2623 = _2531 * _2611;
    float _2625 = _2555 * _2611;
    float _2627 = _2571 * _2611;
    float _2629 = _2509 * _2611;
    float _2631 = _2623 * _2541;
    int _2633 = _2575 + 96;
    uint _2635 = uint(int(uint(_2633) >> uint(2)));
    uint _2637 = uint(int(uint(int(_2635)) >> uint(2)));
    int _2639 = int(_2635) & 3;
    float _2641 = (*spvDescriptorSet0.vp_c15)._m0[int(_2637)][_2639];
    int _2643 = int(_2635) + 1;
    uint _2645 = uint(int(uint(_2643) >> uint(2)));
    int _2647 = _2643 & 3;
    float _2649 = (*spvDescriptorSet0.vp_c15)._m0[int(_2645)][_2647];
    float _2651 = trunc(_2577);
    int _2653 = int(_2651);
    float _2655 = -_2573;
    float _2657 = fma(_2617, _2619, _2655);
    float _2659 = fma(_2617, _2613, _2621);
    float _2661 = -_2619;
    float _2663 = fma(_2617, _2573, _2661);
    float _2665 = -_2541;
    float _2667 = _2617 * _2665;
    float _2669 = _2627 * _2541;
    int _2671 = _2575 + 104;
    uint _2673 = uint(int(uint(_2671) >> uint(2)));
    uint _2675 = uint(int(uint(int(_2673)) >> uint(2)));
    int _2677 = int(_2673) & 3;
    float _2679 = (*spvDescriptorSet0.vp_c15)._m0[int(_2675)][_2677];
    int _2681 = int(_2673) + 1;
    uint _2683 = uint(int(uint(_2681) >> uint(2)));
    int _2685 = _2681 & 3;
    float _2687 = (*spvDescriptorSet0.vp_c15)._m0[int(_2683)][_2685];
    float _2689 = fma(_2659, _2545, _2631);
    float _2691 = fma(_2617, _2621, _2613);
    float _2693 = fma(_2625, _2545, _2667);
    float _2695 = fma(_2657, _2545, _2669);
    float _2697 = fma(_2663, _2557, _2689);
    float _2699 = fma(_2629, _2557, _2693);
    int _2701 = _2575 + 48;
    uint _2703 = uint(int(uint(_2701) >> uint(2)));
    uint _2705 = uint(int(uint(int(_2703)) >> uint(2)));
    int _2707 = int(_2703) & 3;
    float _2709 = (*spvDescriptorSet0.vp_c15)._m0[int(_2705)][_2707];
    int _2711 = int(_2703) + 1;
    uint _2713 = uint(int(uint(_2711) >> uint(2)));
    int _2715 = _2711 & 3;
    float _2717 = (*spvDescriptorSet0.vp_c15)._m0[int(_2713)][_2715];
    float _2719 = _2697 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2721 = fma(_2691, _2557, _2695);
    float _2723 = _2697 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _2725 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2727 = _2653 + _2725;
    int _2729 = _2727 + 1;
    float _2731 = fma(_2699, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2719);
    float _2733 = fma(_2699, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2723);
    int _2735 = _2575 + 56;
    uint _2737 = uint(int(uint(_2735) >> uint(2)));
    uint _2739 = uint(int(uint(int(_2737)) >> uint(2)));
    int _2741 = int(_2737) & 3;
    float _2743 = (*spvDescriptorSet0.vp_c15)._m0[int(_2739)][_2741];
    int _2745 = int(_2737) + 1;
    uint _2747 = uint(int(uint(_2745) >> uint(2)));
    int _2749 = _2745 & 3;
    float _2751 = (*spvDescriptorSet0.vp_c15)._m0[int(_2747)][_2749];
    float _2753 = fma(_2721, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2731);
    int _2755 = _2551 | _2729;
    float _2757 = fma(_2721, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2733);
    float _2759 = _2221 * _2597;
    float _2761 = _2173 + _2753;
    bool _2763 = _2755 < 0;
    bool _2765 = _2763 || _2579;
    float _2767 = _2167 + _2757;
    int _2769 = _2575 + 72;
    uint _2771 = uint(int(uint(_2769) >> uint(2)));
    uint _2773 = uint(int(uint(int(_2771)) >> uint(2)));
    int _2775 = int(_2771) & 3;
    float _2777 = (*spvDescriptorSet0.vp_c15)._m0[int(_2773)][_2775];
    int _2779 = int(_2771) + 1;
    uint _2781 = uint(int(uint(_2779) >> uint(2)));
    int _2783 = _2779 & 3;
    float _2785 = (*spvDescriptorSet0.vp_c15)._m0[int(_2781)][_2783];
    float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2789 = _2761 + _2787;
    bool _2791 = _2729 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2793 = _2791 || _2765;
    float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2797 = _2767 + _2795;
    float _2799 = fma(_2167, _2589, _2759);
    float _2801 = _2789 * _2789;
    int _2803 = _2575 + 80;
    uint _2805 = uint(int(uint(_2803) >> uint(2)));
    uint _2807 = uint(int(uint(int(_2805)) >> uint(2)));
    int _2809 = int(_2805) & 3;
    float _2811 = (*spvDescriptorSet0.vp_c15)._m0[int(_2807)][_2809];
    int _2813 = int(_2805) + 1;
    uint _2815 = uint(int(uint(_2813) >> uint(2)));
    int _2817 = _2813 & 3;
    float _2819 = (*spvDescriptorSet0.vp_c15)._m0[int(_2815)][_2817];
    float _2821 = fma(_2797, _2797, _2801);
    float _2823 = sqrt(_2821);
    float _2825 = _2767;
    float _2827 = _2761;
    if (!_2793)
    {
        int _2829 = _2729 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2831 = _2829 + _2551;
        _2559 = _2831;
    }
    int _2833 = _2559;
    float _2835 = _2221 * _2649;
    float _2837 = fma(_2167, _2641, _2835);
    float _2839 = _2697 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2841 = _2697;
    int _2843 = as_type<int>(_2839);
    if (!_2793)
    {
        float _2845 = floor(_2247);
        _2841 = _2845;
    }
    float _2847 = _2841;
    float _2849 = fma(_2173, _2679, _2837);
    float _2851 = fma(_2699, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2839);
    int _2853 = as_type<int>(_2679);
    if (!_2793)
    {
        int _2855 = _2833 << 2;
        _2843 = _2855;
    }
    int _2857 = _2843;
    float _2859 = _2849 + _2687;
    bool _2861 = _2823 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2863 = fma(_2721, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2851);
    int _2865 = _2857;
    float _2867 = _2823;
    if (!_2793)
    {
        uint _2869 = uint(int(uint(_2833) >> uint(2)));
        _2853 = int(_2869);
    }
    int _2871 = _2853;
    float _2873 = _2221 * _2717;
    float _2875 = as_type<float>(_2871);
    if (!_2793)
    {
        int _2877 = 12 & _2857;
        _2865 = _2877;
    }
    int _2879 = _2865;
    float _2881 = 1.0 / _2859;
    float _2883 = _2213 + _2863;
    float _2885 = fma(_2167, _2709, _2873);
    float _2887 = as_type<float>(_2879);
    float _2889 = _2883;
    if (!_2793)
    {
        int _2891 = _2871 << 4;
        int _2893 = _2891 + _2879;
        _2875 = as_type<float>(_2893);
    }
    float _2895 = _2875;
    float _2897 = fma(_2173, _2743, _2885);
    if (!_2861)
    {
        _2887 = _2883;
    }
    float _2899 = _2887;
    float _2901 = _2897 + _2751;
    float _2903 = fma(_2173, _2777, _2799);
    float _2905 = _2903 + _2785;
    bool _2907 = !_2861;
    float _2909 = _2899;
    float _2911 = _2819;
    if (!_2907)
    {
        float _2913 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2917 = _2823 + _2915;
        float _2919 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2921 = rsqrt(_2821);
        float _2923 = _2917 * _2913;
        float _2925 = _2923 * 0.15915493667125701904296875;
        float _2927 = _2925 * 6.283185482025146484375;
        float _2929 = cos(_2927);
        float _2931 = _2925 * 6.283185482025146484375;
        float _2933 = sin(_2931);
        float _2935 = _2929 + (-1.0);
        float _2937 = fma(_2933, _2919, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2939 = _2935 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2941 = _2921 * _2937;
        float _2943 = fma(_2883, _2929, _2939);
        float _2945 = fma(_2797, _2941, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2947 = fma(_2789, _2941, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2825 = _2945;
        _2827 = _2947;
        _2909 = _2943;
        _2867 = _2933;
    }
    float _2949 = _2825;
    float _2951 = _2827;
    float _2953 = _2909;
    float _2955 = _2867;
    float _2957 = _2955;
    float _2959 = _2953;
    if (_2607)
    {
        _2889 = _2949;
    }
    float _2961 = _2889;
    float _2963 = _2961;
    if (_2607)
    {
        _2957 = _2951;
    }
    float _2965 = _2957;
    float _2967 = _2965;
    if (!_2607)
    {
        float _2969 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2971 = _2213 + _2969;
        float _2973 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2975 = _2167 + _2973;
        float _2977 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2979 = -_2173;
        float _2981 = _2979 + _2951;
        float _2983 = _2971 * _2971;
        float _2985 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2987 = _2173 + _2985;
        float _2989 = fma(_2975, _2975, _2983);
        float _2991 = fma(_2987, _2987, _2989);
        float _2993 = -_2213;
        float _2995 = _2993 + _2953;
        float _2997 = sqrt(_2991);
        float _2999 = precise::min(_2997, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3001 = _2999 * _2977;
        float _3003 = -_2167;
        float _3005 = _3003 + _2949;
        float _3007 = fma(_2995, _3001, _2213);
        float _3009 = fma(_3005, _3001, _2167);
        float _3011 = fma(_2981, _3001, _2173);
        _2959 = _3007;
        _2963 = _3009;
        _2967 = _3011;
    }
    float _3013 = _2959;
    float _3015 = _2963;
    float _3017 = _2967;
    float _3019 = _2895;
    if (!_2793)
    {
        int _3021 = as_type<int>(_2895) + 400;
        uint _3023 = uint(int(uint(_3021) >> uint(2)));
        uint _3025 = uint(int(uint(int(_3023)) >> uint(2)));
        int _3027 = int(_3023) & 3;
        float _3029 = (*spvDescriptorSet0.vp_c15)._m0[int(_3025)][_3027];
        _3019 = _3029;
    }
    float _3031 = _3019;
    float _3033 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3035 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3037 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3039 = _2901 * _2881;
    float _3041 = fma(_3015, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3033);
    float _3043 = fma(_3015, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3035);
    float _3045 = fma(_3015, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3037);
    int _3047 = _2575 + 88;
    uint _3049 = uint(int(uint(_3047) >> uint(2)));
    uint _3051 = uint(int(uint(int(_3049)) >> uint(2)));
    int _3053 = int(_3049) & 3;
    float _3055 = (*spvDescriptorSet0.vp_c15)._m0[int(_3051)][_3053];
    int _3057 = int(_3049) + 1;
    uint _3059 = uint(int(uint(_3057) >> uint(2)));
    int _3061 = _3057 & 3;
    float _3063 = (*spvDescriptorSet0.vp_c15)._m0[int(_3059)][_3061];
    float _3065 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3041);
    bool _3067 = _3039 >= 0.0;
    float _3069 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3043);
    float _3071 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3045);
    float _3073 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3075 = _3065 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3077 = _2905 * _2881;
    bool _3079 = _3039 <= 1.0;
    bool _3081 = _3079 && _3067;
    float _3083 = _3069 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3085 = _3071 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3087 = fma(_3015, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3073);
    float _3089 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3091 = _3077 >= 0.0;
    bool _3093 = _3091 && _3081;
    float _3095 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3097 = _3083 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3099 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3087);
    float _3101 = fma(_3085, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3089);
    bool _3103 = _3077 <= 1.0;
    bool _3105 = _3103 && _3093;
    float _3107 = -_3097;
    float _3109 = fma(_3107, _3095, 1.0);
    float _3111 = _3099 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3113 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3101);
    float _3115 = _2949;
    if (!_2793)
    {
        float _3117 = floor(_2577);
        _3115 = _3117;
    }
    float _3119 = _3115;
    float _3121 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3123 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3125 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3113);
    float _3127 = _2221 * _2819;
    float _3129 = fma(_3085, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3121);
    float _3131 = fma(_3085, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3123);
    float _3133 = log2(_3109);
    if (_3105)
    {
        float _3135 = float(_2565);
        _2911 = _3135;
    }
    float _3137 = _2911;
    float _3139 = fma(_2167, _2811, _3127);
    float _3141 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3129);
    float _3143 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3141);
    float _3145 = 1.0 / _3125;
    float _3147 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3131);
    float _3149 = _3119;
    float _3151 = _3139;
    if (!_2793)
    {
        float _3153 = -_3119;
        float _3155 = _2577 + _3153;
        _3149 = _3155;
    }
    float _3157 = _3149;
    float _3159 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3147);
    float _3161 = _3127;
    if (_3105)
    {
        float _3163 = rint(_3137);
        float _3165 = precise::max(_3163, 0.0);
        uint _3167 = uint(_3165);
        uint _3169 = clamp(_3167, 0u, 65535u);
        _3161 = as_type<float>(_3169);
    }
    float _3171 = _3161;
    float _3173 = _3133 * 0.693147182464599609375;
    float _3175 = fma(_2173, _3055, _3139);
    float _3177 = _3173 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3179 = _3175 + _3063;
    float _3181 = _3173;
    if (!_2793)
    {
        float _3183 = -_2847;
        float _3185 = _2247 + _3183;
        _3181 = _3185;
    }
    float _3187 = _3181;
    float _3189 = _3031;
    if (!_2793)
    {
        float _3191 = rint(_3031);
        float _3193 = precise::max(_3191, 0.0);
        uint _3195 = uint(_3193);
        uint _3197 = clamp(_3195, 0u, 65535u);
        _3189 = as_type<float>(_3197);
    }
    float _3199 = _3189;
    float _3201 = _3143 * _3145;
    float _3203 = _3159 * _3145;
    float _3205 = _3179 * _2881;
    float _3207 = fma(_3201, 0.5, 0.5);
    float _3209 = fma(_3203, -0.5, 0.5);
    float _3211 = _3077;
    float _3213 = _3203;
    if (_3105)
    {
        float3 _9043 = float3(_3039, _3077, float(as_type<int>(_3171)));
        float3 _9047 = select(_9043, float3(0.0), isnan(_9043));
        float _3215 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9047.xy, uint(rint(_9047.z)), _3205, level(0.0));
        _3211 = _3215;
    }
    float _3217 = _3211;
    float3 _9057 = float3(_3207, _3209, _3177);
    float _3219 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9057, float3(0.0), isnan(_9057)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9057, float3(0.0), isnan(_9057)), level(0.0)).x;
    float3 _9066 = float3(_3207, _3209, _3177);
    float4 _3221 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9066, float3(0.0), isnan(_9066)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9066, float3(0.0), isnan(_9066)), level(0.0)).xyzw;
    float _3223 = _3221.x;
    float _3225 = _3221.y;
    float _3227 = _3221.z;
    float _3229 = _3221.w;
    float _3231 = _2847;
    if (!_2793)
    {
        float3 _9089 = float3(_3187, _3157, float(as_type<int>(_3199)));
        float3 _9091 = select(_9089, float3(0.0), isnan(_9089));
        float _3233 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9091.xy, uint(rint(_9091.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9091.xy, uint(rint(_9091.z)), level(0.0)).x;
        _3231 = _3233;
    }
    float _3235 = _3231;
    if (_2793)
    {
        _3213 = 1.0;
    }
    float _3237 = _3213;
    float _3239 = _3237;
    if (!_2793)
    {
        int _3241 = _2833 << 4;
        int _3243 = _3241 + 2048;
        uint _3245 = uint(int(uint(_3243) >> uint(2)));
        uint _3247 = uint(int(uint(int(_3245)) >> uint(2)));
        int _3249 = int(_3245) & 3;
        float _3251 = (*spvDescriptorSet0.vp_c15)._m0[int(_3247)][_3249];
        int _3253 = int(_3245) + 1;
        uint _3255 = uint(int(uint(_3253) >> uint(2)));
        int _3257 = _3253 & 3;
        float _3259 = (*spvDescriptorSet0.vp_c15)._m0[int(_3255)][_3257];
        int _3261 = _3243 + 8;
        uint _3263 = uint(int(uint(_3261) >> uint(2)));
        uint _3265 = uint(int(uint(int(_3263)) >> uint(2)));
        int _3267 = int(_3263) & 3;
        float _3269 = (*spvDescriptorSet0.vp_c15)._m0[int(_3265)][_3267];
        int _3271 = int(_3263) + 1;
        uint _3273 = uint(int(uint(_3271) >> uint(2)));
        int _3275 = _3271 & 3;
        float _3277 = (*spvDescriptorSet0.vp_c15)._m0[int(_3273)][_3275];
        float _3279 = _2221 * _3259;
        float _3281 = fma(_2167, _3251, _3279);
        float _3283 = fma(_2173, _3269, _3281);
        float _3285 = _3283 + _3277;
        float _3287 = precise::clamp(_3285, 0.0, 1.0);
        float _3289 = -_3287;
        float _3291 = _3289 + _3235;
        float _3293 = fma(_3291, 500.0, 1.5);
        float _3295 = exp2(_3293);
        float _3297 = 0.0 + _3295;
        float _3299 = precise::clamp(_3297, 0.0, 1.0);
        _3239 = _3299;
    }
    float _3301 = _3239;
    float _3303 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3305 = _3013 + _3303;
    float _3307 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3309 = _3015 + _3307;
    float _3311 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3313 = _3017 + _3311;
    float _3315 = _3305 * _3305;
    float _3317 = fma(_3309, _3309, _3315);
    float _3319 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3321 = fma(_3313, _3313, _3317);
    float _3323 = rsqrt(_3321);
    float _3325 = sqrt(_3321);
    float _3327 = _3309 * _3323;
    float _3329 = _3313 * _3323;
    float _3331 = _3305 * _3323;
    float _3333 = precise::max(0.0, _3319);
    float _3335 = _3327 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3337 = _3329 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3339 = _3335 * _3335;
    float _3341 = _3337 * _3337;
    float _3343 = -_3331;
    float _3345 = -_3333;
    float _3347 = fma(_3343, (*spvDescriptorSet0.vp_c15)._m0[24].y, _3345);
    float _3349 = _3339 + _3341;
    float _3351 = sqrt(_3349);
    bool _3353 = _3351 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3355 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3357 = _3351 + _3355;
    float _3359 = _3235;
    float _3361 = _3349;
    float _3363 = _3357;
    float _3365 = _3319;
    float _3367 = _3335;
    float _3369 = _3337;
    float _3371 = _3339;
    float _3373 = _3341;
    float _3375 = _3347;
    if (_3353)
    {
        float _3377 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3359 = _3377;
    }
    float _3379 = _3359;
    if (_3353)
    {
        float _3381 = _3347 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3151 = _3381;
    }
    float _3383 = _3151;
    float _3385 = _3383;
    if (_3353)
    {
        float _3387 = rsqrt(_3349);
        _3361 = _3387;
    }
    float _3389 = _3361;
    if (_3353)
    {
        float _3391 = _3357 * _3379;
        _3363 = _3391;
    }
    float _3393 = _3363;
    float _3395 = 0.0;
    if (_3353)
    {
        float _3397 = _3393 * 0.15915493667125701904296875;
        _3395 = _3397;
    }
    float _3399 = _3395;
    float _3401 = _3379;
    if (_3353)
    {
        float _3403 = _3399 * 6.283185482025146484375;
        float _3405 = sin(_3403);
        _3401 = _3405;
    }
    float _3407 = _3401;
    float _3409 = _3393;
    if (_3353)
    {
        float _3411 = _3399 * 6.283185482025146484375;
        float _3413 = cos(_3411);
        _3409 = _3413;
    }
    float _3415 = _3409;
    float _3417 = _3407;
    if (_3353)
    {
        float _3419 = fma(_3407, _3383, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3417 = _3419;
    }
    float _3421 = _3417;
    float _3423 = _3421;
    if (_3353)
    {
        float _3425 = _3389 * _3421;
        _3423 = _3425;
    }
    float _3427 = _3423;
    if (_3353)
    {
        float _3429 = _3415 + (-1.0);
        _3365 = _3429;
    }
    float _3431 = _3365;
    if (_3353)
    {
        float _3433 = _3335 * _3427;
        _3367 = _3433;
    }
    float _3435 = _3367;
    if (_3353)
    {
        float _3437 = _3337 * _3427;
        _3369 = _3437;
    }
    float _3439 = _3369;
    if (_3353)
    {
        float _3441 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3385 = _3441;
    }
    float _3443 = _3385;
    if (_3353)
    {
        float _3445 = _3435 * _3435;
        _3371 = _3445;
    }
    float _3447 = _3371;
    if (_3353)
    {
        float _3449 = _3439 * _3439;
        _3373 = _3449;
    }
    float _3451 = _3373;
    if (_3353)
    {
        float _3453 = fma(_3347, _3415, _3443);
        _3375 = _3453;
    }
    float _3455 = _3375;
    float _3457 = fma(_3455, _3455, _3447);
    float _3459 = _3457 + _3451;
    float _3461 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3463 = fma(_3325, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3461);
    float _3465 = precise::clamp(_3463, 0.0, 1.0);
    float _3467 = -_3465;
    float _3469 = _3467 + 1.0;
    float _3471 = rsqrt(_3459);
    float _3473 = _3471 * _3435;
    float _3475 = _3471 * _3455;
    float _3477 = _3471 * _3439;
    float _3479 = _3473 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3481 = abs(_3469);
    float _3483 = log2(_3481);
    float _3485 = -_3479;
    float _3487 = fma(_3475, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3485);
    float _3489 = -_3477;
    float _3491 = fma(_3489, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3487);
    float _3493 = _3475 + 1.0;
    float _3495 = fma(_3491, -0.5, 0.5);
    float _3497 = fma(_3491, 0.5, 0.5);
    float _3499 = fma(_3497, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3501 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3503 = sqrt(_3495);
    float _3505 = fma(_3497, _3499, -0.212114393711090087890625);
    float _3507 = fma(_3497, _3505, 1.570728778839111328125);
    float _3509 = exp2(_3501);
    float _3511 = _3503 * 0.636619746685028076171875;
    float _3513 = -_3475;
    float _3515 = fma(_3509, _3493, _3513);
    float _3517 = -_3507;
    float _3519 = fma(_3511, _3517, 1.0);
    float _3521 = fma(_3515, 0.5, 0.5);
    float2 _9533 = float2(_3519, _3521);
    float3 _3525 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9533, float2(0.0), isnan(_9533)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9533, float2(0.0), isnan(_9533)), level(0.0)).xyz;
    float _3527 = _3525.x;
    float _3529 = _3525.y;
    float _3531 = _3525.z;
    float _3533 = _2103 * _2155;
    float _3535 = _2083 * 2.0;
    float _3537 = _2071 * 3.883221149444580078125;
    bool _3539 = _2105 != 0.0;
    bool _3541 = isnan(_2105);
    bool _3543 = _3539 || _3541;
    bool _3545 = isnan(0.0);
    bool _3547 = _3543 || _3545;
    float _3549 = -_1891;
    float _3551 = _3549 + _2073;
    float _3553 = -_3535;
    float _3555 = fma(_3533, _3553, _3533);
    float _3557 = _3537 * 0.15915493667125701904296875;
    bool _3559 = _2053 == 0.0;
    bool _3561 = !_3547;
    bool _3563 = _3559 && _3561;
    float _3565 = abs(_2515);
    float _3567 = log2(_3565);
    float _3569 = fma(_2083, 3.1415927410125732421875, _3555);
    float _3571 = fma(_2019, _3551, _1891);
    bool _3573 = _2051 == 0.0;
    bool _3575 = _3573 && _3563;
    float _3577 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3579 = _3569 * 0.15915493667125701904296875;
    float _3581 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3583 = -_2189;
    float _3585 = _3583 + 1.0;
    float _3587 = _3557 * 6.283185482025146484375;
    float _3589 = cos(_3587);
    bool _3591 = _2515 <= 8000.0;
    bool _3593 = isnan(_2515);
    bool _3595 = _3591 || _3593;
    bool _3597 = isnan(8000.0);
    bool _3599 = _3595 || _3597;
    float _3601 = float(_3599);
    float _3603 = fma(_3085, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3581);
    out.m_79.x = _1846;
    out.m_79.y = _1856;
    float _3605 = _3579 * 6.283185482025146484375;
    float _3607 = sin(_3605);
    float _3609 = _3567 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3611 = _3571;
    if (!_3575)
    {
        float _3613 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3571);
        _3611 = _3613;
    }
    float _3615 = _3611;
    out.m_81.x = _3015;
    out.m_81.y = _3013;
    out.m_81.z = _3017;
    float _3617 = -_3615;
    float _3619 = _2617 * _3617;
    float _3621 = _2623 * _3615;
    float _3623 = _3557 * 6.283185482025146484375;
    float _3625 = sin(_3623);
    float _3627 = _2627 * _3615;
    float _3629 = exp2(_3609);
    float _3631 = -_2025;
    float _3633 = fma(_3607, _3589, _3631);
    float _3635 = fma(_2019, _3633, _2025);
    float _3637 = -_2027;
    float _3639 = fma(_3607, _3625, _3637);
    float _3641 = _3635;
    if (!_3575)
    {
        float _3643 = fma(_2053, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3635);
        _3641 = _3643;
    }
    float _3645 = _3641;
    float _3647 = exp2(_3577);
    float _3649 = fma(_2019, _3639, _2027);
    float _3651 = fma(_2659, _3645, _3621);
    float _3653 = fma(_2625, _3645, _3619);
    float _3655 = fma(_2657, _3645, _3627);
    float _3657 = fma(_3629, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3659 = precise::clamp(_3657, 0.0, 1.0);
    float _3661 = _3649;
    if (!_3575)
    {
        float _3663 = fma(_2051, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3649);
        _3661 = _3663;
    }
    float _3665 = _3661;
    float _3667 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3603);
    float _3669 = in.m_83.w;
    float _3671 = fma(_3659, -2.0, 3.0);
    float _3673 = _3659 * _3659;
    float _3675 = fma(_2663, _3665, _3651);
    float _3677 = fma(_2629, _3665, _3653);
    float _3679 = fma(_2691, _3665, _3655);
    float _3681 = _3673 * _3671;
    float _3683 = _3675 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _3685 = _3675 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _3687 = -_3647;
    float _3689 = _3687 + 1.0;
    float _3691 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3667);
    float _3693 = fma(_3677, (*spvDescriptorSet0.vp_c10)._m0[8].x, _3683);
    float _3695 = -_3681;
    float _3697 = _3695 + 1.0;
    float _3699 = fma(_3677, (*spvDescriptorSet0.vp_c10)._m0[9].x, _3685);
    float _3701 = _3689 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3703 = fma(_3679, (*spvDescriptorSet0.vp_c10)._m0[8].z, _3693);
    float _3705 = fma(_3697, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3681);
    float _3707 = _3693;
    if (!_3105)
    {
        _3707 = 1.0;
    }
    float _3709 = _3707;
    float _3711 = _3691 + _3125;
    float _3713 = _3709;
    if (_3105)
    {
        bool _3715 = _3217 >= _3205;
        bool _3717 = isnan(_3217);
        bool _3719 = _3715 || _3717;
        bool _3721 = isnan(_3205);
        bool _3723 = _3719 || _3721;
        float _3725 = float(_3723);
        _3713 = _3725;
    }
    float _3727 = _3713;
    float _3729 = _3601 * _3705;
    float _3731 = _3701 * _3219;
    float _3733 = _3675 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.gl_Position.x = _3143;
    out.gl_Position.y = _3159;
    out.gl_Position.z = _3691;
    out.gl_Position.w = _3125;
    float _3735 = _3729 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3737 = _3727 * _3301;
    float _3739 = _3711 * 0.5;
    float _3741 = fma(_3677, (*spvDescriptorSet0.vp_c10)._m0[10].x, _3733);
    float _3743 = _3585 * _3735;
    float _3745 = precise::clamp(_3743, 0.0, 1.0);
    float _3747 = -_3701;
    float _3749 = _3747 + 1.0;
    out.m_85.w = _3669;
    float _3751 = -_3745;
    float _3753 = fma(_3751, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3755 = fma(_3679, (*spvDescriptorSet0.vp_c10)._m0[9].z, _3699);
    float _3757 = fma(_3679, (*spvDescriptorSet0.vp_c10)._m0[10].z, _3741);
    bool _3759 = _3325 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3761 = isnan(_3325);
    bool _3763 = _3759 || _3761;
    bool _3765 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3767 = _3763 || _3765;
    float _3769 = -_3737;
    float _3771 = fma(_3769, _3753, 1.0);
    float _3773 = precise::clamp(_3771, 0.0, 1.0);
    float _3775 = _3229 * _3731;
    float _3777 = _3229 * _3749;
    out.m_87.x = _3703;
    out.m_87.y = _3755;
    out.m_87.z = _3757;
    float _3779 = _3773 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.z = _3739;
    out.m_89.w = _3125;
    out.m_91.x = _3779;
    float _3781 = _3735;
    float _3783 = _3737;
    float _3785 = _3749;
    float _3787 = _3739;
    float _3789 = _3125;
    float _3791 = _3773;
    if (!_3767)
    {
        _3781 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3793 = _3781;
    float _3795 = _3793;
    float _3797 = _3793;
    if (!_3767)
    {
        _3783 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3799 = _3783;
    float _3801 = _3799;
    float _3803 = _3799;
    if (!_3767)
    {
        _3785 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3805 = _3785;
    float _3807 = _3805;
    float _3809 = _3805;
    if (!_3767)
    {
        _3787 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3811 = _3787;
    float _3813 = _3811;
    float _3815 = _3811;
    if (!_3767)
    {
        _3789 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3817 = _3789;
    float _3819 = _3817;
    float _3821 = _3817;
    if (!_3767)
    {
        _3791 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3823 = _3791;
    float _3825 = _3531 * _3731;
    float _3827 = fma(_3527, _3775, _3223);
    float _3829 = fma(_3529, _3775, _3225);
    float _3831 = fma(_3229, _3825, _3227);
    out.m_93.x = _3827;
    out.m_93.y = _3829;
    out.m_93.z = _3831;
    out.m_93.w = _3777;
    bool _3833 = !_3767;
    float _3835 = _3823;
    float _3837 = _3823;
    if (!_3833)
    {
        bool _3839 = _3325 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3841 = isnan(_3325);
        bool _3843 = _3839 || _3841;
        bool _3845 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3847 = _3843 || _3845;
        if (!_3847)
        {
            float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3851 = _3325 + _3849;
            float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3855 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3853;
            float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3861 = 1.0 / _3855;
            float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3865 = _3863 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3869 = _3867 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3873 = _3871 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3877 = _3875 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3879 = _3851 * _3861;
            float _3881 = precise::clamp(_3879, 0.0, 1.0);
            float _3883 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3885 = _3883 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3887 = fma(_3881, _3859, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3889 = fma(_3881, _3885, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3891 = fma(_3881, _3865, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3893 = fma(_3881, _3869, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3895 = fma(_3881, _3873, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3897 = fma(_3881, _3877, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3821 = _3887;
            _3809 = _3895;
            _3815 = _3891;
            _3803 = _3893;
            _3797 = _3889;
            _3837 = _3897;
            _3899 = true;
        }
        else
        {
            bool _3901 = _3325 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3903 = isnan(_3325);
            bool _3905 = _3901 || _3903;
            bool _3907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3909 = _3905 || _3907;
            if (!_3909)
            {
                _3813 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3911 = _3813;
            _3815 = _3911;
            if (!_3909)
            {
                _3819 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3913 = _3819;
            _3821 = _3913;
            if (!_3909)
            {
                _3795 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3915 = _3795;
            _3797 = _3915;
            if (!_3909)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3917 = _3801;
            _3803 = _3917;
            if (!_3909)
            {
                _3807 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3919 = _3807;
            _3809 = _3919;
            if (!_3909)
            {
                _3835 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3921 = _3835;
            bool _3923 = !_3909;
            _3837 = _3921;
            if (!_3923)
            {
                bool _3925 = _3325 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3927 = isnan(_3325);
                bool _3929 = _3925 || _3927;
                bool _3931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3933 = _3929 || _3931;
                if (!_3933)
                {
                    float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3937 = _3325 + _3935;
                    float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3941 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3939;
                    float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3947 = 1.0 / _3941;
                    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3951 = _3949 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3955 = _3953 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3959 = _3957 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3963 = _3961 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3965 = _3937 * _3947;
                    float _3967 = precise::clamp(_3965, 0.0, 1.0);
                    float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3971 = _3969 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3973 = fma(_3967, _3945, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3975 = fma(_3967, _3971, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3977 = fma(_3967, _3951, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3979 = fma(_3967, _3955, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3981 = fma(_3967, _3959, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3983 = fma(_3967, _3963, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3821 = _3973;
                    _3809 = _3981;
                    _3815 = _3977;
                    _3803 = _3979;
                    _3797 = _3975;
                    _3837 = _3983;
                    _3899 = true;
                }
                else
                {
                    _3821 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3809 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3815 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3797 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3837 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3899 = false;
    float _3985 = _3821;
    float _3987 = _3809;
    float _3989 = _3815;
    float _3991 = _3803;
    float _3993 = _3797;
    float _3995 = _3837;
    float _3997 = fma(_3755, -0.5, 0.5);
    float _3999 = precise::clamp(_3997, 0.0, 1.0);
    float _4001 = -_3985;
    float _4003 = _4001 + _3987;
    float _4005 = -_3989;
    float _4007 = _4005 + _3991;
    float _4009 = -_3993;
    float _4011 = _4009 + _3995;
    bool _4013 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4015 = fma(_3999, _4003, _3985);
    float _4017 = fma(_3999, _4007, _3989);
    float _4019 = fma(_3999, _4011, _3993);
    float _4021 = _4015 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _4023 = fma(_4017, 0.298911988735198974609375, _4021);
    float _4025 = fma(_4019, 0.114477999508380889892578125, _4023);
    out.m_95.x = 0.0;
    float _4027 = -_4025;
    float _4029 = _4017 + _4027;
    float _4031 = -_4025;
    float _4033 = _4015 + _4031;
    float _4035 = -_4025;
    float _4037 = _4019 + _4035;
    float _4039 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4041 = fma(_4029, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4025);
    float _4043 = fma(_4033, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4025);
    float _4045 = fma(_4037, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4025);
    out.m_97.x = 0.0;
    out.m_91.w = _4039;
    out.m_99.x = _4041;
    out.m_99.y = _4043;
    out.m_99.z = _4045;
    if (!_4013)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4047 = -_3013;
    float _4049 = _4047 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4051 = -_3015;
    float _4053 = _4051 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4055 = -_3017;
    float _4057 = _4055 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4059 = _4049 * _4049;
    float _4061 = fma(_4053, _4053, _4059);
    float _4063 = fma(_4057, _4057, _4061);
    float _4065 = rsqrt(_4063);
    float _4067 = sqrt(_4063);
    float _4069 = _4049 * _4065;
    float _4071 = _4053 * _4065;
    float _4073 = _4057 * _4065;
    float _4075 = -_3331;
    float _4077 = _4075 + _4069;
    float _4079 = -_3327;
    float _4081 = _4079 + _4071;
    float _4083 = -_3329;
    float _4085 = _4083 + _4073;
    float _4087 = _4077 * _4077;
    float _4089 = -_4067;
    float _4091 = _4089 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4093 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _4095 = precise::clamp(_4093, 0.0, 1.0);
    float _4097 = fma(_4081, _4081, _4087);
    float _4099 = _4091 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4101 = precise::clamp(_4099, 0.0, 1.0);
    float _4103 = _4095 * _4095;
    float _4105 = fma(_4085, _4085, _4097);
    float _4107 = _4103 + (-1.0);
    float _4109 = abs(_4101);
    float _4111 = log2(_4109);
    float _4113 = rsqrt(_4105);
    float _4115 = _4111 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4117 = exp2(_4115);
    float _4119 = _4077 * _4113;
    float _4121 = _4081 * _4113;
    float _4123 = _4085 * _4113;
    float _4125 = _4071 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4127 = _3755 * _4119;
    float _4129 = _3755 * _4069;
    float _4131 = fma(_3703, _4121, _4127);
    float _4133 = fma(_3703, _4071, _4129);
    float _4135 = fma(_3757, _4123, _4131);
    float _4137 = precise::clamp(_4135, 0.0, 1.0);
    float _4139 = fma(_3757, _4073, _4133);
    float _4141 = precise::clamp(_4139, 0.0, 1.0);
    float _4143 = _4137 * _4137;
    float _4145 = fma(_4143, _4107, 1.0);
    float _4147 = -_4069;
    float _4149 = -_4125;
    float _4151 = fma(_4147, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4149);
    float _4153 = _4145 * _4145;
    float _4155 = -_4073;
    float _4157 = fma(_4155, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4151);
    float _4159 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4161 = _4157 + _4159;
    float _4163 = 1.0 / _4153;
    float _4165 = _4161 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4167 = precise::clamp(_4165, 0.0, 1.0);
    float _4169 = _4117 * _4167;
    float _4171 = _4141 * _4169;
    float _4173 = _4171 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4175 = _4103 * _4163;
    float _4177 = _4171 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4179 = _4171 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _4181 = _4171 * _4175;
    out.m_95.x = _4173;
    out.m_95.y = _4177;
    out.m_95.z = _4179;
    float _4183 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4185 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4187 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _4183;
    out.m_97.y = _4185;
    out.m_97.z = _4187;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3899 = false;
    bool _2131 = false;
    bool _1943 = false;
    bool _1395 = false;
    bool _1215 = false;
    bool _997 = false;
    bool _709 = false;
    bool _325 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_58.w;
    float _121 = trunc(_119);
    int _123 = int(_121);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    float _133 = _131;
    if (!_127)
    {
        out.m_61.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4244 = as_type<float>(_139);
        out.gl_Position.z = _4244;
    }
    if (!_127)
    {
        return out;
    }
    float _143 = in.m_63.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_123);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_61.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4314 = as_type<float>(_177);
        out.gl_Position.z = _4314;
    }
    if (_169)
    {
        return out;
    }
    float _179 = in.m_65.y;
    float _181 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _183 = in.m_67.w;
    bool _185 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _187 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _189 = _185 || _187;
    bool _191 = isnan(1.0);
    bool _193 = _189 || _191;
    float _195 = in.m_63.x;
    float _197 = in.m_63.y;
    float _199 = in.m_63.z;
    float _201 = in.m_58.x;
    float _203 = in.m_58.y;
    float _205 = in.m_58.z;
    float _207 = 0.0;
    float _209 = _181;
    if (!_193)
    {
        float _211 = _181 * _181;
        float _213 = _211 * 0.5;
        _207 = _213;
    }
    float _215 = _207;
    float _217 = _215;
    if (!_193)
    {
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _219;
    }
    float _221 = _217;
    out.m_69.y = _179;
    bool _223 = !_193;
    float _225 = _221;
    float _227 = _179;
    if (!_223)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _181 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _181);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _257;
    }
    float _259 = _225;
    bool _261 = !_193;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _181 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _209 = _281;
    }
    float _283 = _209;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _287 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _291 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _293 = fma(_283, _195, _287);
    float _295 = fma(_283, _197, _289);
    float _297 = fma(_283, _199, _291);
    float _299 = fma(_293, _183, _201);
    float _301 = fma(_295, _183, _203);
    float _303 = fma(_297, _183, _205);
    bool _305 = !_285;
    float _323;
    if (!_305)
    {
        float _307 = in.m_71.x;
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _311 = _307 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        float _327 = float(_123);
        float _329 = 1.0 / _327;
        float _331 = _157 * _329;
        _323 = _331;
    }
    _325 = false;
    float _333 = _323;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _351 = 1.0 / _337;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _361 = 1.0 / _345;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _365 = _333 + _363;
    bool _367 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _369 = isnan(_333);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = 1.0 / _341;
    float _381 = _365 * _351;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _385 = _333 + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _389 = _333 + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _393 = _333 + _391;
    bool _395 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _397 = 1.0 / _349;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _401 = _333 + _399;
    float _403 = _385 * _361;
    bool _405 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _407 = isnan(_333);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = 1.0 / _355;
    float _419 = _401 * _379;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _423 = _333 + _421;
    float _425 = -_415;
    float _427 = _425 + 1.0;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _433;
    float _437 = 1.0 / _359;
    float _439 = _389 * _397;
    bool _441 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _443 = isnan(_333);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = fma(_435, _381, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _455 = _423 * _417;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = _451 * _427;
    float _463 = -_451;
    float _465 = _463 + 1.0;
    float _467 = fma(_431, _381, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _469 = fma(_459, _381, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _471 = -_377;
    float _473 = _471 + 1.0;
    float _475 = _377 * _465;
    float _477 = _393 * _437;
    bool _479 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _481 = isnan(_333);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _495 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _497 = isnan(_333);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _515 = -_489;
    float _517 = _515 + 1.0;
    bool _519 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _521 = isnan(_333);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = fma(_493, _419, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _533 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _535 = isnan(_333);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = fma(_509, _419, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _547 = fma(_513, _419, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _549 = _505 * _517;
    float _551 = -_505;
    float _553 = _551 + 1.0;
    float _555 = -_543;
    float _557 = _555 + 1.0;
    float _559 = _489 * _473;
    float _561 = _543 * _553;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _567;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _571;
    float _575 = _529 * _557;
    float _577 = fma(_565, _403, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _579 = fma(_569, _403, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _581 = fma(_573, _403, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _583 = _453 * _575;
    float _585 = _469 * _575;
    float _587 = -_529;
    float _589 = _587 + 1.0;
    float _591 = _467 * _575;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _605 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].y, _585);
    float _607 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].x, _591);
    float _609 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].z, _583);
    float _611 = fma(_595, _439, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _613 = fma(_599, _439, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _615 = fma(_603, _439, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _617 = fma(_545, _561, _605);
    float _619 = fma(_531, _561, _607);
    float _621 = fma(_547, _561, _609);
    float _623 = fma(_577, _549, _617);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _625;
    float _629 = fma(_579, _549, _619);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _631;
    float _635 = fma(_581, _549, _621);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _637;
    float _641 = fma(_627, _455, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _643 = fma(_611, _559, _629);
    float _645 = fma(_633, _455, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _647 = fma(_613, _559, _623);
    float _649 = fma(_615, _559, _635);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _655 = fma(_639, _455, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _665 = fma(_653, _477, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _667 = fma(_641, _475, _647);
    float _669 = fma(_645, _475, _643);
    float _671 = fma(_659, _477, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _673 = fma(_663, _477, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _675 = fma(_655, _475, _649);
    float _677 = fma(_665, _461, _667);
    float _679 = fma(_671, _461, _669);
    float _681 = fma(_673, _461, _675);
    float _683 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[149].y, _677);
    float _685 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[149].x, _679);
    float _687 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[149].z, _681);
    bool _689 = !_395;
    float _707;
    if (!_689)
    {
        float _691 = in.m_71.x;
        float _693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _695 = _691 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[11].x, _157);
        float _699 = _697 * _693;
        float _701 = floor(_699);
        float _703 = -_701;
        float _705 = _699 + _703;
        _707 = _705;
        _709 = true;
    }
    else
    {
        float _711 = float(_123);
        float _713 = 1.0 / _711;
        float _715 = _157 * _713;
        _707 = _715;
    }
    _709 = false;
    float _717 = _707;
    float _719 = in.m_67.x;
    float _721 = in.m_67.y;
    float _723 = in.m_67.z;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _727 = _717 + _725;
    bool _729 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _731 = isnan(_717);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _741;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _749;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _757 = 1.0 / _743;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _761 = _717 + _759;
    bool _763 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _765 = isnan(_717);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    float _775 = 1.0 / _747;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _779 = _717 + _777;
    bool _781 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _783 = 1.0 / _755;
    float _785 = _779 * _757;
    bool _787 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _789 = isnan(_717);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = _687 * _723;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _803 = _717 + _801;
    float _805 = _683 * _721;
    float _807 = -_797;
    float _809 = _807 + 1.0;
    float _811 = 1.0 / _751;
    float _813 = _727 * _775;
    float _815 = _739 * _809;
    float _817 = -_739;
    float _819 = _817 + 1.0;
    bool _821 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _823 = isnan(_717);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = _685 * _719;
    float _835 = _803 * _783;
    bool _837 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _839 = isnan(_717);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _849;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _857 = -_847;
    float _859 = _857 + 1.0;
    float _861 = _847 * _819;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _865 = _863 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _867 = _761 * _811;
    float _869 = _831 * _859;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _871;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _875;
    float _879 = -_831;
    float _881 = _879 + 1.0;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _887 = fma(_873, _785, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _889 = fma(_877, _785, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _891 = _773 * _881;
    float _893 = fma(_851, _785, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _895 = fma(_855, _813, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _897 = fma(_885, _813, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _899 = fma(_865, _813, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _901 = _887 * _891;
    float _903 = _889 * _891;
    float _905 = _893 * _891;
    float _907 = -_773;
    float _909 = _907 + 1.0;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _911;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _915;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _919;
    float _923 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[107].y, _903);
    float _925 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[107].z, _905);
    float _927 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[107].x, _901);
    float _929 = fma(_913, _867, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _931 = fma(_897, _869, _923);
    float _933 = fma(_899, _869, _925);
    float _935 = fma(_921, _867, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _937 = fma(_895, _869, _927);
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _947 = fma(_917, _867, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _953 = fma(_929, _861, _937);
    float _955 = fma(_941, _835, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _957 = fma(_945, _835, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _959 = fma(_935, _861, _931);
    float _961 = fma(_951, _835, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _963 = fma(_947, _861, _933);
    float _965 = fma(_955, _815, _953);
    float _967 = fma(_957, _815, _959);
    float _969 = fma(_961, _815, _963);
    float _971 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[111].x, _965);
    float _973 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[111].y, _967);
    float _975 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[111].z, _969);
    bool _977 = !_781;
    float _995;
    if (!_977)
    {
        float _979 = in.m_71.x;
        float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _983 = _979 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _985 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[11].y, _157);
        float _987 = _985 * _981;
        float _989 = floor(_987);
        float _991 = -_989;
        float _993 = _987 + _991;
        _995 = _993;
        _997 = true;
    }
    else
    {
        float _999 = float(_123);
        float _1001 = 1.0 / _999;
        float _1003 = _157 * _1001;
        _995 = _1003;
    }
    _997 = false;
    float _1005 = _995;
    float _1007 = _971 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1009 = _973 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1013 = _1011 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1019 = 1.0 / _1013;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1025;
    bool _1029 = _1005 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1031 = isnan(_1005);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1043 = _1041 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1045 = _1005 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1047 = isnan(_1005);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1053 = _1049 || _1051;
    float _1055 = float(_1053);
    float _1057 = _975 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1059 = 1.0 / _1017;
    bool _1061 = _1005 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1063 = isnan(_1005);
    bool _1065 = _1061 || _1063;
    bool _1067 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1069 = _1065 || _1067;
    float _1071 = float(_1069);
    bool _1073 = _1005 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1075 = isnan(_1005);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    bool _1085 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1087 = -_1071;
    float _1089 = _1087 + 1.0;
    float _1091 = 1.0 / _1023;
    float _1093 = _1027 * _1019;
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1097 = _1005 + _1095;
    float _1099 = _1083 * _1089;
    float _1101 = -_1083;
    float _1103 = _1101 + 1.0;
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1107 = _1005 + _1105;
    float _1109 = fma(_1093, _1097, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1111 = -_1039;
    float _1113 = _1111 + 1.0;
    float _1115 = 1.0 / _1043;
    float _1117 = -_1055;
    float _1119 = _1117 + 1.0;
    float _1121 = _1109 * _1099;
    float _1123 = _1071 * _1113;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1125;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1131 = _1129 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1133 = _1039 * _1119;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1139 = _1127 * _1059;
    float _1141 = _1131 * _1091;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1145 = _1005 + _1143;
    bool _1147 = _1005 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1149 = isnan(_1005);
    bool _1151 = _1147 || _1149;
    bool _1153 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1155 = _1151 || _1153;
    float _1157 = float(_1155);
    float _1159 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1121);
    float _1161 = fma(_1139, _1107, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1163 = fma(_1141, _1145, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1167 = _1005 + _1165;
    float _1169 = _1137 * _1115;
    float _1171 = -_1157;
    float _1173 = _1171 + 1.0;
    float _1175 = fma(_1163, _1123, _1159);
    float _1177 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = fma(_1169, _1167, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1181 = _1055 * _1173;
    float _1183 = fma(_1161, _1133, _1175);
    float _1185 = fma(_1179, _1181, _1183);
    float _1187 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1189 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1191 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1185);
    float _1193 = _1191 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_73.x = _1177;
    out.m_73.y = _1187;
    out.m_73.z = _1189;
    out.m_73.w = _1193;
    bool _1195 = !_1085;
    float _1213;
    if (!_1195)
    {
        float _1197 = in.m_71.x;
        float _1199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1201 = _1197 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1203 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[11].z, _157);
        float _1205 = _1203 * _1199;
        float _1207 = floor(_1205);
        float _1209 = -_1207;
        float _1211 = _1205 + _1209;
        _1213 = _1211;
        _1215 = true;
    }
    else
    {
        float _1217 = float(_123);
        float _1219 = 1.0 / _1217;
        float _1221 = _157 * _1219;
        _1213 = _1221;
    }
    _1215 = false;
    float _1223 = _1213;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1227 = _1223 + _1225;
    bool _1229 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1231 = isnan(_1223);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1243 = _1223 + _1241;
    bool _1245 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1247 = isnan(_1223);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1253 = _1249 || _1251;
    float _1255 = float(_1253);
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1263 = _1261 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1265 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1267 = isnan(_1223);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = 1.0 / _1259;
    bool _1279 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1281 = 1.0 / _1263;
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1283;
    float _1287 = _1227 * _1277;
    float _1289 = -_1239;
    float _1291 = _1289 + 1.0;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1293;
    float _1297 = fma(_1285, _1287, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1299 = _1275 * _1291;
    float _1301 = -_1275;
    float _1303 = _1301 + 1.0;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1305;
    float _1309 = fma(_1295, _1287, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1311 = _1243 * _1281;
    float _1313 = _1255 * _1303;
    float _1315 = fma(_1307, _1287, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1317 = -_1255;
    float _1319 = _1317 + 1.0;
    float _1321 = _1297 * _1313;
    float _1323 = _1315 * _1313;
    float _1325 = _1309 * _1313;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1329 = _1327 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1337 = _1335 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1339 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1323);
    float _1341 = fma(_1329, _1311, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1343 = fma(_1333, _1311, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1345 = fma(_1337, _1311, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1347 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1321);
    float _1349 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1325);
    float _1351 = fma(_1341, _1299, _1339);
    float _1353 = fma(_1343, _1299, _1347);
    float _1355 = fma(_1345, _1299, _1349);
    float _1357 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1351);
    float _1359 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1353);
    float _1361 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1355);
    float _1363 = _1357 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1365 = _1359 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1367 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1369 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1371 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1373 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_75.x = _1369;
    out.m_75.y = _1371;
    out.m_75.z = _1373;
    bool _1375 = !_1279;
    float _1393;
    if (!_1375)
    {
        float _1377 = in.m_71.x;
        float _1379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1381 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[14].x, _157);
        float _1385 = _1383 * _1379;
        float _1387 = floor(_1385);
        float _1389 = -_1387;
        float _1391 = _1385 + _1389;
        _1393 = _1391;
        _1395 = true;
    }
    else
    {
        float _1397 = float(_123);
        float _1399 = 1.0 / _1397;
        float _1401 = _157 * _1399;
        _1393 = _1401;
    }
    _1395 = false;
    float _1403 = _1393;
    int _1405 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1407 = _1405;
    int _1409 = 0;
    int _1411 = _114(_1407, _1409, (*spvDescriptorSet0.support_buffer));
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1419 = _1417 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1423 = _1421 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1425 = 1.0 / _1415;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1427;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1433 = _1431 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1435 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1437 = isnan(_1403);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1443 = _1439 || _1441;
    float _1445 = float(_1443);
    bool _1447 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1449 = isnan(_1403);
    bool _1451 = _1447 || _1449;
    bool _1453 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1455 = _1451 || _1453;
    float _1457 = float(_1455);
    float _1459 = 1.0 / _1419;
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1463 = _1461 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1465 = -_1445;
    float _1467 = _1465 + 1.0;
    float _1469 = 1.0 / _1423;
    float _1471 = _1429 * _1425;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1475 = _1473 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1483 = _1481 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1485 = 1.0 / _1433;
    bool _1487 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1489 = isnan(_1403);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1495 = _1491 || _1493;
    float _1497 = float(_1495);
    float _1499 = _1479 * _1459;
    bool _1501 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1503 = isnan(_1403);
    bool _1505 = _1501 || _1503;
    bool _1507 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1509 = _1505 || _1507;
    float _1511 = float(_1509);
    float _1513 = -_1497;
    float _1515 = _1513 + 1.0;
    float _1517 = _1475 * _1469;
    float _1519 = 1.0 / _1463;
    bool _1521 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1523 = isnan(_1403);
    bool _1525 = _1521 || _1523;
    bool _1527 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1529 = _1525 || _1527;
    float _1531 = float(_1529);
    float _1533 = _1511 * _1515;
    float _1535 = -_1511;
    float _1537 = _1535 + 1.0;
    float _1539 = -_1531;
    float _1541 = _1539 + 1.0;
    float _1543 = _1531 * _1537;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1549;
    float _1553 = _1445 * _1541;
    bool _1555 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1557 = isnan(_1403);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = _1547 * _1485;
    float _1569 = _1457 * _1467;
    float _1571 = -_1457;
    float _1573 = _1571 + 1.0;
    float _1575 = 1.0 / _1483;
    float _1577 = _1551 * _1519;
    bool _1579 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1581 = isnan(_1403);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    float _1591 = _1565 * _1573;
    float _1593 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1595 = _1403 + _1593;
    float _1597 = -_1565;
    float _1599 = _1597 + 1.0;
    float _1601 = fma(_1471, _1595, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1603 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1605 = _1603 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1607 = _1589 * _1599;
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1611 = _1609 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1615 = _1403 + _1613;
    float _1617 = -_1589;
    float _1619 = _1617 + 1.0;
    float _1621 = _1601 * _1607;
    float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1625 = _1403 + _1623;
    float _1627 = fma(_1517, _1615, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1629 = 1.0 / _1611;
    float _1631 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1621);
    float _1633 = _1605 * _1575;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1637 = _1403 + _1635;
    float _1639 = fma(_1499, _1625, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1641 = fma(_1627, _1591, _1631);
    float _1643 = in.m_71.x;
    float _1645 = in.m_71.y;
    float _1647 = fma(_1567, _1637, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1651 = _1403 + _1649;
    float _1653 = fma(_1639, _1569, _1641);
    bool _1655 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1657 = isnan(_1403);
    bool _1659 = _1655 || _1657;
    bool _1661 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1663 = _1659 || _1661;
    float _1665 = float(_1663);
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1669 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1667;
    float _1671 = fma(_1577, _1651, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1675 = _1403 + _1673;
    float _1677 = fma(_1647, _1553, _1653);
    float _1679 = _1669 * _1629;
    float _1681 = -_1665;
    float _1683 = _1681 + 1.0;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1687 = _1403 + _1685;
    float _1689 = fma(_1633, _1675, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1691 = fma(_1671, _1543, _1677);
    float _1693 = _1497 * _1683;
    float _1695 = fma(_1679, _1687, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1697 = in.m_65.z;
    float _1699 = fma(_1689, _1533, _1691);
    float _1701 = fma(_1695, _1693, _1699);
    float _1703 = -_1643;
    float _1705 = fma(0.5, _1703, 1.0);
    float _1707 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1701);
    float _1709 = _1707 * _1705;
    float _1711 = precise::clamp(_1709, 0.0, 1.0);
    float _1713 = trunc(_1697);
    int _1715 = int(_1713);
    int _1717 = _1411 + (-1);
    float _1719 = float(_1717);
    float _1721 = _1711 * _1719;
    float _1723 = trunc(_1721);
    int _1725 = int(_1723);
    int _1727 = _1725;
    int _1729 = 0;
    int _1731 = _115(_1727, _1729, (*spvDescriptorSet0.support_buffer));
    int _1733 = _1715;
    int _1735 = 0;
    int _1737 = _115(_1733, _1735, (*spvDescriptorSet0.support_buffer));
    float4 _1740 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1731, _1737)), 0).xyzw;
    float _1742 = _1740.x;
    float _1744 = _1740.y;
    float _1746 = _1740.z;
    float _1748 = _1740.w;
    float _1750 = in.m_65.x;
    float _1752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1756 = _1754 != 0;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1760 = _1758 != 0;
    float _1762 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1764 = _1645 > 0.5;
    bool _1766 = _1764 && _1760;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1770 = _1719;
    float _1772 = _1591;
    if (_1756)
    {
        float _1774 = in.m_71.x;
        _1770 = _1774;
    }
    float _1776 = _1770;
    float _1778 = fma(_1645, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1768);
    if (_1766)
    {
        float _1780 = -_179;
        float _1782 = _1780 + 1.0;
        _227 = _1782;
    }
    float _1784 = _227;
    if (_1756)
    {
        _1772 = _1750;
    }
    float _1786 = _1772;
    bool _1788 = _1776 > 0.5;
    bool _1790 = _1788 && _1756;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1794 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1796 = -_1792;
    float _1798 = fma(_1794, 2.0, _1796);
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1802 = _1786;
    float _1804 = _1792;
    if (_1790)
    {
        float _1806 = -_1786;
        float _1808 = _1806 + 1.0;
        _1802 = _1808;
    }
    float _1810 = _1802;
    if (!_1756)
    {
        _1804 = _1750;
    }
    float _1812 = _1804;
    float _1814 = -_157;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1798);
    float _1818 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1800);
    float _1820 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1822 = _1812;
    if (_1756)
    {
        _1822 = _1810;
    }
    float _1824 = _1822;
    float _1826 = _1762 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1828 = fma(_1820, _1784, -0.5);
    float _1830 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1818);
    float _1832 = fma(_1826, _1824, -0.5);
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1836 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1838 = fma(_1830, _1832, _1816);
    int _1840 = _1725 + 1;
    float _1842 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1778);
    float _1844 = fma(_1836, -2.0, _1834);
    float _1846 = _1838 + 0.5;
    int _1848 = min(_1717, _1840);
    float _1850 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1844);
    float _1852 = -_1850;
    float _1854 = fma(_1842, _1828, _1852);
    float _1856 = _1854 + 0.5;
    uint _1859 = as_type<uint>(half2(float2(_1748, 0.0)));
    uint _1861 = extract_bits(_1859, 0u, 8u);
    int _1863 = int(_1861) & 255;
    uint _1865 = extract_bits(_1859, 8u, 8u);
    int _1867 = int(_1865) & 255;
    int _1869 = _1867 << 8;
    int _1871 = _1863 | _1869;
    bool _1873 = _1871 >= 32768;
    int _1875 = _1871 + (-1024);
    int _1877 = _1875;
    if (_1873)
    {
        int _1879 = ~_1871;
        int _1881 = _1879 + 33792;
        int _1883 = _1881 + 1;
        _1877 = _1883;
    }
    int _1885 = _1877;
    int _1887 = _1885 + 30719;
    float _1889 = float(_1887);
    float _1891 = fma(_1889, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1893 = abs(_1891);
    float _1895 = -_1893;
    float _1897 = _1895 + 1.0;
    bool _1899 = _1891 < 0.0;
    float _1901 = float(_1899);
    float _1903 = abs(_1891);
    float _1905 = fma(_1903, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1907 = as_type<int>(_1897) + (-218103808);
    float _1909 = abs(_1891);
    float _1911 = fma(_1909, _1905, -0.212114393711090087890625);
    bool _1913 = uint(_1907) >= 1920991232u;
    float _1915 = abs(_1891);
    float _1917 = fma(_1915, _1911, 1.570728778839111328125);
    bool _1919 = !_1913;
    float _1941;
    if (!_1919)
    {
        int _1921 = as_type<int>(_1897);
        int _1923 = _1717;
        int _1925 = as_type<int>(_1816);
        int _1927 = 9536;
        int _1929;
        int _1931;
        int _1933;
        int _1935;
        int _1937;
        int _1939;
        _112(_1921, _1923, _1925, _1927, _1929, _1931, _1933, _1935, _1937, _1939, out.gl_Position, out.gl_PointSize);
        _1941 = as_type<float>(_1935);
        _1943 = true;
    }
    else
    {
        float _1945 = rsqrt(_1897);
        float _1947 = _1897 * _1945;
        float _1949 = _1945 * 0.5;
        float _1951 = -_1947;
        float _1953 = 0.0 + _1951;
        float _1955 = fma(_1949, _1953, 0.5);
        float _1957 = fma(_1947, _1955, _1947);
        float _1959 = -_1957;
        float _1961 = 0.0 + _1959;
        float _1963 = fma(_1957, _1961, _1897);
        float _1965 = fma(_1949, _1963, _1957);
        _1941 = _1965;
    }
    _1943 = false;
    float _1967 = _1941;
    int _1969 = _1848;
    int _1971 = 0;
    int _1973 = _115(_1969, _1971, (*spvDescriptorSet0.support_buffer));
    int _1975 = _1715;
    int _1977 = 0;
    int _1979 = _115(_1975, _1977, (*spvDescriptorSet0.support_buffer));
    float4 _1981 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1973, _1979)), 0).xyzw;
    float _1983 = _1981.x;
    float _1985 = _1981.y;
    float _1987 = _1981.z;
    float _1989 = _1981.w;
    float _1991 = _1917 * _1967;
    float _1993 = _1901 * 2.0;
    float _1995 = _1889 * 3.883221149444580078125;
    float _1997 = floor(_1721);
    float _1999 = -_1993;
    float _2001 = fma(_1991, _1999, _1991);
    float _2003 = _1995 * 0.15915493667125701904296875;
    float _2005 = fma(_1901, 3.1415927410125732421875, _2001);
    float _2007 = _2003 * 6.283185482025146484375;
    float _2009 = cos(_2007);
    float _2011 = _2005 * 0.15915493667125701904296875;
    float _2013 = _2011 * 6.283185482025146484375;
    float _2015 = sin(_2013);
    float _2017 = -_1997;
    float _2019 = _1721 + _2017;
    float _2021 = _2003 * 6.283185482025146484375;
    float _2023 = sin(_2021);
    float _2025 = _2015 * _2009;
    float _2027 = _2015 * _2023;
    uint _2029 = as_type<uint>(half2(float2(_1989, 0.0)));
    float _2031 = -_1746;
    float _2033 = _2031 + _1987;
    float _2035 = -_1742;
    float _2037 = _2035 + _1983;
    uint _2039 = extract_bits(_2029, 0u, 8u);
    int _2041 = int(_2039) & 255;
    uint _2043 = extract_bits(_2029, 8u, 8u);
    int _2045 = int(_2043) & 255;
    int _2047 = _2045 << 8;
    int _2049 = _2041 | _2047;
    float _2051 = fma(_2019, _2033, _1746);
    float _2053 = fma(_2019, _2037, _1742);
    bool _2055 = _2049 >= 32768;
    int _2057 = _2049 + (-1024);
    int _2059 = _2057;
    if (_2055)
    {
        int _2061 = ~_2049;
        int _2063 = _2061 + 33792;
        int _2065 = _2063 + 1;
        _2059 = _2065;
    }
    int _2067 = _2059;
    int _2069 = _2067 + 30719;
    float _2071 = float(_2069);
    float _2073 = fma(_2071, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2075 = abs(_2073);
    float _2077 = -_2075;
    float _2079 = _2077 + 1.0;
    bool _2081 = _2073 < 0.0;
    float _2083 = float(_2081);
    float _2085 = abs(_2073);
    float _2087 = fma(_2085, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2089 = as_type<int>(_2079) + (-218103808);
    float _2091 = abs(_2073);
    float _2093 = fma(_2091, _2087, -0.212114393711090087890625);
    bool _2095 = uint(_2089) >= 1920991232u;
    float _2097 = -_1744;
    float _2099 = _2097 + _1985;
    float _2101 = abs(_2073);
    float _2103 = fma(_2101, _2093, 1.570728778839111328125);
    float _2105 = fma(_2019, _2099, _1744);
    bool _2107 = !_2095;
    float _2129;
    if (!_2107)
    {
        int _2109 = as_type<int>(_2079);
        int _2111 = as_type<int>(_1985);
        int _2113 = as_type<int>(_2079);
        int _2115 = 10448;
        int _2117;
        int _2119;
        int _2121;
        int _2123;
        int _2125;
        int _2127;
        _112(_2109, _2111, _2113, _2115, _2117, _2119, _2121, _2123, _2125, _2127, out.gl_Position, out.gl_PointSize);
        _2129 = as_type<float>(_2123);
        _2131 = true;
    }
    else
    {
        float _2133 = rsqrt(_2079);
        float _2135 = _2079 * _2133;
        float _2137 = _2133 * 0.5;
        float _2139 = -_2135;
        float _2141 = 0.0 + _2139;
        float _2143 = fma(_2137, _2141, 0.5);
        float _2145 = fma(_2135, _2143, _2135);
        float _2147 = -_2145;
        float _2149 = 0.0 + _2147;
        float _2151 = fma(_2145, _2149, _2079);
        float _2153 = fma(_2137, _2151, _2145);
        _2129 = _2153;
    }
    _2131 = false;
    float _2155 = _2129;
    float _2157 = _301 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2159 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2157);
    float _2161 = _301 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2163 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2159);
    float _2165 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2161);
    float _2167 = _2163 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2169 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2165);
    float _2171 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2173 = _2169 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2175 = floor(_2171);
    float _2177 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2179 = floor(_2177);
    float _2181 = -_2175;
    float _2183 = _2171 + _2181;
    float _2185 = -_2179;
    float _2187 = _2177 + _2185;
    float2 _7416 = float2(_2183, _2187);
    float _2189 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7416, float2(0.0), isnan(_7416)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7416, float2(0.0), isnan(_7416)), level(0.0)).x;
    float _2191 = in.m_71.x;
    float _2193 = in.m_71.y;
    float _2195 = in.m_71.z;
    float _2197 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2199 = log2(_2197);
    float _2201 = _301 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2203 = _799 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2205 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2201);
    float _2207 = _805 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2209 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2205);
    float _2211 = _833 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2213 = _2209 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2215 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2217 = _2199 * _157;
    float _2219 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2221 = _2213 + _2215;
    float _2223 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2219);
    float _2225 = exp2(_2217);
    float _2227 = _2191 * 2.0;
    float _2229 = _2193 * 2.0;
    float _2231 = _2195 * 2.0;
    float _2233 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2235 = floor(_2227);
    float _2237 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2233);
    float _2239 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2237);
    float _2241 = floor(_2229);
    float _2243 = -_2225;
    float _2245 = _2243 + 1.0;
    float _2247 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _2249 = _2235 > 0.0;
    float _2251 = floor(_2231);
    bool _2253 = _2235 >= 0.0;
    bool _2255 = isnan(_2235);
    bool _2257 = _2253 || _2255;
    bool _2259 = isnan(0.0);
    bool _2261 = _2257 || _2259;
    int _2263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2265 = _2263 != 0;
    int _2267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2269 = _2267 != 0;
    int _2271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2273 = _2271 != 0;
    float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2277 = 1.0 + _2275;
    int _2279 = _2261 ? 0 : 1;
    float _2281 = trunc(_2247);
    int _2283 = int(_2281);
    bool _2285 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2287 = isnan(1.0);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2293 = _2289 || _2291;
    float _2295 = _2195 + _2193;
    bool _2297 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2299 = isnan(0.0);
    bool _2301 = _2297 || _2299;
    bool _2303 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2305 = _2301 || _2303;
    float _2307 = 1.0 / _2277;
    float _2309 = _2295 + (-1.0);
    int _2311 = ~_2279;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    int _2317 = _2315;
    int _2319 = 2;
    if (!_2249)
    {
        int _2321 = ~_2279;
        int _2323 = _2321 + 1;
        _2317 = _2323;
    }
    int _2325 = _2317;
    float _2327 = fma(_2309, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2329 = _2305 ? _2245 : 0.0;
    bool _2331 = !_2269;
    int _2333 = _2331 ? 0 : 1;
    bool _2335 = _2241 > 0.0;
    bool _2337 = _2241 >= 0.0;
    bool _2339 = isnan(_2241);
    bool _2341 = _2337 || _2339;
    bool _2343 = isnan(0.0);
    bool _2345 = _2341 || _2343;
    float _2347 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2223);
    int _2349 = abs(_2333);
    float _2351 = in.m_77.x;
    float _2353 = in.m_77.y;
    float _2355 = in.m_77.z;
    if (_2293)
    {
        float _2357 = _2329 * _2307;
        _159 = _2357;
    }
    float _2359 = _159;
    float _2361 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2363 = _2347 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2365 = float(_2349);
    float _2367 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2361);
    float _2369 = float(_2325);
    float _2371 = 1.0 / _2363;
    bool _2373 = _2251 > 0.0;
    float _2375 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2367);
    bool _2377 = _2251 >= 0.0;
    bool _2379 = isnan(_2251);
    bool _2381 = _2377 || _2379;
    bool _2383 = isnan(0.0);
    bool _2385 = _2381 || _2383;
    float _2387 = _2365 * _2369;
    bool _2389 = !_2265;
    int _2391 = _2389 ? 0 : 1;
    float _2393 = _2375 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2395 = _2345 ? 0 : 1;
    int _2397 = abs(_2391);
    float _2399 = _2393 + _2363;
    float _2401 = _2387 * (-2.0);
    int _2403 = _2385 ? 0 : 1;
    int _2405 = ~_2395;
    int _2407 = _2405 + 1;
    int _2409 = _2407 + 1;
    int _2411 = _2409;
    if (!_2335)
    {
        int _2413 = ~_2395;
        int _2415 = _2413 + 1;
        _2411 = _2415;
    }
    int _2417 = _2411;
    float _2419 = fma(_2401, _2353, _2353);
    float _2421 = _2193 + (-0.5);
    int _2423 = ~_2403;
    int _2425 = _2423 + 1;
    int _2427 = _2425 + 1;
    float _2429 = fma(_2327, _2401, _2327);
    int _2431 = _2427;
    if (!_2373)
    {
        int _2433 = ~_2403;
        int _2435 = _2433 + 1;
        _2431 = _2435;
    }
    int _2437 = _2431;
    float _2439 = fma(_2421, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2419);
    float _2441 = _2399 * _2371;
    float _2443 = _2441 * 0.5;
    bool _2445 = !_2273;
    int _2447 = _2445 ? 0 : 1;
    float _2449 = _2193 + _2191;
    float _2451 = fma(_2429, _2359, _2439);
    float _2453 = float(_2397);
    float _2455 = _2449 + (-1.0);
    float _2457 = float(_2437);
    float _2459 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2461 = fma(_2443, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2459);
    int _2463 = abs(_2447);
    float _2465 = _2195 + _2191;
    float _2467 = _2453 * _2457;
    float _2469 = float(_2463);
    float _2471 = _2465 + (-1.0);
    float _2473 = float(_2417);
    float _2475 = _2467 * (-2.0);
    float _2477 = 1.0 / _2461;
    float _2479 = fma(_2471, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2481 = _2469 * _2473;
    float _2483 = fma(_2475, _2351, _2351);
    float _2485 = fma(_2455, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2487 = _2191 + (-0.5);
    float _2489 = _2481 * (-2.0);
    float _2491 = _2195 + (-0.5);
    float _2493 = fma(_2485, _2475, _2485);
    float _2495 = fma(_2487, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2483);
    float _2497 = fma(_2489, _2355, _2355);
    float _2499 = fma(_2479, _2489, _2479);
    float _2501 = _2451 * 0.15915493667125701904296875;
    float _2503 = fma(_2493, _2359, _2495);
    float _2505 = fma(_2491, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2497);
    float _2507 = _2501 * 6.283185482025146484375;
    float _2509 = sin(_2507);
    float _2511 = _2503 * 0.15915493667125701904296875;
    float _2513 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2515 = _2477 * _2513;
    float _2517 = fma(_2499, _2359, _2505);
    float _2519 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2521 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2105);
    float _2523 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2053);
    float _2525 = _2517 * 0.15915493667125701904296875;
    bool _2527 = _2515 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2529 = _2511 * 6.283185482025146484375;
    float _2531 = cos(_2529);
    bool _2533 = _2515 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2535 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2519);
    bool _2537 = !_2527;
    int _2539 = _2537 ? 0 : 1;
    float _2541 = _2521 * _2207;
    float _2543 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2051);
    float _2545 = _2523 * _2211;
    int _2547 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2549 = _2283 + _2547;
    int _2551 = _2549 + 1;
    float _2553 = _2501 * 6.283185482025146484375;
    float _2555 = cos(_2553);
    float _2557 = _2543 * _2203;
    int _2559 = _2551;
    if (!_2527)
    {
        _2319 = 1;
    }
    int _2561 = _2319;
    int _2563 = _2561;
    if (!_2533)
    {
        _2563 = _2539;
    }
    int _2565 = _2563;
    float _2567 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2535);
    float _2569 = _2511 * 6.283185482025146484375;
    float _2571 = sin(_2569);
    float _2573 = _2531 * _2509;
    int _2575 = _2565 << 6;
    float _2577 = _2567 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2579 = _2551 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2581 = _2575 + 64;
    uint _2583 = uint(int(uint(_2581) >> uint(2)));
    uint _2585 = uint(int(uint(int(_2583)) >> uint(2)));
    int _2587 = int(_2583) & 3;
    float _2589 = (*spvDescriptorSet0.vp_c15)._m0[int(_2585)][_2587];
    int _2591 = int(_2583) + 1;
    uint _2593 = uint(int(uint(_2591) >> uint(2)));
    int _2595 = _2591 & 3;
    float _2597 = (*spvDescriptorSet0.vp_c15)._m0[int(_2593)][_2595];
    bool _2599 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2601 = isnan(0.5);
    bool _2603 = _2599 || _2601;
    bool _2605 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2607 = _2603 || _2605;
    float _2609 = _2525 * 6.283185482025146484375;
    float _2611 = cos(_2609);
    float _2613 = _2531 * _2555;
    float _2615 = _2525 * 6.283185482025146484375;
    float _2617 = sin(_2615);
    float _2619 = _2571 * _2555;
    float _2621 = _2571 * _2509;
    float _2623 = _2531 * _2611;
    float _2625 = _2555 * _2611;
    float _2627 = _2571 * _2611;
    float _2629 = _2509 * _2611;
    float _2631 = _2623 * _2541;
    int _2633 = _2575 + 96;
    uint _2635 = uint(int(uint(_2633) >> uint(2)));
    uint _2637 = uint(int(uint(int(_2635)) >> uint(2)));
    int _2639 = int(_2635) & 3;
    float _2641 = (*spvDescriptorSet0.vp_c15)._m0[int(_2637)][_2639];
    int _2643 = int(_2635) + 1;
    uint _2645 = uint(int(uint(_2643) >> uint(2)));
    int _2647 = _2643 & 3;
    float _2649 = (*spvDescriptorSet0.vp_c15)._m0[int(_2645)][_2647];
    float _2651 = trunc(_2577);
    int _2653 = int(_2651);
    float _2655 = -_2573;
    float _2657 = fma(_2617, _2619, _2655);
    float _2659 = fma(_2617, _2613, _2621);
    float _2661 = -_2619;
    float _2663 = fma(_2617, _2573, _2661);
    float _2665 = -_2541;
    float _2667 = _2617 * _2665;
    float _2669 = _2627 * _2541;
    int _2671 = _2575 + 104;
    uint _2673 = uint(int(uint(_2671) >> uint(2)));
    uint _2675 = uint(int(uint(int(_2673)) >> uint(2)));
    int _2677 = int(_2673) & 3;
    float _2679 = (*spvDescriptorSet0.vp_c15)._m0[int(_2675)][_2677];
    int _2681 = int(_2673) + 1;
    uint _2683 = uint(int(uint(_2681) >> uint(2)));
    int _2685 = _2681 & 3;
    float _2687 = (*spvDescriptorSet0.vp_c15)._m0[int(_2683)][_2685];
    float _2689 = fma(_2659, _2545, _2631);
    float _2691 = fma(_2617, _2621, _2613);
    float _2693 = fma(_2625, _2545, _2667);
    float _2695 = fma(_2657, _2545, _2669);
    float _2697 = fma(_2663, _2557, _2689);
    float _2699 = fma(_2629, _2557, _2693);
    int _2701 = _2575 + 48;
    uint _2703 = uint(int(uint(_2701) >> uint(2)));
    uint _2705 = uint(int(uint(int(_2703)) >> uint(2)));
    int _2707 = int(_2703) & 3;
    float _2709 = (*spvDescriptorSet0.vp_c15)._m0[int(_2705)][_2707];
    int _2711 = int(_2703) + 1;
    uint _2713 = uint(int(uint(_2711) >> uint(2)));
    int _2715 = _2711 & 3;
    float _2717 = (*spvDescriptorSet0.vp_c15)._m0[int(_2713)][_2715];
    float _2719 = _2697 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2721 = fma(_2691, _2557, _2695);
    float _2723 = _2697 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _2725 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2727 = _2653 + _2725;
    int _2729 = _2727 + 1;
    float _2731 = fma(_2699, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2719);
    float _2733 = fma(_2699, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2723);
    int _2735 = _2575 + 56;
    uint _2737 = uint(int(uint(_2735) >> uint(2)));
    uint _2739 = uint(int(uint(int(_2737)) >> uint(2)));
    int _2741 = int(_2737) & 3;
    float _2743 = (*spvDescriptorSet0.vp_c15)._m0[int(_2739)][_2741];
    int _2745 = int(_2737) + 1;
    uint _2747 = uint(int(uint(_2745) >> uint(2)));
    int _2749 = _2745 & 3;
    float _2751 = (*spvDescriptorSet0.vp_c15)._m0[int(_2747)][_2749];
    float _2753 = fma(_2721, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2731);
    int _2755 = _2551 | _2729;
    float _2757 = fma(_2721, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2733);
    float _2759 = _2221 * _2597;
    float _2761 = _2173 + _2753;
    bool _2763 = _2755 < 0;
    bool _2765 = _2763 || _2579;
    float _2767 = _2167 + _2757;
    int _2769 = _2575 + 72;
    uint _2771 = uint(int(uint(_2769) >> uint(2)));
    uint _2773 = uint(int(uint(int(_2771)) >> uint(2)));
    int _2775 = int(_2771) & 3;
    float _2777 = (*spvDescriptorSet0.vp_c15)._m0[int(_2773)][_2775];
    int _2779 = int(_2771) + 1;
    uint _2781 = uint(int(uint(_2779) >> uint(2)));
    int _2783 = _2779 & 3;
    float _2785 = (*spvDescriptorSet0.vp_c15)._m0[int(_2781)][_2783];
    float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2789 = _2761 + _2787;
    bool _2791 = _2729 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2793 = _2791 || _2765;
    float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2797 = _2767 + _2795;
    float _2799 = fma(_2167, _2589, _2759);
    float _2801 = _2789 * _2789;
    int _2803 = _2575 + 80;
    uint _2805 = uint(int(uint(_2803) >> uint(2)));
    uint _2807 = uint(int(uint(int(_2805)) >> uint(2)));
    int _2809 = int(_2805) & 3;
    float _2811 = (*spvDescriptorSet0.vp_c15)._m0[int(_2807)][_2809];
    int _2813 = int(_2805) + 1;
    uint _2815 = uint(int(uint(_2813) >> uint(2)));
    int _2817 = _2813 & 3;
    float _2819 = (*spvDescriptorSet0.vp_c15)._m0[int(_2815)][_2817];
    float _2821 = fma(_2797, _2797, _2801);
    float _2823 = sqrt(_2821);
    float _2825 = _2767;
    float _2827 = _2761;
    if (!_2793)
    {
        int _2829 = _2729 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2831 = _2829 + _2551;
        _2559 = _2831;
    }
    int _2833 = _2559;
    float _2835 = _2221 * _2649;
    float _2837 = fma(_2167, _2641, _2835);
    float _2839 = _2697 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2841 = _2697;
    int _2843 = as_type<int>(_2839);
    if (!_2793)
    {
        float _2845 = floor(_2247);
        _2841 = _2845;
    }
    float _2847 = _2841;
    float _2849 = fma(_2173, _2679, _2837);
    float _2851 = fma(_2699, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2839);
    int _2853 = as_type<int>(_2679);
    if (!_2793)
    {
        int _2855 = _2833 << 2;
        _2843 = _2855;
    }
    int _2857 = _2843;
    float _2859 = _2849 + _2687;
    bool _2861 = _2823 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2863 = fma(_2721, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2851);
    int _2865 = _2857;
    float _2867 = _2823;
    if (!_2793)
    {
        uint _2869 = uint(int(uint(_2833) >> uint(2)));
        _2853 = int(_2869);
    }
    int _2871 = _2853;
    float _2873 = _2221 * _2717;
    float _2875 = as_type<float>(_2871);
    if (!_2793)
    {
        int _2877 = 12 & _2857;
        _2865 = _2877;
    }
    int _2879 = _2865;
    float _2881 = 1.0 / _2859;
    float _2883 = _2213 + _2863;
    float _2885 = fma(_2167, _2709, _2873);
    float _2887 = as_type<float>(_2879);
    float _2889 = _2883;
    if (!_2793)
    {
        int _2891 = _2871 << 4;
        int _2893 = _2891 + _2879;
        _2875 = as_type<float>(_2893);
    }
    float _2895 = _2875;
    float _2897 = fma(_2173, _2743, _2885);
    if (!_2861)
    {
        _2887 = _2883;
    }
    float _2899 = _2887;
    float _2901 = _2897 + _2751;
    float _2903 = fma(_2173, _2777, _2799);
    float _2905 = _2903 + _2785;
    bool _2907 = !_2861;
    float _2909 = _2899;
    float _2911 = _2819;
    if (!_2907)
    {
        float _2913 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2917 = _2823 + _2915;
        float _2919 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2921 = rsqrt(_2821);
        float _2923 = _2917 * _2913;
        float _2925 = _2923 * 0.15915493667125701904296875;
        float _2927 = _2925 * 6.283185482025146484375;
        float _2929 = cos(_2927);
        float _2931 = _2925 * 6.283185482025146484375;
        float _2933 = sin(_2931);
        float _2935 = _2929 + (-1.0);
        float _2937 = fma(_2933, _2919, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2939 = _2935 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2941 = _2921 * _2937;
        float _2943 = fma(_2883, _2929, _2939);
        float _2945 = fma(_2797, _2941, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2947 = fma(_2789, _2941, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2825 = _2945;
        _2827 = _2947;
        _2909 = _2943;
        _2867 = _2933;
    }
    float _2949 = _2825;
    float _2951 = _2827;
    float _2953 = _2909;
    float _2955 = _2867;
    float _2957 = _2955;
    float _2959 = _2953;
    if (_2607)
    {
        _2889 = _2949;
    }
    float _2961 = _2889;
    float _2963 = _2961;
    if (_2607)
    {
        _2957 = _2951;
    }
    float _2965 = _2957;
    float _2967 = _2965;
    if (!_2607)
    {
        float _2969 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2971 = _2213 + _2969;
        float _2973 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2975 = _2167 + _2973;
        float _2977 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2979 = -_2173;
        float _2981 = _2979 + _2951;
        float _2983 = _2971 * _2971;
        float _2985 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2987 = _2173 + _2985;
        float _2989 = fma(_2975, _2975, _2983);
        float _2991 = fma(_2987, _2987, _2989);
        float _2993 = -_2213;
        float _2995 = _2993 + _2953;
        float _2997 = sqrt(_2991);
        float _2999 = precise::min(_2997, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3001 = _2999 * _2977;
        float _3003 = -_2167;
        float _3005 = _3003 + _2949;
        float _3007 = fma(_2995, _3001, _2213);
        float _3009 = fma(_3005, _3001, _2167);
        float _3011 = fma(_2981, _3001, _2173);
        _2959 = _3007;
        _2963 = _3009;
        _2967 = _3011;
    }
    float _3013 = _2959;
    float _3015 = _2963;
    float _3017 = _2967;
    float _3019 = _2895;
    if (!_2793)
    {
        int _3021 = as_type<int>(_2895) + 400;
        uint _3023 = uint(int(uint(_3021) >> uint(2)));
        uint _3025 = uint(int(uint(int(_3023)) >> uint(2)));
        int _3027 = int(_3023) & 3;
        float _3029 = (*spvDescriptorSet0.vp_c15)._m0[int(_3025)][_3027];
        _3019 = _3029;
    }
    float _3031 = _3019;
    float _3033 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3035 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3037 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3039 = _2901 * _2881;
    float _3041 = fma(_3015, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3033);
    float _3043 = fma(_3015, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3035);
    float _3045 = fma(_3015, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3037);
    int _3047 = _2575 + 88;
    uint _3049 = uint(int(uint(_3047) >> uint(2)));
    uint _3051 = uint(int(uint(int(_3049)) >> uint(2)));
    int _3053 = int(_3049) & 3;
    float _3055 = (*spvDescriptorSet0.vp_c15)._m0[int(_3051)][_3053];
    int _3057 = int(_3049) + 1;
    uint _3059 = uint(int(uint(_3057) >> uint(2)));
    int _3061 = _3057 & 3;
    float _3063 = (*spvDescriptorSet0.vp_c15)._m0[int(_3059)][_3061];
    float _3065 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3041);
    bool _3067 = _3039 >= 0.0;
    float _3069 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3043);
    float _3071 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3045);
    float _3073 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3075 = _3065 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3077 = _2905 * _2881;
    bool _3079 = _3039 <= 1.0;
    bool _3081 = _3079 && _3067;
    float _3083 = _3069 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3085 = _3071 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3087 = fma(_3015, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3073);
    float _3089 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3091 = _3077 >= 0.0;
    bool _3093 = _3091 && _3081;
    float _3095 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3097 = _3083 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3099 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3087);
    float _3101 = fma(_3085, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3089);
    bool _3103 = _3077 <= 1.0;
    bool _3105 = _3103 && _3093;
    float _3107 = -_3097;
    float _3109 = fma(_3107, _3095, 1.0);
    float _3111 = _3099 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3113 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3101);
    float _3115 = _2949;
    if (!_2793)
    {
        float _3117 = floor(_2577);
        _3115 = _3117;
    }
    float _3119 = _3115;
    float _3121 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3123 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3125 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3113);
    float _3127 = _2221 * _2819;
    float _3129 = fma(_3085, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3121);
    float _3131 = fma(_3085, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3123);
    float _3133 = log2(_3109);
    if (_3105)
    {
        float _3135 = float(_2565);
        _2911 = _3135;
    }
    float _3137 = _2911;
    float _3139 = fma(_2167, _2811, _3127);
    float _3141 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3129);
    float _3143 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3141);
    float _3145 = 1.0 / _3125;
    float _3147 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3131);
    float _3149 = _3119;
    float _3151 = _3139;
    if (!_2793)
    {
        float _3153 = -_3119;
        float _3155 = _2577 + _3153;
        _3149 = _3155;
    }
    float _3157 = _3149;
    float _3159 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3147);
    float _3161 = _3127;
    if (_3105)
    {
        float _3163 = rint(_3137);
        float _3165 = precise::max(_3163, 0.0);
        uint _3167 = uint(_3165);
        uint _3169 = clamp(_3167, 0u, 65535u);
        _3161 = as_type<float>(_3169);
    }
    float _3171 = _3161;
    float _3173 = _3133 * 0.693147182464599609375;
    float _3175 = fma(_2173, _3055, _3139);
    float _3177 = _3173 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3179 = _3175 + _3063;
    float _3181 = _3173;
    if (!_2793)
    {
        float _3183 = -_2847;
        float _3185 = _2247 + _3183;
        _3181 = _3185;
    }
    float _3187 = _3181;
    float _3189 = _3031;
    if (!_2793)
    {
        float _3191 = rint(_3031);
        float _3193 = precise::max(_3191, 0.0);
        uint _3195 = uint(_3193);
        uint _3197 = clamp(_3195, 0u, 65535u);
        _3189 = as_type<float>(_3197);
    }
    float _3199 = _3189;
    float _3201 = _3143 * _3145;
    float _3203 = _3159 * _3145;
    float _3205 = _3179 * _2881;
    float _3207 = fma(_3201, 0.5, 0.5);
    float _3209 = fma(_3203, -0.5, 0.5);
    float _3211 = _3077;
    float _3213 = _3203;
    if (_3105)
    {
        float3 _9043 = float3(_3039, _3077, float(as_type<int>(_3171)));
        float3 _9047 = select(_9043, float3(0.0), isnan(_9043));
        float _3215 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9047.xy, uint(rint(_9047.z)), _3205, level(0.0));
        _3211 = _3215;
    }
    float _3217 = _3211;
    float3 _9057 = float3(_3207, _3209, _3177);
    float _3219 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9057, float3(0.0), isnan(_9057)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9057, float3(0.0), isnan(_9057)), level(0.0)).x;
    float3 _9066 = float3(_3207, _3209, _3177);
    float4 _3221 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9066, float3(0.0), isnan(_9066)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9066, float3(0.0), isnan(_9066)), level(0.0)).xyzw;
    float _3223 = _3221.x;
    float _3225 = _3221.y;
    float _3227 = _3221.z;
    float _3229 = _3221.w;
    float _3231 = _2847;
    if (!_2793)
    {
        float3 _9089 = float3(_3187, _3157, float(as_type<int>(_3199)));
        float3 _9091 = select(_9089, float3(0.0), isnan(_9089));
        float _3233 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9091.xy, uint(rint(_9091.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9091.xy, uint(rint(_9091.z)), level(0.0)).x;
        _3231 = _3233;
    }
    float _3235 = _3231;
    if (_2793)
    {
        _3213 = 1.0;
    }
    float _3237 = _3213;
    float _3239 = _3237;
    if (!_2793)
    {
        int _3241 = _2833 << 4;
        int _3243 = _3241 + 2048;
        uint _3245 = uint(int(uint(_3243) >> uint(2)));
        uint _3247 = uint(int(uint(int(_3245)) >> uint(2)));
        int _3249 = int(_3245) & 3;
        float _3251 = (*spvDescriptorSet0.vp_c15)._m0[int(_3247)][_3249];
        int _3253 = int(_3245) + 1;
        uint _3255 = uint(int(uint(_3253) >> uint(2)));
        int _3257 = _3253 & 3;
        float _3259 = (*spvDescriptorSet0.vp_c15)._m0[int(_3255)][_3257];
        int _3261 = _3243 + 8;
        uint _3263 = uint(int(uint(_3261) >> uint(2)));
        uint _3265 = uint(int(uint(int(_3263)) >> uint(2)));
        int _3267 = int(_3263) & 3;
        float _3269 = (*spvDescriptorSet0.vp_c15)._m0[int(_3265)][_3267];
        int _3271 = int(_3263) + 1;
        uint _3273 = uint(int(uint(_3271) >> uint(2)));
        int _3275 = _3271 & 3;
        float _3277 = (*spvDescriptorSet0.vp_c15)._m0[int(_3273)][_3275];
        float _3279 = _2221 * _3259;
        float _3281 = fma(_2167, _3251, _3279);
        float _3283 = fma(_2173, _3269, _3281);
        float _3285 = _3283 + _3277;
        float _3287 = precise::clamp(_3285, 0.0, 1.0);
        float _3289 = -_3287;
        float _3291 = _3289 + _3235;
        float _3293 = fma(_3291, 500.0, 1.5);
        float _3295 = exp2(_3293);
        float _3297 = 0.0 + _3295;
        float _3299 = precise::clamp(_3297, 0.0, 1.0);
        _3239 = _3299;
    }
    float _3301 = _3239;
    float _3303 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3305 = _3013 + _3303;
    float _3307 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3309 = _3015 + _3307;
    float _3311 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3313 = _3017 + _3311;
    float _3315 = _3305 * _3305;
    float _3317 = fma(_3309, _3309, _3315);
    float _3319 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3321 = fma(_3313, _3313, _3317);
    float _3323 = rsqrt(_3321);
    float _3325 = sqrt(_3321);
    float _3327 = _3309 * _3323;
    float _3329 = _3313 * _3323;
    float _3331 = _3305 * _3323;
    float _3333 = precise::max(0.0, _3319);
    float _3335 = _3327 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3337 = _3329 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3339 = _3335 * _3335;
    float _3341 = _3337 * _3337;
    float _3343 = -_3331;
    float _3345 = -_3333;
    float _3347 = fma(_3343, (*spvDescriptorSet0.vp_c15)._m0[24].y, _3345);
    float _3349 = _3339 + _3341;
    float _3351 = sqrt(_3349);
    bool _3353 = _3351 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3355 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3357 = _3351 + _3355;
    float _3359 = _3235;
    float _3361 = _3349;
    float _3363 = _3357;
    float _3365 = _3319;
    float _3367 = _3335;
    float _3369 = _3337;
    float _3371 = _3339;
    float _3373 = _3341;
    float _3375 = _3347;
    if (_3353)
    {
        float _3377 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3359 = _3377;
    }
    float _3379 = _3359;
    if (_3353)
    {
        float _3381 = _3347 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3151 = _3381;
    }
    float _3383 = _3151;
    float _3385 = _3383;
    if (_3353)
    {
        float _3387 = rsqrt(_3349);
        _3361 = _3387;
    }
    float _3389 = _3361;
    if (_3353)
    {
        float _3391 = _3357 * _3379;
        _3363 = _3391;
    }
    float _3393 = _3363;
    float _3395 = 0.0;
    if (_3353)
    {
        float _3397 = _3393 * 0.15915493667125701904296875;
        _3395 = _3397;
    }
    float _3399 = _3395;
    float _3401 = _3379;
    if (_3353)
    {
        float _3403 = _3399 * 6.283185482025146484375;
        float _3405 = sin(_3403);
        _3401 = _3405;
    }
    float _3407 = _3401;
    float _3409 = _3393;
    if (_3353)
    {
        float _3411 = _3399 * 6.283185482025146484375;
        float _3413 = cos(_3411);
        _3409 = _3413;
    }
    float _3415 = _3409;
    float _3417 = _3407;
    if (_3353)
    {
        float _3419 = fma(_3407, _3383, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3417 = _3419;
    }
    float _3421 = _3417;
    float _3423 = _3421;
    if (_3353)
    {
        float _3425 = _3389 * _3421;
        _3423 = _3425;
    }
    float _3427 = _3423;
    if (_3353)
    {
        float _3429 = _3415 + (-1.0);
        _3365 = _3429;
    }
    float _3431 = _3365;
    if (_3353)
    {
        float _3433 = _3335 * _3427;
        _3367 = _3433;
    }
    float _3435 = _3367;
    if (_3353)
    {
        float _3437 = _3337 * _3427;
        _3369 = _3437;
    }
    float _3439 = _3369;
    if (_3353)
    {
        float _3441 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3385 = _3441;
    }
    float _3443 = _3385;
    if (_3353)
    {
        float _3445 = _3435 * _3435;
        _3371 = _3445;
    }
    float _3447 = _3371;
    if (_3353)
    {
        float _3449 = _3439 * _3439;
        _3373 = _3449;
    }
    float _3451 = _3373;
    if (_3353)
    {
        float _3453 = fma(_3347, _3415, _3443);
        _3375 = _3453;
    }
    float _3455 = _3375;
    float _3457 = fma(_3455, _3455, _3447);
    float _3459 = _3457 + _3451;
    float _3461 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3463 = fma(_3325, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3461);
    float _3465 = precise::clamp(_3463, 0.0, 1.0);
    float _3467 = -_3465;
    float _3469 = _3467 + 1.0;
    float _3471 = rsqrt(_3459);
    float _3473 = _3471 * _3435;
    float _3475 = _3471 * _3455;
    float _3477 = _3471 * _3439;
    float _3479 = _3473 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3481 = abs(_3469);
    float _3483 = log2(_3481);
    float _3485 = -_3479;
    float _3487 = fma(_3475, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3485);
    float _3489 = -_3477;
    float _3491 = fma(_3489, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3487);
    float _3493 = _3475 + 1.0;
    float _3495 = fma(_3491, -0.5, 0.5);
    float _3497 = fma(_3491, 0.5, 0.5);
    float _3499 = fma(_3497, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3501 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3503 = sqrt(_3495);
    float _3505 = fma(_3497, _3499, -0.212114393711090087890625);
    float _3507 = fma(_3497, _3505, 1.570728778839111328125);
    float _3509 = exp2(_3501);
    float _3511 = _3503 * 0.636619746685028076171875;
    float _3513 = -_3475;
    float _3515 = fma(_3509, _3493, _3513);
    float _3517 = -_3507;
    float _3519 = fma(_3511, _3517, 1.0);
    float _3521 = fma(_3515, 0.5, 0.5);
    float2 _9533 = float2(_3519, _3521);
    float3 _3525 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9533, float2(0.0), isnan(_9533)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9533, float2(0.0), isnan(_9533)), level(0.0)).xyz;
    float _3527 = _3525.x;
    float _3529 = _3525.y;
    float _3531 = _3525.z;
    float _3533 = _2103 * _2155;
    float _3535 = _2083 * 2.0;
    float _3537 = _2071 * 3.883221149444580078125;
    bool _3539 = _2105 != 0.0;
    bool _3541 = isnan(_2105);
    bool _3543 = _3539 || _3541;
    bool _3545 = isnan(0.0);
    bool _3547 = _3543 || _3545;
    float _3549 = -_1891;
    float _3551 = _3549 + _2073;
    float _3553 = -_3535;
    float _3555 = fma(_3533, _3553, _3533);
    float _3557 = _3537 * 0.15915493667125701904296875;
    bool _3559 = _2053 == 0.0;
    bool _3561 = !_3547;
    bool _3563 = _3559 && _3561;
    float _3565 = abs(_2515);
    float _3567 = log2(_3565);
    float _3569 = fma(_2083, 3.1415927410125732421875, _3555);
    float _3571 = fma(_2019, _3551, _1891);
    bool _3573 = _2051 == 0.0;
    bool _3575 = _3573 && _3563;
    float _3577 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3579 = _3569 * 0.15915493667125701904296875;
    float _3581 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3583 = -_2189;
    float _3585 = _3583 + 1.0;
    float _3587 = _3557 * 6.283185482025146484375;
    float _3589 = cos(_3587);
    bool _3591 = _2515 <= 8000.0;
    bool _3593 = isnan(_2515);
    bool _3595 = _3591 || _3593;
    bool _3597 = isnan(8000.0);
    bool _3599 = _3595 || _3597;
    float _3601 = float(_3599);
    float _3603 = fma(_3085, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3581);
    out.m_79.x = _1846;
    out.m_79.y = _1856;
    float _3605 = _3579 * 6.283185482025146484375;
    float _3607 = sin(_3605);
    float _3609 = _3567 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3611 = _3571;
    if (!_3575)
    {
        float _3613 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3571);
        _3611 = _3613;
    }
    float _3615 = _3611;
    out.m_81.x = _3015;
    out.m_81.y = _3013;
    out.m_81.z = _3017;
    float _3617 = -_3615;
    float _3619 = _2617 * _3617;
    float _3621 = _2623 * _3615;
    float _3623 = _3557 * 6.283185482025146484375;
    float _3625 = sin(_3623);
    float _3627 = _2627 * _3615;
    float _3629 = exp2(_3609);
    float _3631 = -_2025;
    float _3633 = fma(_3607, _3589, _3631);
    float _3635 = fma(_2019, _3633, _2025);
    float _3637 = -_2027;
    float _3639 = fma(_3607, _3625, _3637);
    float _3641 = _3635;
    if (!_3575)
    {
        float _3643 = fma(_2053, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3635);
        _3641 = _3643;
    }
    float _3645 = _3641;
    float _3647 = exp2(_3577);
    float _3649 = fma(_2019, _3639, _2027);
    float _3651 = fma(_2659, _3645, _3621);
    float _3653 = fma(_2625, _3645, _3619);
    float _3655 = fma(_2657, _3645, _3627);
    float _3657 = fma(_3629, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3659 = precise::clamp(_3657, 0.0, 1.0);
    float _3661 = _3649;
    if (!_3575)
    {
        float _3663 = fma(_2051, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3649);
        _3661 = _3663;
    }
    float _3665 = _3661;
    float _3667 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3603);
    float _3669 = in.m_83.w;
    float _3671 = fma(_3659, -2.0, 3.0);
    float _3673 = _3659 * _3659;
    float _3675 = fma(_2663, _3665, _3651);
    float _3677 = fma(_2629, _3665, _3653);
    float _3679 = fma(_2691, _3665, _3655);
    float _3681 = _3673 * _3671;
    float _3683 = _3675 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _3685 = _3675 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _3687 = -_3647;
    float _3689 = _3687 + 1.0;
    float _3691 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3667);
    float _3693 = fma(_3677, (*spvDescriptorSet0.vp_c10)._m0[8].x, _3683);
    float _3695 = -_3681;
    float _3697 = _3695 + 1.0;
    float _3699 = fma(_3677, (*spvDescriptorSet0.vp_c10)._m0[9].x, _3685);
    float _3701 = _3689 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3703 = fma(_3679, (*spvDescriptorSet0.vp_c10)._m0[8].z, _3693);
    float _3705 = fma(_3697, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3681);
    float _3707 = _3693;
    if (!_3105)
    {
        _3707 = 1.0;
    }
    float _3709 = _3707;
    float _3711 = _3691 + _3125;
    float _3713 = _3709;
    if (_3105)
    {
        bool _3715 = _3217 >= _3205;
        bool _3717 = isnan(_3217);
        bool _3719 = _3715 || _3717;
        bool _3721 = isnan(_3205);
        bool _3723 = _3719 || _3721;
        float _3725 = float(_3723);
        _3713 = _3725;
    }
    float _3727 = _3713;
    float _3729 = _3601 * _3705;
    float _3731 = _3701 * _3219;
    float _3733 = _3675 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.gl_Position.x = _3143;
    out.gl_Position.y = _3159;
    out.gl_Position.z = _3691;
    out.gl_Position.w = _3125;
    float _3735 = _3729 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3737 = _3727 * _3301;
    float _3739 = _3711 * 0.5;
    float _3741 = fma(_3677, (*spvDescriptorSet0.vp_c10)._m0[10].x, _3733);
    float _3743 = _3585 * _3735;
    float _3745 = precise::clamp(_3743, 0.0, 1.0);
    float _3747 = -_3701;
    float _3749 = _3747 + 1.0;
    out.m_85.w = _3669;
    float _3751 = -_3745;
    float _3753 = fma(_3751, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3755 = fma(_3679, (*spvDescriptorSet0.vp_c10)._m0[9].z, _3699);
    float _3757 = fma(_3679, (*spvDescriptorSet0.vp_c10)._m0[10].z, _3741);
    bool _3759 = _3325 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3761 = isnan(_3325);
    bool _3763 = _3759 || _3761;
    bool _3765 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3767 = _3763 || _3765;
    float _3769 = -_3737;
    float _3771 = fma(_3769, _3753, 1.0);
    float _3773 = precise::clamp(_3771, 0.0, 1.0);
    float _3775 = _3229 * _3731;
    float _3777 = _3229 * _3749;
    out.m_87.x = _3703;
    out.m_87.y = _3755;
    out.m_87.z = _3757;
    float _3779 = _3773 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.z = _3739;
    out.m_89.w = _3125;
    out.m_91.x = _3779;
    float _3781 = _3735;
    float _3783 = _3737;
    float _3785 = _3749;
    float _3787 = _3739;
    float _3789 = _3125;
    float _3791 = _3773;
    if (!_3767)
    {
        _3781 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3793 = _3781;
    float _3795 = _3793;
    float _3797 = _3793;
    if (!_3767)
    {
        _3783 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3799 = _3783;
    float _3801 = _3799;
    float _3803 = _3799;
    if (!_3767)
    {
        _3785 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3805 = _3785;
    float _3807 = _3805;
    float _3809 = _3805;
    if (!_3767)
    {
        _3787 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3811 = _3787;
    float _3813 = _3811;
    float _3815 = _3811;
    if (!_3767)
    {
        _3789 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3817 = _3789;
    float _3819 = _3817;
    float _3821 = _3817;
    if (!_3767)
    {
        _3791 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3823 = _3791;
    float _3825 = _3531 * _3731;
    float _3827 = fma(_3527, _3775, _3223);
    float _3829 = fma(_3529, _3775, _3225);
    float _3831 = fma(_3229, _3825, _3227);
    out.m_93.x = _3827;
    out.m_93.y = _3829;
    out.m_93.z = _3831;
    out.m_93.w = _3777;
    bool _3833 = !_3767;
    float _3835 = _3823;
    float _3837 = _3823;
    if (!_3833)
    {
        bool _3839 = _3325 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3841 = isnan(_3325);
        bool _3843 = _3839 || _3841;
        bool _3845 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3847 = _3843 || _3845;
        if (!_3847)
        {
            float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3851 = _3325 + _3849;
            float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3855 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3853;
            float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3861 = 1.0 / _3855;
            float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3865 = _3863 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3869 = _3867 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3873 = _3871 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3877 = _3875 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3879 = _3851 * _3861;
            float _3881 = precise::clamp(_3879, 0.0, 1.0);
            float _3883 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3885 = _3883 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3887 = fma(_3881, _3859, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3889 = fma(_3881, _3885, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3891 = fma(_3881, _3865, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3893 = fma(_3881, _3869, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3895 = fma(_3881, _3873, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3897 = fma(_3881, _3877, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3821 = _3887;
            _3809 = _3895;
            _3815 = _3891;
            _3803 = _3893;
            _3797 = _3889;
            _3837 = _3897;
            _3899 = true;
        }
        else
        {
            bool _3901 = _3325 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3903 = isnan(_3325);
            bool _3905 = _3901 || _3903;
            bool _3907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3909 = _3905 || _3907;
            if (!_3909)
            {
                _3813 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3911 = _3813;
            _3815 = _3911;
            if (!_3909)
            {
                _3819 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3913 = _3819;
            _3821 = _3913;
            if (!_3909)
            {
                _3795 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3915 = _3795;
            _3797 = _3915;
            if (!_3909)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3917 = _3801;
            _3803 = _3917;
            if (!_3909)
            {
                _3807 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3919 = _3807;
            _3809 = _3919;
            if (!_3909)
            {
                _3835 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3921 = _3835;
            bool _3923 = !_3909;
            _3837 = _3921;
            if (!_3923)
            {
                bool _3925 = _3325 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3927 = isnan(_3325);
                bool _3929 = _3925 || _3927;
                bool _3931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3933 = _3929 || _3931;
                if (!_3933)
                {
                    float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3937 = _3325 + _3935;
                    float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3941 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3939;
                    float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3947 = 1.0 / _3941;
                    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3951 = _3949 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3955 = _3953 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3959 = _3957 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3963 = _3961 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3965 = _3937 * _3947;
                    float _3967 = precise::clamp(_3965, 0.0, 1.0);
                    float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3971 = _3969 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3973 = fma(_3967, _3945, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3975 = fma(_3967, _3971, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3977 = fma(_3967, _3951, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3979 = fma(_3967, _3955, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3981 = fma(_3967, _3959, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3983 = fma(_3967, _3963, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3821 = _3973;
                    _3809 = _3981;
                    _3815 = _3977;
                    _3803 = _3979;
                    _3797 = _3975;
                    _3837 = _3983;
                    _3899 = true;
                }
                else
                {
                    _3821 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3809 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3815 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3797 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3837 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3899 = false;
    float _3985 = _3821;
    float _3987 = _3809;
    float _3989 = _3815;
    float _3991 = _3803;
    float _3993 = _3797;
    float _3995 = _3837;
    float _3997 = fma(_3755, -0.5, 0.5);
    float _3999 = precise::clamp(_3997, 0.0, 1.0);
    float _4001 = -_3985;
    float _4003 = _4001 + _3987;
    float _4005 = -_3989;
    float _4007 = _4005 + _3991;
    float _4009 = -_3993;
    float _4011 = _4009 + _3995;
    bool _4013 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4015 = fma(_3999, _4003, _3985);
    float _4017 = fma(_3999, _4007, _3989);
    float _4019 = fma(_3999, _4011, _3993);
    float _4021 = _4015 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _4023 = fma(_4017, 0.298911988735198974609375, _4021);
    float _4025 = fma(_4019, 0.114477999508380889892578125, _4023);
    out.m_95.x = 0.0;
    float _4027 = -_4025;
    float _4029 = _4017 + _4027;
    float _4031 = -_4025;
    float _4033 = _4015 + _4031;
    float _4035 = -_4025;
    float _4037 = _4019 + _4035;
    float _4039 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4041 = fma(_4029, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4025);
    float _4043 = fma(_4033, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4025);
    float _4045 = fma(_4037, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4025);
    out.m_97.x = 0.0;
    out.m_91.w = _4039;
    out.m_99.x = _4041;
    out.m_99.y = _4043;
    out.m_99.z = _4045;
    if (!_4013)
    {
        return out;
    }
    float _4047 = -_3013;
    float _4049 = _4047 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4051 = -_3015;
    float _4053 = _4051 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4055 = -_3017;
    float _4057 = _4055 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4059 = _4049 * _4049;
    float _4061 = fma(_4053, _4053, _4059);
    float _4063 = fma(_4057, _4057, _4061);
    float _4065 = rsqrt(_4063);
    float _4067 = sqrt(_4063);
    float _4069 = _4049 * _4065;
    float _4071 = _4053 * _4065;
    float _4073 = _4057 * _4065;
    float _4075 = -_3331;
    float _4077 = _4075 + _4069;
    float _4079 = -_3327;
    float _4081 = _4079 + _4071;
    float _4083 = -_3329;
    float _4085 = _4083 + _4073;
    float _4087 = _4077 * _4077;
    float _4089 = -_4067;
    float _4091 = _4089 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4093 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _4095 = precise::clamp(_4093, 0.0, 1.0);
    float _4097 = fma(_4081, _4081, _4087);
    float _4099 = _4091 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4101 = precise::clamp(_4099, 0.0, 1.0);
    float _4103 = _4095 * _4095;
    float _4105 = fma(_4085, _4085, _4097);
    float _4107 = _4103 + (-1.0);
    float _4109 = abs(_4101);
    float _4111 = log2(_4109);
    float _4113 = rsqrt(_4105);
    float _4115 = _4111 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4117 = exp2(_4115);
    float _4119 = _4077 * _4113;
    float _4121 = _4081 * _4113;
    float _4123 = _4085 * _4113;
    float _4125 = _4071 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4127 = _3755 * _4119;
    float _4129 = _3755 * _4069;
    float _4131 = fma(_3703, _4121, _4127);
    float _4133 = fma(_3703, _4071, _4129);
    float _4135 = fma(_3757, _4123, _4131);
    float _4137 = precise::clamp(_4135, 0.0, 1.0);
    float _4139 = fma(_3757, _4073, _4133);
    float _4141 = precise::clamp(_4139, 0.0, 1.0);
    float _4143 = _4137 * _4137;
    float _4145 = fma(_4143, _4107, 1.0);
    float _4147 = -_4069;
    float _4149 = -_4125;
    float _4151 = fma(_4147, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4149);
    float _4153 = _4145 * _4145;
    float _4155 = -_4073;
    float _4157 = fma(_4155, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4151);
    float _4159 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4161 = _4157 + _4159;
    float _4163 = 1.0 / _4153;
    float _4165 = _4161 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4167 = precise::clamp(_4165, 0.0, 1.0);
    float _4169 = _4117 * _4167;
    float _4171 = _4141 * _4169;
    float _4173 = _4171 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4175 = _4103 * _4163;
    float _4177 = _4171 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4179 = _4171 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _4181 = _4171 * _4175;
    out.m_95.x = _4173;
    out.m_95.y = _4177;
    out.m_95.z = _4179;
    float _4183 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4185 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4187 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _4183;
    out.m_97.y = _4185;
    out.m_97.z = _4187;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3899 = false;
    bool _2131 = false;
    bool _1943 = false;
    bool _1395 = false;
    bool _1215 = false;
    bool _997 = false;
    bool _709 = false;
    bool _325 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _119 = in.m_58.w;
    float _121 = trunc(_119);
    int _123 = int(_121);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    float _133 = _131;
    if (!_127)
    {
        out.m_61.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4244 = as_type<float>(_139);
        out.gl_Position.z = _4244;
    }
    if (!_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_63.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_123);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_61.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4314 = as_type<float>(_177);
        out.gl_Position.z = _4314;
    }
    if (_169)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _179 = in.m_65.y;
    float _181 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _183 = in.m_67.w;
    bool _185 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _187 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _189 = _185 || _187;
    bool _191 = isnan(1.0);
    bool _193 = _189 || _191;
    float _195 = in.m_63.x;
    float _197 = in.m_63.y;
    float _199 = in.m_63.z;
    float _201 = in.m_58.x;
    float _203 = in.m_58.y;
    float _205 = in.m_58.z;
    float _207 = 0.0;
    float _209 = _181;
    if (!_193)
    {
        float _211 = _181 * _181;
        float _213 = _211 * 0.5;
        _207 = _213;
    }
    float _215 = _207;
    float _217 = _215;
    if (!_193)
    {
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _217 = _219;
    }
    float _221 = _217;
    out.m_69.y = _179;
    bool _223 = !_193;
    float _225 = _221;
    float _227 = _179;
    if (!_223)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _181 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _181);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _257;
    }
    float _259 = _225;
    bool _261 = !_193;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _181 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _209 = _281;
    }
    float _283 = _209;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _287 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _289 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _291 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _293 = fma(_283, _195, _287);
    float _295 = fma(_283, _197, _289);
    float _297 = fma(_283, _199, _291);
    float _299 = fma(_293, _183, _201);
    float _301 = fma(_295, _183, _203);
    float _303 = fma(_297, _183, _205);
    bool _305 = !_285;
    float _323;
    if (!_305)
    {
        float _307 = in.m_71.x;
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _311 = _307 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        float _327 = float(_123);
        float _329 = 1.0 / _327;
        float _331 = _157 * _329;
        _323 = _331;
    }
    _325 = false;
    float _333 = _323;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _351 = 1.0 / _337;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _361 = 1.0 / _345;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _365 = _333 + _363;
    bool _367 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _369 = isnan(_333);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = 1.0 / _341;
    float _381 = _365 * _351;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _385 = _333 + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _389 = _333 + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _393 = _333 + _391;
    bool _395 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _397 = 1.0 / _349;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _401 = _333 + _399;
    float _403 = _385 * _361;
    bool _405 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _407 = isnan(_333);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = 1.0 / _355;
    float _419 = _401 * _379;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _423 = _333 + _421;
    float _425 = -_415;
    float _427 = _425 + 1.0;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _429;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _433;
    float _437 = 1.0 / _359;
    float _439 = _389 * _397;
    bool _441 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _443 = isnan(_333);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = fma(_435, _381, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _455 = _423 * _417;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _457;
    float _461 = _451 * _427;
    float _463 = -_451;
    float _465 = _463 + 1.0;
    float _467 = fma(_431, _381, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _469 = fma(_459, _381, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _471 = -_377;
    float _473 = _471 + 1.0;
    float _475 = _377 * _465;
    float _477 = _393 * _437;
    bool _479 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _481 = isnan(_333);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _495 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _497 = isnan(_333);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _515 = -_489;
    float _517 = _515 + 1.0;
    bool _519 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _521 = isnan(_333);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = fma(_493, _419, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _533 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _535 = isnan(_333);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = fma(_509, _419, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _547 = fma(_513, _419, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _549 = _505 * _517;
    float _551 = -_505;
    float _553 = _551 + 1.0;
    float _555 = -_543;
    float _557 = _555 + 1.0;
    float _559 = _489 * _473;
    float _561 = _543 * _553;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _567;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _571;
    float _575 = _529 * _557;
    float _577 = fma(_565, _403, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _579 = fma(_569, _403, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _581 = fma(_573, _403, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _583 = _453 * _575;
    float _585 = _469 * _575;
    float _587 = -_529;
    float _589 = _587 + 1.0;
    float _591 = _467 * _575;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _605 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].y, _585);
    float _607 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].x, _591);
    float _609 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[143].z, _583);
    float _611 = fma(_595, _439, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _613 = fma(_599, _439, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _615 = fma(_603, _439, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _617 = fma(_545, _561, _605);
    float _619 = fma(_531, _561, _607);
    float _621 = fma(_547, _561, _609);
    float _623 = fma(_577, _549, _617);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _625;
    float _629 = fma(_579, _549, _619);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _631;
    float _635 = fma(_581, _549, _621);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _637;
    float _641 = fma(_627, _455, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _643 = fma(_611, _559, _629);
    float _645 = fma(_633, _455, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _647 = fma(_613, _559, _623);
    float _649 = fma(_615, _559, _635);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _655 = fma(_639, _455, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _665 = fma(_653, _477, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _667 = fma(_641, _475, _647);
    float _669 = fma(_645, _475, _643);
    float _671 = fma(_659, _477, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _673 = fma(_663, _477, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _675 = fma(_655, _475, _649);
    float _677 = fma(_665, _461, _667);
    float _679 = fma(_671, _461, _669);
    float _681 = fma(_673, _461, _675);
    float _683 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[149].y, _677);
    float _685 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[149].x, _679);
    float _687 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[149].z, _681);
    bool _689 = !_395;
    float _707;
    if (!_689)
    {
        float _691 = in.m_71.x;
        float _693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _695 = _691 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[11].x, _157);
        float _699 = _697 * _693;
        float _701 = floor(_699);
        float _703 = -_701;
        float _705 = _699 + _703;
        _707 = _705;
        _709 = true;
    }
    else
    {
        float _711 = float(_123);
        float _713 = 1.0 / _711;
        float _715 = _157 * _713;
        _707 = _715;
    }
    _709 = false;
    float _717 = _707;
    float _719 = in.m_67.x;
    float _721 = in.m_67.y;
    float _723 = in.m_67.z;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _727 = _717 + _725;
    bool _729 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _731 = isnan(_717);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _741;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _749;
    float _753 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _755 = _753 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _757 = 1.0 / _743;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _761 = _717 + _759;
    bool _763 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _765 = isnan(_717);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    float _775 = 1.0 / _747;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _779 = _717 + _777;
    bool _781 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _783 = 1.0 / _755;
    float _785 = _779 * _757;
    bool _787 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _789 = isnan(_717);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = _687 * _723;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _803 = _717 + _801;
    float _805 = _683 * _721;
    float _807 = -_797;
    float _809 = _807 + 1.0;
    float _811 = 1.0 / _751;
    float _813 = _727 * _775;
    float _815 = _739 * _809;
    float _817 = -_739;
    float _819 = _817 + 1.0;
    bool _821 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _823 = isnan(_717);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = _685 * _719;
    float _835 = _803 * _783;
    bool _837 = _717 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _839 = isnan(_717);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _849;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _857 = -_847;
    float _859 = _857 + 1.0;
    float _861 = _847 * _819;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _865 = _863 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _867 = _761 * _811;
    float _869 = _831 * _859;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _871;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _875;
    float _879 = -_831;
    float _881 = _879 + 1.0;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _885 = _883 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _887 = fma(_873, _785, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _889 = fma(_877, _785, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _891 = _773 * _881;
    float _893 = fma(_851, _785, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _895 = fma(_855, _813, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _897 = fma(_885, _813, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _899 = fma(_865, _813, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _901 = _887 * _891;
    float _903 = _889 * _891;
    float _905 = _893 * _891;
    float _907 = -_773;
    float _909 = _907 + 1.0;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _911;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _917 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _915;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _919;
    float _923 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[107].y, _903);
    float _925 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[107].z, _905);
    float _927 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[107].x, _901);
    float _929 = fma(_913, _867, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _931 = fma(_897, _869, _923);
    float _933 = fma(_899, _869, _925);
    float _935 = fma(_921, _867, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _937 = fma(_895, _869, _927);
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _947 = fma(_917, _867, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _953 = fma(_929, _861, _937);
    float _955 = fma(_941, _835, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _957 = fma(_945, _835, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _959 = fma(_935, _861, _931);
    float _961 = fma(_951, _835, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _963 = fma(_947, _861, _933);
    float _965 = fma(_955, _815, _953);
    float _967 = fma(_957, _815, _959);
    float _969 = fma(_961, _815, _963);
    float _971 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[111].x, _965);
    float _973 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[111].y, _967);
    float _975 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[111].z, _969);
    bool _977 = !_781;
    float _995;
    if (!_977)
    {
        float _979 = in.m_71.x;
        float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _983 = _979 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _985 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[11].y, _157);
        float _987 = _985 * _981;
        float _989 = floor(_987);
        float _991 = -_989;
        float _993 = _987 + _991;
        _995 = _993;
        _997 = true;
    }
    else
    {
        float _999 = float(_123);
        float _1001 = 1.0 / _999;
        float _1003 = _157 * _1001;
        _995 = _1003;
    }
    _997 = false;
    float _1005 = _995;
    float _1007 = _971 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1009 = _973 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1013 = _1011 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1019 = 1.0 / _1013;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1023 = _1021 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1025 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1025;
    bool _1029 = _1005 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1031 = isnan(_1005);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1043 = _1041 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1045 = _1005 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1047 = isnan(_1005);
    bool _1049 = _1045 || _1047;
    bool _1051 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1053 = _1049 || _1051;
    float _1055 = float(_1053);
    float _1057 = _975 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1059 = 1.0 / _1017;
    bool _1061 = _1005 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1063 = isnan(_1005);
    bool _1065 = _1061 || _1063;
    bool _1067 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1069 = _1065 || _1067;
    float _1071 = float(_1069);
    bool _1073 = _1005 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1075 = isnan(_1005);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    bool _1085 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1087 = -_1071;
    float _1089 = _1087 + 1.0;
    float _1091 = 1.0 / _1023;
    float _1093 = _1027 * _1019;
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1097 = _1005 + _1095;
    float _1099 = _1083 * _1089;
    float _1101 = -_1083;
    float _1103 = _1101 + 1.0;
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1107 = _1005 + _1105;
    float _1109 = fma(_1093, _1097, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1111 = -_1039;
    float _1113 = _1111 + 1.0;
    float _1115 = 1.0 / _1043;
    float _1117 = -_1055;
    float _1119 = _1117 + 1.0;
    float _1121 = _1109 * _1099;
    float _1123 = _1071 * _1113;
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1125;
    float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1131 = _1129 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1133 = _1039 * _1119;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1139 = _1127 * _1059;
    float _1141 = _1131 * _1091;
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1145 = _1005 + _1143;
    bool _1147 = _1005 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1149 = isnan(_1005);
    bool _1151 = _1147 || _1149;
    bool _1153 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1155 = _1151 || _1153;
    float _1157 = float(_1155);
    float _1159 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1121);
    float _1161 = fma(_1139, _1107, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1163 = fma(_1141, _1145, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1167 = _1005 + _1165;
    float _1169 = _1137 * _1115;
    float _1171 = -_1157;
    float _1173 = _1171 + 1.0;
    float _1175 = fma(_1163, _1123, _1159);
    float _1177 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1179 = fma(_1169, _1167, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1181 = _1055 * _1173;
    float _1183 = fma(_1161, _1133, _1175);
    float _1185 = fma(_1179, _1181, _1183);
    float _1187 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1189 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1191 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1185);
    float _1193 = _1191 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_73.x = _1177;
    out.m_73.y = _1187;
    out.m_73.z = _1189;
    out.m_73.w = _1193;
    bool _1195 = !_1085;
    float _1213;
    if (!_1195)
    {
        float _1197 = in.m_71.x;
        float _1199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1201 = _1197 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1203 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[11].z, _157);
        float _1205 = _1203 * _1199;
        float _1207 = floor(_1205);
        float _1209 = -_1207;
        float _1211 = _1205 + _1209;
        _1213 = _1211;
        _1215 = true;
    }
    else
    {
        float _1217 = float(_123);
        float _1219 = 1.0 / _1217;
        float _1221 = _157 * _1219;
        _1213 = _1221;
    }
    _1215 = false;
    float _1223 = _1213;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1227 = _1223 + _1225;
    bool _1229 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1231 = isnan(_1223);
    bool _1233 = _1229 || _1231;
    bool _1235 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1237 = _1233 || _1235;
    float _1239 = float(_1237);
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1243 = _1223 + _1241;
    bool _1245 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1247 = isnan(_1223);
    bool _1249 = _1245 || _1247;
    bool _1251 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1253 = _1249 || _1251;
    float _1255 = float(_1253);
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1263 = _1261 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1265 = _1223 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1267 = isnan(_1223);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = 1.0 / _1259;
    bool _1279 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1281 = 1.0 / _1263;
    float _1283 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1283;
    float _1287 = _1227 * _1277;
    float _1289 = -_1239;
    float _1291 = _1289 + 1.0;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1293;
    float _1297 = fma(_1285, _1287, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1299 = _1275 * _1291;
    float _1301 = -_1275;
    float _1303 = _1301 + 1.0;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1307 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1305;
    float _1309 = fma(_1295, _1287, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1311 = _1243 * _1281;
    float _1313 = _1255 * _1303;
    float _1315 = fma(_1307, _1287, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1317 = -_1255;
    float _1319 = _1317 + 1.0;
    float _1321 = _1297 * _1313;
    float _1323 = _1315 * _1313;
    float _1325 = _1309 * _1313;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1329 = _1327 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1337 = _1335 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1339 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1323);
    float _1341 = fma(_1329, _1311, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1343 = fma(_1333, _1311, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1345 = fma(_1337, _1311, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1347 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1321);
    float _1349 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1325);
    float _1351 = fma(_1341, _1299, _1339);
    float _1353 = fma(_1343, _1299, _1347);
    float _1355 = fma(_1345, _1299, _1349);
    float _1357 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1351);
    float _1359 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1353);
    float _1361 = fma(_1239, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1355);
    float _1363 = _1357 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1365 = _1359 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1367 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1369 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1371 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1373 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_75.x = _1369;
    out.m_75.y = _1371;
    out.m_75.z = _1373;
    bool _1375 = !_1279;
    float _1393;
    if (!_1375)
    {
        float _1377 = in.m_71.x;
        float _1379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1381 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[14].x, _157);
        float _1385 = _1383 * _1379;
        float _1387 = floor(_1385);
        float _1389 = -_1387;
        float _1391 = _1385 + _1389;
        _1393 = _1391;
        _1395 = true;
    }
    else
    {
        float _1397 = float(_123);
        float _1399 = 1.0 / _1397;
        float _1401 = _157 * _1399;
        _1393 = _1401;
    }
    _1395 = false;
    float _1403 = _1393;
    int _1405 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _1407 = _1405;
    int _1409 = 0;
    int _1411 = _114(_1407, _1409, (*spvDescriptorSet0.support_buffer));
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1419 = _1417 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1423 = _1421 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1425 = 1.0 / _1415;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1427;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1433 = _1431 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1435 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1437 = isnan(_1403);
    bool _1439 = _1435 || _1437;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1443 = _1439 || _1441;
    float _1445 = float(_1443);
    bool _1447 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1449 = isnan(_1403);
    bool _1451 = _1447 || _1449;
    bool _1453 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1455 = _1451 || _1453;
    float _1457 = float(_1455);
    float _1459 = 1.0 / _1419;
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1463 = _1461 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1465 = -_1445;
    float _1467 = _1465 + 1.0;
    float _1469 = 1.0 / _1423;
    float _1471 = _1429 * _1425;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1475 = _1473 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1483 = _1481 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1485 = 1.0 / _1433;
    bool _1487 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1489 = isnan(_1403);
    bool _1491 = _1487 || _1489;
    bool _1493 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1495 = _1491 || _1493;
    float _1497 = float(_1495);
    float _1499 = _1479 * _1459;
    bool _1501 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1503 = isnan(_1403);
    bool _1505 = _1501 || _1503;
    bool _1507 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1509 = _1505 || _1507;
    float _1511 = float(_1509);
    float _1513 = -_1497;
    float _1515 = _1513 + 1.0;
    float _1517 = _1475 * _1469;
    float _1519 = 1.0 / _1463;
    bool _1521 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1523 = isnan(_1403);
    bool _1525 = _1521 || _1523;
    bool _1527 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1529 = _1525 || _1527;
    float _1531 = float(_1529);
    float _1533 = _1511 * _1515;
    float _1535 = -_1511;
    float _1537 = _1535 + 1.0;
    float _1539 = -_1531;
    float _1541 = _1539 + 1.0;
    float _1543 = _1531 * _1537;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1549;
    float _1553 = _1445 * _1541;
    bool _1555 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1557 = isnan(_1403);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = _1547 * _1485;
    float _1569 = _1457 * _1467;
    float _1571 = -_1457;
    float _1573 = _1571 + 1.0;
    float _1575 = 1.0 / _1483;
    float _1577 = _1551 * _1519;
    bool _1579 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1581 = isnan(_1403);
    bool _1583 = _1579 || _1581;
    bool _1585 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1587 = _1583 || _1585;
    float _1589 = float(_1587);
    float _1591 = _1565 * _1573;
    float _1593 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1595 = _1403 + _1593;
    float _1597 = -_1565;
    float _1599 = _1597 + 1.0;
    float _1601 = fma(_1471, _1595, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1603 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1605 = _1603 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1607 = _1589 * _1599;
    float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1611 = _1609 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1615 = _1403 + _1613;
    float _1617 = -_1589;
    float _1619 = _1617 + 1.0;
    float _1621 = _1601 * _1607;
    float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1625 = _1403 + _1623;
    float _1627 = fma(_1517, _1615, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1629 = 1.0 / _1611;
    float _1631 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1621);
    float _1633 = _1605 * _1575;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1637 = _1403 + _1635;
    float _1639 = fma(_1499, _1625, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1641 = fma(_1627, _1591, _1631);
    float _1643 = in.m_71.x;
    float _1645 = in.m_71.y;
    float _1647 = fma(_1567, _1637, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1651 = _1403 + _1649;
    float _1653 = fma(_1639, _1569, _1641);
    bool _1655 = _1403 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1657 = isnan(_1403);
    bool _1659 = _1655 || _1657;
    bool _1661 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1663 = _1659 || _1661;
    float _1665 = float(_1663);
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1669 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1667;
    float _1671 = fma(_1577, _1651, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1675 = _1403 + _1673;
    float _1677 = fma(_1647, _1553, _1653);
    float _1679 = _1669 * _1629;
    float _1681 = -_1665;
    float _1683 = _1681 + 1.0;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1687 = _1403 + _1685;
    float _1689 = fma(_1633, _1675, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1691 = fma(_1671, _1543, _1677);
    float _1693 = _1497 * _1683;
    float _1695 = fma(_1679, _1687, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1697 = in.m_65.z;
    float _1699 = fma(_1689, _1533, _1691);
    float _1701 = fma(_1695, _1693, _1699);
    float _1703 = -_1643;
    float _1705 = fma(0.5, _1703, 1.0);
    float _1707 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1701);
    float _1709 = _1707 * _1705;
    float _1711 = precise::clamp(_1709, 0.0, 1.0);
    float _1713 = trunc(_1697);
    int _1715 = int(_1713);
    int _1717 = _1411 + (-1);
    float _1719 = float(_1717);
    float _1721 = _1711 * _1719;
    float _1723 = trunc(_1721);
    int _1725 = int(_1723);
    int _1727 = _1725;
    int _1729 = 0;
    int _1731 = _115(_1727, _1729, (*spvDescriptorSet0.support_buffer));
    int _1733 = _1715;
    int _1735 = 0;
    int _1737 = _115(_1733, _1735, (*spvDescriptorSet0.support_buffer));
    float4 _1740 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1731, _1737)), 0).xyzw;
    float _1742 = _1740.x;
    float _1744 = _1740.y;
    float _1746 = _1740.z;
    float _1748 = _1740.w;
    float _1750 = in.m_65.x;
    float _1752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1756 = _1754 != 0;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1760 = _1758 != 0;
    float _1762 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1764 = _1645 > 0.5;
    bool _1766 = _1764 && _1760;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1770 = _1719;
    float _1772 = _1591;
    if (_1756)
    {
        float _1774 = in.m_71.x;
        _1770 = _1774;
    }
    float _1776 = _1770;
    float _1778 = fma(_1645, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1768);
    if (_1766)
    {
        float _1780 = -_179;
        float _1782 = _1780 + 1.0;
        _227 = _1782;
    }
    float _1784 = _227;
    if (_1756)
    {
        _1772 = _1750;
    }
    float _1786 = _1772;
    bool _1788 = _1776 > 0.5;
    bool _1790 = _1788 && _1756;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1794 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1796 = -_1792;
    float _1798 = fma(_1794, 2.0, _1796);
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1802 = _1786;
    float _1804 = _1792;
    if (_1790)
    {
        float _1806 = -_1786;
        float _1808 = _1806 + 1.0;
        _1802 = _1808;
    }
    float _1810 = _1802;
    if (!_1756)
    {
        _1804 = _1750;
    }
    float _1812 = _1804;
    float _1814 = -_157;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1798);
    float _1818 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1800);
    float _1820 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1822 = _1812;
    if (_1756)
    {
        _1822 = _1810;
    }
    float _1824 = _1822;
    float _1826 = _1762 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1828 = fma(_1820, _1784, -0.5);
    float _1830 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1818);
    float _1832 = fma(_1826, _1824, -0.5);
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1836 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1838 = fma(_1830, _1832, _1816);
    int _1840 = _1725 + 1;
    float _1842 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1778);
    float _1844 = fma(_1836, -2.0, _1834);
    float _1846 = _1838 + 0.5;
    int _1848 = min(_1717, _1840);
    float _1850 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1844);
    float _1852 = -_1850;
    float _1854 = fma(_1842, _1828, _1852);
    float _1856 = _1854 + 0.5;
    uint _1859 = as_type<uint>(half2(float2(_1748, 0.0)));
    uint _1861 = extract_bits(_1859, 0u, 8u);
    int _1863 = int(_1861) & 255;
    uint _1865 = extract_bits(_1859, 8u, 8u);
    int _1867 = int(_1865) & 255;
    int _1869 = _1867 << 8;
    int _1871 = _1863 | _1869;
    bool _1873 = _1871 >= 32768;
    int _1875 = _1871 + (-1024);
    int _1877 = _1875;
    if (_1873)
    {
        int _1879 = ~_1871;
        int _1881 = _1879 + 33792;
        int _1883 = _1881 + 1;
        _1877 = _1883;
    }
    int _1885 = _1877;
    int _1887 = _1885 + 30719;
    float _1889 = float(_1887);
    float _1891 = fma(_1889, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1893 = abs(_1891);
    float _1895 = -_1893;
    float _1897 = _1895 + 1.0;
    bool _1899 = _1891 < 0.0;
    float _1901 = float(_1899);
    float _1903 = abs(_1891);
    float _1905 = fma(_1903, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1907 = as_type<int>(_1897) + (-218103808);
    float _1909 = abs(_1891);
    float _1911 = fma(_1909, _1905, -0.212114393711090087890625);
    bool _1913 = uint(_1907) >= 1920991232u;
    float _1915 = abs(_1891);
    float _1917 = fma(_1915, _1911, 1.570728778839111328125);
    bool _1919 = !_1913;
    float _1941;
    if (!_1919)
    {
        int _1921 = as_type<int>(_1897);
        int _1923 = _1717;
        int _1925 = as_type<int>(_1816);
        int _1927 = 9536;
        int _1929;
        int _1931;
        int _1933;
        int _1935;
        int _1937;
        int _1939;
        _112(_1921, _1923, _1925, _1927, _1929, _1931, _1933, _1935, _1937, _1939, out.gl_Position, out.gl_PointSize);
        _1941 = as_type<float>(_1935);
        _1943 = true;
    }
    else
    {
        float _1945 = rsqrt(_1897);
        float _1947 = _1897 * _1945;
        float _1949 = _1945 * 0.5;
        float _1951 = -_1947;
        float _1953 = 0.0 + _1951;
        float _1955 = fma(_1949, _1953, 0.5);
        float _1957 = fma(_1947, _1955, _1947);
        float _1959 = -_1957;
        float _1961 = 0.0 + _1959;
        float _1963 = fma(_1957, _1961, _1897);
        float _1965 = fma(_1949, _1963, _1957);
        _1941 = _1965;
    }
    _1943 = false;
    float _1967 = _1941;
    int _1969 = _1848;
    int _1971 = 0;
    int _1973 = _115(_1969, _1971, (*spvDescriptorSet0.support_buffer));
    int _1975 = _1715;
    int _1977 = 0;
    int _1979 = _115(_1975, _1977, (*spvDescriptorSet0.support_buffer));
    float4 _1981 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1973, _1979)), 0).xyzw;
    float _1983 = _1981.x;
    float _1985 = _1981.y;
    float _1987 = _1981.z;
    float _1989 = _1981.w;
    float _1991 = _1917 * _1967;
    float _1993 = _1901 * 2.0;
    float _1995 = _1889 * 3.883221149444580078125;
    float _1997 = floor(_1721);
    float _1999 = -_1993;
    float _2001 = fma(_1991, _1999, _1991);
    float _2003 = _1995 * 0.15915493667125701904296875;
    float _2005 = fma(_1901, 3.1415927410125732421875, _2001);
    float _2007 = _2003 * 6.283185482025146484375;
    float _2009 = cos(_2007);
    float _2011 = _2005 * 0.15915493667125701904296875;
    float _2013 = _2011 * 6.283185482025146484375;
    float _2015 = sin(_2013);
    float _2017 = -_1997;
    float _2019 = _1721 + _2017;
    float _2021 = _2003 * 6.283185482025146484375;
    float _2023 = sin(_2021);
    float _2025 = _2015 * _2009;
    float _2027 = _2015 * _2023;
    uint _2029 = as_type<uint>(half2(float2(_1989, 0.0)));
    float _2031 = -_1746;
    float _2033 = _2031 + _1987;
    float _2035 = -_1742;
    float _2037 = _2035 + _1983;
    uint _2039 = extract_bits(_2029, 0u, 8u);
    int _2041 = int(_2039) & 255;
    uint _2043 = extract_bits(_2029, 8u, 8u);
    int _2045 = int(_2043) & 255;
    int _2047 = _2045 << 8;
    int _2049 = _2041 | _2047;
    float _2051 = fma(_2019, _2033, _1746);
    float _2053 = fma(_2019, _2037, _1742);
    bool _2055 = _2049 >= 32768;
    int _2057 = _2049 + (-1024);
    int _2059 = _2057;
    if (_2055)
    {
        int _2061 = ~_2049;
        int _2063 = _2061 + 33792;
        int _2065 = _2063 + 1;
        _2059 = _2065;
    }
    int _2067 = _2059;
    int _2069 = _2067 + 30719;
    float _2071 = float(_2069);
    float _2073 = fma(_2071, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _2075 = abs(_2073);
    float _2077 = -_2075;
    float _2079 = _2077 + 1.0;
    bool _2081 = _2073 < 0.0;
    float _2083 = float(_2081);
    float _2085 = abs(_2073);
    float _2087 = fma(_2085, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _2089 = as_type<int>(_2079) + (-218103808);
    float _2091 = abs(_2073);
    float _2093 = fma(_2091, _2087, -0.212114393711090087890625);
    bool _2095 = uint(_2089) >= 1920991232u;
    float _2097 = -_1744;
    float _2099 = _2097 + _1985;
    float _2101 = abs(_2073);
    float _2103 = fma(_2101, _2093, 1.570728778839111328125);
    float _2105 = fma(_2019, _2099, _1744);
    bool _2107 = !_2095;
    float _2129;
    if (!_2107)
    {
        int _2109 = as_type<int>(_2079);
        int _2111 = as_type<int>(_1985);
        int _2113 = as_type<int>(_2079);
        int _2115 = 10448;
        int _2117;
        int _2119;
        int _2121;
        int _2123;
        int _2125;
        int _2127;
        _112(_2109, _2111, _2113, _2115, _2117, _2119, _2121, _2123, _2125, _2127, out.gl_Position, out.gl_PointSize);
        _2129 = as_type<float>(_2123);
        _2131 = true;
    }
    else
    {
        float _2133 = rsqrt(_2079);
        float _2135 = _2079 * _2133;
        float _2137 = _2133 * 0.5;
        float _2139 = -_2135;
        float _2141 = 0.0 + _2139;
        float _2143 = fma(_2137, _2141, 0.5);
        float _2145 = fma(_2135, _2143, _2135);
        float _2147 = -_2145;
        float _2149 = 0.0 + _2147;
        float _2151 = fma(_2145, _2149, _2079);
        float _2153 = fma(_2137, _2151, _2145);
        _2129 = _2153;
    }
    _2131 = false;
    float _2155 = _2129;
    float _2157 = _301 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2159 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2157);
    float _2161 = _301 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2163 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2159);
    float _2165 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2161);
    float _2167 = _2163 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2169 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2165);
    float _2171 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2173 = _2169 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2175 = floor(_2171);
    float _2177 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2179 = floor(_2177);
    float _2181 = -_2175;
    float _2183 = _2171 + _2181;
    float _2185 = -_2179;
    float _2187 = _2177 + _2185;
    float2 _7416 = float2(_2183, _2187);
    float _2189 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7416, float2(0.0), isnan(_7416)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7416, float2(0.0), isnan(_7416)), level(0.0)).x;
    float _2191 = in.m_71.x;
    float _2193 = in.m_71.y;
    float _2195 = in.m_71.z;
    float _2197 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2199 = log2(_2197);
    float _2201 = _301 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2203 = _799 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2205 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2201);
    float _2207 = _805 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2209 = fma(_303, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2205);
    float _2211 = _833 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2213 = _2209 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2215 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _2217 = _2199 * _157;
    float _2219 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2221 = _2213 + _2215;
    float _2223 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2219);
    float _2225 = exp2(_2217);
    float _2227 = _2191 * 2.0;
    float _2229 = _2193 * 2.0;
    float _2231 = _2195 * 2.0;
    float _2233 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2235 = floor(_2227);
    float _2237 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2233);
    float _2239 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2237);
    float _2241 = floor(_2229);
    float _2243 = -_2225;
    float _2245 = _2243 + 1.0;
    float _2247 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _2249 = _2235 > 0.0;
    float _2251 = floor(_2231);
    bool _2253 = _2235 >= 0.0;
    bool _2255 = isnan(_2235);
    bool _2257 = _2253 || _2255;
    bool _2259 = isnan(0.0);
    bool _2261 = _2257 || _2259;
    int _2263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2265 = _2263 != 0;
    int _2267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2269 = _2267 != 0;
    int _2271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2273 = _2271 != 0;
    float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2277 = 1.0 + _2275;
    int _2279 = _2261 ? 0 : 1;
    float _2281 = trunc(_2247);
    int _2283 = int(_2281);
    bool _2285 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2287 = isnan(1.0);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2293 = _2289 || _2291;
    float _2295 = _2195 + _2193;
    bool _2297 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2299 = isnan(0.0);
    bool _2301 = _2297 || _2299;
    bool _2303 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2305 = _2301 || _2303;
    float _2307 = 1.0 / _2277;
    float _2309 = _2295 + (-1.0);
    int _2311 = ~_2279;
    int _2313 = _2311 + 1;
    int _2315 = _2313 + 1;
    int _2317 = _2315;
    int _2319 = 2;
    if (!_2249)
    {
        int _2321 = ~_2279;
        int _2323 = _2321 + 1;
        _2317 = _2323;
    }
    int _2325 = _2317;
    float _2327 = fma(_2309, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2329 = _2305 ? _2245 : 0.0;
    bool _2331 = !_2269;
    int _2333 = _2331 ? 0 : 1;
    bool _2335 = _2241 > 0.0;
    bool _2337 = _2241 >= 0.0;
    bool _2339 = isnan(_2241);
    bool _2341 = _2337 || _2339;
    bool _2343 = isnan(0.0);
    bool _2345 = _2341 || _2343;
    float _2347 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2223);
    int _2349 = abs(_2333);
    float _2351 = in.m_77.x;
    float _2353 = in.m_77.y;
    float _2355 = in.m_77.z;
    if (_2293)
    {
        float _2357 = _2329 * _2307;
        _159 = _2357;
    }
    float _2359 = _159;
    float _2361 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2363 = _2347 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2365 = float(_2349);
    float _2367 = fma(_2167, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2361);
    float _2369 = float(_2325);
    float _2371 = 1.0 / _2363;
    bool _2373 = _2251 > 0.0;
    float _2375 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2367);
    bool _2377 = _2251 >= 0.0;
    bool _2379 = isnan(_2251);
    bool _2381 = _2377 || _2379;
    bool _2383 = isnan(0.0);
    bool _2385 = _2381 || _2383;
    float _2387 = _2365 * _2369;
    bool _2389 = !_2265;
    int _2391 = _2389 ? 0 : 1;
    float _2393 = _2375 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2395 = _2345 ? 0 : 1;
    int _2397 = abs(_2391);
    float _2399 = _2393 + _2363;
    float _2401 = _2387 * (-2.0);
    int _2403 = _2385 ? 0 : 1;
    int _2405 = ~_2395;
    int _2407 = _2405 + 1;
    int _2409 = _2407 + 1;
    int _2411 = _2409;
    if (!_2335)
    {
        int _2413 = ~_2395;
        int _2415 = _2413 + 1;
        _2411 = _2415;
    }
    int _2417 = _2411;
    float _2419 = fma(_2401, _2353, _2353);
    float _2421 = _2193 + (-0.5);
    int _2423 = ~_2403;
    int _2425 = _2423 + 1;
    int _2427 = _2425 + 1;
    float _2429 = fma(_2327, _2401, _2327);
    int _2431 = _2427;
    if (!_2373)
    {
        int _2433 = ~_2403;
        int _2435 = _2433 + 1;
        _2431 = _2435;
    }
    int _2437 = _2431;
    float _2439 = fma(_2421, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2419);
    float _2441 = _2399 * _2371;
    float _2443 = _2441 * 0.5;
    bool _2445 = !_2273;
    int _2447 = _2445 ? 0 : 1;
    float _2449 = _2193 + _2191;
    float _2451 = fma(_2429, _2359, _2439);
    float _2453 = float(_2397);
    float _2455 = _2449 + (-1.0);
    float _2457 = float(_2437);
    float _2459 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2461 = fma(_2443, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2459);
    int _2463 = abs(_2447);
    float _2465 = _2195 + _2191;
    float _2467 = _2453 * _2457;
    float _2469 = float(_2463);
    float _2471 = _2465 + (-1.0);
    float _2473 = float(_2417);
    float _2475 = _2467 * (-2.0);
    float _2477 = 1.0 / _2461;
    float _2479 = fma(_2471, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2481 = _2469 * _2473;
    float _2483 = fma(_2475, _2351, _2351);
    float _2485 = fma(_2455, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2487 = _2191 + (-0.5);
    float _2489 = _2481 * (-2.0);
    float _2491 = _2195 + (-0.5);
    float _2493 = fma(_2485, _2475, _2485);
    float _2495 = fma(_2487, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2483);
    float _2497 = fma(_2489, _2355, _2355);
    float _2499 = fma(_2479, _2489, _2479);
    float _2501 = _2451 * 0.15915493667125701904296875;
    float _2503 = fma(_2493, _2359, _2495);
    float _2505 = fma(_2491, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2497);
    float _2507 = _2501 * 6.283185482025146484375;
    float _2509 = sin(_2507);
    float _2511 = _2503 * 0.15915493667125701904296875;
    float _2513 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2515 = _2477 * _2513;
    float _2517 = fma(_2499, _2359, _2505);
    float _2519 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2521 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2105);
    float _2523 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2053);
    float _2525 = _2517 * 0.15915493667125701904296875;
    bool _2527 = _2515 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2529 = _2511 * 6.283185482025146484375;
    float _2531 = cos(_2529);
    bool _2533 = _2515 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2535 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2519);
    bool _2537 = !_2527;
    int _2539 = _2537 ? 0 : 1;
    float _2541 = _2521 * _2207;
    float _2543 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2051);
    float _2545 = _2523 * _2211;
    int _2547 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2549 = _2283 + _2547;
    int _2551 = _2549 + 1;
    float _2553 = _2501 * 6.283185482025146484375;
    float _2555 = cos(_2553);
    float _2557 = _2543 * _2203;
    int _2559 = _2551;
    if (!_2527)
    {
        _2319 = 1;
    }
    int _2561 = _2319;
    int _2563 = _2561;
    if (!_2533)
    {
        _2563 = _2539;
    }
    int _2565 = _2563;
    float _2567 = fma(_2173, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2535);
    float _2569 = _2511 * 6.283185482025146484375;
    float _2571 = sin(_2569);
    float _2573 = _2531 * _2509;
    int _2575 = _2565 << 6;
    float _2577 = _2567 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2579 = _2551 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2581 = _2575 + 64;
    uint _2583 = uint(int(uint(_2581) >> uint(2)));
    uint _2585 = uint(int(uint(int(_2583)) >> uint(2)));
    int _2587 = int(_2583) & 3;
    float _2589 = (*spvDescriptorSet0.vp_c15)._m0[int(_2585)][_2587];
    int _2591 = int(_2583) + 1;
    uint _2593 = uint(int(uint(_2591) >> uint(2)));
    int _2595 = _2591 & 3;
    float _2597 = (*spvDescriptorSet0.vp_c15)._m0[int(_2593)][_2595];
    bool _2599 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2601 = isnan(0.5);
    bool _2603 = _2599 || _2601;
    bool _2605 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2607 = _2603 || _2605;
    float _2609 = _2525 * 6.283185482025146484375;
    float _2611 = cos(_2609);
    float _2613 = _2531 * _2555;
    float _2615 = _2525 * 6.283185482025146484375;
    float _2617 = sin(_2615);
    float _2619 = _2571 * _2555;
    float _2621 = _2571 * _2509;
    float _2623 = _2531 * _2611;
    float _2625 = _2555 * _2611;
    float _2627 = _2571 * _2611;
    float _2629 = _2509 * _2611;
    float _2631 = _2623 * _2541;
    int _2633 = _2575 + 96;
    uint _2635 = uint(int(uint(_2633) >> uint(2)));
    uint _2637 = uint(int(uint(int(_2635)) >> uint(2)));
    int _2639 = int(_2635) & 3;
    float _2641 = (*spvDescriptorSet0.vp_c15)._m0[int(_2637)][_2639];
    int _2643 = int(_2635) + 1;
    uint _2645 = uint(int(uint(_2643) >> uint(2)));
    int _2647 = _2643 & 3;
    float _2649 = (*spvDescriptorSet0.vp_c15)._m0[int(_2645)][_2647];
    float _2651 = trunc(_2577);
    int _2653 = int(_2651);
    float _2655 = -_2573;
    float _2657 = fma(_2617, _2619, _2655);
    float _2659 = fma(_2617, _2613, _2621);
    float _2661 = -_2619;
    float _2663 = fma(_2617, _2573, _2661);
    float _2665 = -_2541;
    float _2667 = _2617 * _2665;
    float _2669 = _2627 * _2541;
    int _2671 = _2575 + 104;
    uint _2673 = uint(int(uint(_2671) >> uint(2)));
    uint _2675 = uint(int(uint(int(_2673)) >> uint(2)));
    int _2677 = int(_2673) & 3;
    float _2679 = (*spvDescriptorSet0.vp_c15)._m0[int(_2675)][_2677];
    int _2681 = int(_2673) + 1;
    uint _2683 = uint(int(uint(_2681) >> uint(2)));
    int _2685 = _2681 & 3;
    float _2687 = (*spvDescriptorSet0.vp_c15)._m0[int(_2683)][_2685];
    float _2689 = fma(_2659, _2545, _2631);
    float _2691 = fma(_2617, _2621, _2613);
    float _2693 = fma(_2625, _2545, _2667);
    float _2695 = fma(_2657, _2545, _2669);
    float _2697 = fma(_2663, _2557, _2689);
    float _2699 = fma(_2629, _2557, _2693);
    int _2701 = _2575 + 48;
    uint _2703 = uint(int(uint(_2701) >> uint(2)));
    uint _2705 = uint(int(uint(int(_2703)) >> uint(2)));
    int _2707 = int(_2703) & 3;
    float _2709 = (*spvDescriptorSet0.vp_c15)._m0[int(_2705)][_2707];
    int _2711 = int(_2703) + 1;
    uint _2713 = uint(int(uint(_2711) >> uint(2)));
    int _2715 = _2711 & 3;
    float _2717 = (*spvDescriptorSet0.vp_c15)._m0[int(_2713)][_2715];
    float _2719 = _2697 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2721 = fma(_2691, _2557, _2695);
    float _2723 = _2697 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    int _2725 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2727 = _2653 + _2725;
    int _2729 = _2727 + 1;
    float _2731 = fma(_2699, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2719);
    float _2733 = fma(_2699, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2723);
    int _2735 = _2575 + 56;
    uint _2737 = uint(int(uint(_2735) >> uint(2)));
    uint _2739 = uint(int(uint(int(_2737)) >> uint(2)));
    int _2741 = int(_2737) & 3;
    float _2743 = (*spvDescriptorSet0.vp_c15)._m0[int(_2739)][_2741];
    int _2745 = int(_2737) + 1;
    uint _2747 = uint(int(uint(_2745) >> uint(2)));
    int _2749 = _2745 & 3;
    float _2751 = (*spvDescriptorSet0.vp_c15)._m0[int(_2747)][_2749];
    float _2753 = fma(_2721, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2731);
    int _2755 = _2551 | _2729;
    float _2757 = fma(_2721, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2733);
    float _2759 = _2221 * _2597;
    float _2761 = _2173 + _2753;
    bool _2763 = _2755 < 0;
    bool _2765 = _2763 || _2579;
    float _2767 = _2167 + _2757;
    int _2769 = _2575 + 72;
    uint _2771 = uint(int(uint(_2769) >> uint(2)));
    uint _2773 = uint(int(uint(int(_2771)) >> uint(2)));
    int _2775 = int(_2771) & 3;
    float _2777 = (*spvDescriptorSet0.vp_c15)._m0[int(_2773)][_2775];
    int _2779 = int(_2771) + 1;
    uint _2781 = uint(int(uint(_2779) >> uint(2)));
    int _2783 = _2779 & 3;
    float _2785 = (*spvDescriptorSet0.vp_c15)._m0[int(_2781)][_2783];
    float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2789 = _2761 + _2787;
    bool _2791 = _2729 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2793 = _2791 || _2765;
    float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2797 = _2767 + _2795;
    float _2799 = fma(_2167, _2589, _2759);
    float _2801 = _2789 * _2789;
    int _2803 = _2575 + 80;
    uint _2805 = uint(int(uint(_2803) >> uint(2)));
    uint _2807 = uint(int(uint(int(_2805)) >> uint(2)));
    int _2809 = int(_2805) & 3;
    float _2811 = (*spvDescriptorSet0.vp_c15)._m0[int(_2807)][_2809];
    int _2813 = int(_2805) + 1;
    uint _2815 = uint(int(uint(_2813) >> uint(2)));
    int _2817 = _2813 & 3;
    float _2819 = (*spvDescriptorSet0.vp_c15)._m0[int(_2815)][_2817];
    float _2821 = fma(_2797, _2797, _2801);
    float _2823 = sqrt(_2821);
    float _2825 = _2767;
    float _2827 = _2761;
    if (!_2793)
    {
        int _2829 = _2729 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2831 = _2829 + _2551;
        _2559 = _2831;
    }
    int _2833 = _2559;
    float _2835 = _2221 * _2649;
    float _2837 = fma(_2167, _2641, _2835);
    float _2839 = _2697 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2841 = _2697;
    int _2843 = as_type<int>(_2839);
    if (!_2793)
    {
        float _2845 = floor(_2247);
        _2841 = _2845;
    }
    float _2847 = _2841;
    float _2849 = fma(_2173, _2679, _2837);
    float _2851 = fma(_2699, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2839);
    int _2853 = as_type<int>(_2679);
    if (!_2793)
    {
        int _2855 = _2833 << 2;
        _2843 = _2855;
    }
    int _2857 = _2843;
    float _2859 = _2849 + _2687;
    bool _2861 = _2823 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2863 = fma(_2721, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2851);
    int _2865 = _2857;
    float _2867 = _2823;
    if (!_2793)
    {
        uint _2869 = uint(int(uint(_2833) >> uint(2)));
        _2853 = int(_2869);
    }
    int _2871 = _2853;
    float _2873 = _2221 * _2717;
    float _2875 = as_type<float>(_2871);
    if (!_2793)
    {
        int _2877 = 12 & _2857;
        _2865 = _2877;
    }
    int _2879 = _2865;
    float _2881 = 1.0 / _2859;
    float _2883 = _2213 + _2863;
    float _2885 = fma(_2167, _2709, _2873);
    float _2887 = as_type<float>(_2879);
    float _2889 = _2883;
    if (!_2793)
    {
        int _2891 = _2871 << 4;
        int _2893 = _2891 + _2879;
        _2875 = as_type<float>(_2893);
    }
    float _2895 = _2875;
    float _2897 = fma(_2173, _2743, _2885);
    if (!_2861)
    {
        _2887 = _2883;
    }
    float _2899 = _2887;
    float _2901 = _2897 + _2751;
    float _2903 = fma(_2173, _2777, _2799);
    float _2905 = _2903 + _2785;
    bool _2907 = !_2861;
    float _2909 = _2899;
    float _2911 = _2819;
    if (!_2907)
    {
        float _2913 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2917 = _2823 + _2915;
        float _2919 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2921 = rsqrt(_2821);
        float _2923 = _2917 * _2913;
        float _2925 = _2923 * 0.15915493667125701904296875;
        float _2927 = _2925 * 6.283185482025146484375;
        float _2929 = cos(_2927);
        float _2931 = _2925 * 6.283185482025146484375;
        float _2933 = sin(_2931);
        float _2935 = _2929 + (-1.0);
        float _2937 = fma(_2933, _2919, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2939 = _2935 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2941 = _2921 * _2937;
        float _2943 = fma(_2883, _2929, _2939);
        float _2945 = fma(_2797, _2941, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2947 = fma(_2789, _2941, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2825 = _2945;
        _2827 = _2947;
        _2909 = _2943;
        _2867 = _2933;
    }
    float _2949 = _2825;
    float _2951 = _2827;
    float _2953 = _2909;
    float _2955 = _2867;
    float _2957 = _2955;
    float _2959 = _2953;
    if (_2607)
    {
        _2889 = _2949;
    }
    float _2961 = _2889;
    float _2963 = _2961;
    if (_2607)
    {
        _2957 = _2951;
    }
    float _2965 = _2957;
    float _2967 = _2965;
    if (!_2607)
    {
        float _2969 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2971 = _2213 + _2969;
        float _2973 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2975 = _2167 + _2973;
        float _2977 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2979 = -_2173;
        float _2981 = _2979 + _2951;
        float _2983 = _2971 * _2971;
        float _2985 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2987 = _2173 + _2985;
        float _2989 = fma(_2975, _2975, _2983);
        float _2991 = fma(_2987, _2987, _2989);
        float _2993 = -_2213;
        float _2995 = _2993 + _2953;
        float _2997 = sqrt(_2991);
        float _2999 = precise::min(_2997, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3001 = _2999 * _2977;
        float _3003 = -_2167;
        float _3005 = _3003 + _2949;
        float _3007 = fma(_2995, _3001, _2213);
        float _3009 = fma(_3005, _3001, _2167);
        float _3011 = fma(_2981, _3001, _2173);
        _2959 = _3007;
        _2963 = _3009;
        _2967 = _3011;
    }
    float _3013 = _2959;
    float _3015 = _2963;
    float _3017 = _2967;
    float _3019 = _2895;
    if (!_2793)
    {
        int _3021 = as_type<int>(_2895) + 400;
        uint _3023 = uint(int(uint(_3021) >> uint(2)));
        uint _3025 = uint(int(uint(int(_3023)) >> uint(2)));
        int _3027 = int(_3023) & 3;
        float _3029 = (*spvDescriptorSet0.vp_c15)._m0[int(_3025)][_3027];
        _3019 = _3029;
    }
    float _3031 = _3019;
    float _3033 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3035 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3037 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3039 = _2901 * _2881;
    float _3041 = fma(_3015, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3033);
    float _3043 = fma(_3015, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3035);
    float _3045 = fma(_3015, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3037);
    int _3047 = _2575 + 88;
    uint _3049 = uint(int(uint(_3047) >> uint(2)));
    uint _3051 = uint(int(uint(int(_3049)) >> uint(2)));
    int _3053 = int(_3049) & 3;
    float _3055 = (*spvDescriptorSet0.vp_c15)._m0[int(_3051)][_3053];
    int _3057 = int(_3049) + 1;
    uint _3059 = uint(int(uint(_3057) >> uint(2)));
    int _3061 = _3057 & 3;
    float _3063 = (*spvDescriptorSet0.vp_c15)._m0[int(_3059)][_3061];
    float _3065 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3041);
    bool _3067 = _3039 >= 0.0;
    float _3069 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3043);
    float _3071 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3045);
    float _3073 = _3013 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3075 = _3065 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3077 = _2905 * _2881;
    bool _3079 = _3039 <= 1.0;
    bool _3081 = _3079 && _3067;
    float _3083 = _3069 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3085 = _3071 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3087 = fma(_3015, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3073);
    float _3089 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3091 = _3077 >= 0.0;
    bool _3093 = _3091 && _3081;
    float _3095 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3097 = _3083 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3099 = fma(_3017, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3087);
    float _3101 = fma(_3085, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3089);
    bool _3103 = _3077 <= 1.0;
    bool _3105 = _3103 && _3093;
    float _3107 = -_3097;
    float _3109 = fma(_3107, _3095, 1.0);
    float _3111 = _3099 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3113 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3101);
    float _3115 = _2949;
    if (!_2793)
    {
        float _3117 = floor(_2577);
        _3115 = _3117;
    }
    float _3119 = _3115;
    float _3121 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3123 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3125 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3113);
    float _3127 = _2221 * _2819;
    float _3129 = fma(_3085, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3121);
    float _3131 = fma(_3085, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3123);
    float _3133 = log2(_3109);
    if (_3105)
    {
        float _3135 = float(_2565);
        _2911 = _3135;
    }
    float _3137 = _2911;
    float _3139 = fma(_2167, _2811, _3127);
    float _3141 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3129);
    float _3143 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3141);
    float _3145 = 1.0 / _3125;
    float _3147 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3131);
    float _3149 = _3119;
    float _3151 = _3139;
    if (!_2793)
    {
        float _3153 = -_3119;
        float _3155 = _2577 + _3153;
        _3149 = _3155;
    }
    float _3157 = _3149;
    float _3159 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3147);
    float _3161 = _3127;
    if (_3105)
    {
        float _3163 = rint(_3137);
        float _3165 = precise::max(_3163, 0.0);
        uint _3167 = uint(_3165);
        uint _3169 = clamp(_3167, 0u, 65535u);
        _3161 = as_type<float>(_3169);
    }
    float _3171 = _3161;
    float _3173 = _3133 * 0.693147182464599609375;
    float _3175 = fma(_2173, _3055, _3139);
    float _3177 = _3173 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3179 = _3175 + _3063;
    float _3181 = _3173;
    if (!_2793)
    {
        float _3183 = -_2847;
        float _3185 = _2247 + _3183;
        _3181 = _3185;
    }
    float _3187 = _3181;
    float _3189 = _3031;
    if (!_2793)
    {
        float _3191 = rint(_3031);
        float _3193 = precise::max(_3191, 0.0);
        uint _3195 = uint(_3193);
        uint _3197 = clamp(_3195, 0u, 65535u);
        _3189 = as_type<float>(_3197);
    }
    float _3199 = _3189;
    float _3201 = _3143 * _3145;
    float _3203 = _3159 * _3145;
    float _3205 = _3179 * _2881;
    float _3207 = fma(_3201, 0.5, 0.5);
    float _3209 = fma(_3203, -0.5, 0.5);
    float _3211 = _3077;
    float _3213 = _3203;
    if (_3105)
    {
        float3 _9043 = float3(_3039, _3077, float(as_type<int>(_3171)));
        float3 _9047 = select(_9043, float3(0.0), isnan(_9043));
        float _3215 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9047.xy, uint(rint(_9047.z)), _3205, level(0.0));
        _3211 = _3215;
    }
    float _3217 = _3211;
    float3 _9057 = float3(_3207, _3209, _3177);
    float _3219 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9057, float3(0.0), isnan(_9057)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9057, float3(0.0), isnan(_9057)), level(0.0)).x;
    float3 _9066 = float3(_3207, _3209, _3177);
    float4 _3221 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9066, float3(0.0), isnan(_9066)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9066, float3(0.0), isnan(_9066)), level(0.0)).xyzw;
    float _3223 = _3221.x;
    float _3225 = _3221.y;
    float _3227 = _3221.z;
    float _3229 = _3221.w;
    float _3231 = _2847;
    if (!_2793)
    {
        float3 _9089 = float3(_3187, _3157, float(as_type<int>(_3199)));
        float3 _9091 = select(_9089, float3(0.0), isnan(_9089));
        float _3233 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9091.xy, uint(rint(_9091.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9091.xy, uint(rint(_9091.z)), level(0.0)).x;
        _3231 = _3233;
    }
    float _3235 = _3231;
    if (_2793)
    {
        _3213 = 1.0;
    }
    float _3237 = _3213;
    float _3239 = _3237;
    if (!_2793)
    {
        int _3241 = _2833 << 4;
        int _3243 = _3241 + 2048;
        uint _3245 = uint(int(uint(_3243) >> uint(2)));
        uint _3247 = uint(int(uint(int(_3245)) >> uint(2)));
        int _3249 = int(_3245) & 3;
        float _3251 = (*spvDescriptorSet0.vp_c15)._m0[int(_3247)][_3249];
        int _3253 = int(_3245) + 1;
        uint _3255 = uint(int(uint(_3253) >> uint(2)));
        int _3257 = _3253 & 3;
        float _3259 = (*spvDescriptorSet0.vp_c15)._m0[int(_3255)][_3257];
        int _3261 = _3243 + 8;
        uint _3263 = uint(int(uint(_3261) >> uint(2)));
        uint _3265 = uint(int(uint(int(_3263)) >> uint(2)));
        int _3267 = int(_3263) & 3;
        float _3269 = (*spvDescriptorSet0.vp_c15)._m0[int(_3265)][_3267];
        int _3271 = int(_3263) + 1;
        uint _3273 = uint(int(uint(_3271) >> uint(2)));
        int _3275 = _3271 & 3;
        float _3277 = (*spvDescriptorSet0.vp_c15)._m0[int(_3273)][_3275];
        float _3279 = _2221 * _3259;
        float _3281 = fma(_2167, _3251, _3279);
        float _3283 = fma(_2173, _3269, _3281);
        float _3285 = _3283 + _3277;
        float _3287 = precise::clamp(_3285, 0.0, 1.0);
        float _3289 = -_3287;
        float _3291 = _3289 + _3235;
        float _3293 = fma(_3291, 500.0, 1.5);
        float _3295 = exp2(_3293);
        float _3297 = 0.0 + _3295;
        float _3299 = precise::clamp(_3297, 0.0, 1.0);
        _3239 = _3299;
    }
    float _3301 = _3239;
    float _3303 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3305 = _3013 + _3303;
    float _3307 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3309 = _3015 + _3307;
    float _3311 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3313 = _3017 + _3311;
    float _3315 = _3305 * _3305;
    float _3317 = fma(_3309, _3309, _3315);
    float _3319 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3321 = fma(_3313, _3313, _3317);
    float _3323 = rsqrt(_3321);
    float _3325 = sqrt(_3321);
    float _3327 = _3309 * _3323;
    float _3329 = _3313 * _3323;
    float _3331 = _3305 * _3323;
    float _3333 = precise::max(0.0, _3319);
    float _3335 = _3327 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3337 = _3329 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3339 = _3335 * _3335;
    float _3341 = _3337 * _3337;
    float _3343 = -_3331;
    float _3345 = -_3333;
    float _3347 = fma(_3343, (*spvDescriptorSet0.vp_c15)._m0[24].y, _3345);
    float _3349 = _3339 + _3341;
    float _3351 = sqrt(_3349);
    bool _3353 = _3351 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3355 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3357 = _3351 + _3355;
    float _3359 = _3235;
    float _3361 = _3349;
    float _3363 = _3357;
    float _3365 = _3319;
    float _3367 = _3335;
    float _3369 = _3337;
    float _3371 = _3339;
    float _3373 = _3341;
    float _3375 = _3347;
    if (_3353)
    {
        float _3377 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3359 = _3377;
    }
    float _3379 = _3359;
    if (_3353)
    {
        float _3381 = _3347 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3151 = _3381;
    }
    float _3383 = _3151;
    float _3385 = _3383;
    if (_3353)
    {
        float _3387 = rsqrt(_3349);
        _3361 = _3387;
    }
    float _3389 = _3361;
    if (_3353)
    {
        float _3391 = _3357 * _3379;
        _3363 = _3391;
    }
    float _3393 = _3363;
    float _3395 = 0.0;
    if (_3353)
    {
        float _3397 = _3393 * 0.15915493667125701904296875;
        _3395 = _3397;
    }
    float _3399 = _3395;
    float _3401 = _3379;
    if (_3353)
    {
        float _3403 = _3399 * 6.283185482025146484375;
        float _3405 = sin(_3403);
        _3401 = _3405;
    }
    float _3407 = _3401;
    float _3409 = _3393;
    if (_3353)
    {
        float _3411 = _3399 * 6.283185482025146484375;
        float _3413 = cos(_3411);
        _3409 = _3413;
    }
    float _3415 = _3409;
    float _3417 = _3407;
    if (_3353)
    {
        float _3419 = fma(_3407, _3383, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3417 = _3419;
    }
    float _3421 = _3417;
    float _3423 = _3421;
    if (_3353)
    {
        float _3425 = _3389 * _3421;
        _3423 = _3425;
    }
    float _3427 = _3423;
    if (_3353)
    {
        float _3429 = _3415 + (-1.0);
        _3365 = _3429;
    }
    float _3431 = _3365;
    if (_3353)
    {
        float _3433 = _3335 * _3427;
        _3367 = _3433;
    }
    float _3435 = _3367;
    if (_3353)
    {
        float _3437 = _3337 * _3427;
        _3369 = _3437;
    }
    float _3439 = _3369;
    if (_3353)
    {
        float _3441 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3385 = _3441;
    }
    float _3443 = _3385;
    if (_3353)
    {
        float _3445 = _3435 * _3435;
        _3371 = _3445;
    }
    float _3447 = _3371;
    if (_3353)
    {
        float _3449 = _3439 * _3439;
        _3373 = _3449;
    }
    float _3451 = _3373;
    if (_3353)
    {
        float _3453 = fma(_3347, _3415, _3443);
        _3375 = _3453;
    }
    float _3455 = _3375;
    float _3457 = fma(_3455, _3455, _3447);
    float _3459 = _3457 + _3451;
    float _3461 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3463 = fma(_3325, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3461);
    float _3465 = precise::clamp(_3463, 0.0, 1.0);
    float _3467 = -_3465;
    float _3469 = _3467 + 1.0;
    float _3471 = rsqrt(_3459);
    float _3473 = _3471 * _3435;
    float _3475 = _3471 * _3455;
    float _3477 = _3471 * _3439;
    float _3479 = _3473 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3481 = abs(_3469);
    float _3483 = log2(_3481);
    float _3485 = -_3479;
    float _3487 = fma(_3475, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3485);
    float _3489 = -_3477;
    float _3491 = fma(_3489, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3487);
    float _3493 = _3475 + 1.0;
    float _3495 = fma(_3491, -0.5, 0.5);
    float _3497 = fma(_3491, 0.5, 0.5);
    float _3499 = fma(_3497, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3501 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3503 = sqrt(_3495);
    float _3505 = fma(_3497, _3499, -0.212114393711090087890625);
    float _3507 = fma(_3497, _3505, 1.570728778839111328125);
    float _3509 = exp2(_3501);
    float _3511 = _3503 * 0.636619746685028076171875;
    float _3513 = -_3475;
    float _3515 = fma(_3509, _3493, _3513);
    float _3517 = -_3507;
    float _3519 = fma(_3511, _3517, 1.0);
    float _3521 = fma(_3515, 0.5, 0.5);
    float2 _9533 = float2(_3519, _3521);
    float3 _3525 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9533, float2(0.0), isnan(_9533)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9533, float2(0.0), isnan(_9533)), level(0.0)).xyz;
    float _3527 = _3525.x;
    float _3529 = _3525.y;
    float _3531 = _3525.z;
    float _3533 = _2103 * _2155;
    float _3535 = _2083 * 2.0;
    float _3537 = _2071 * 3.883221149444580078125;
    bool _3539 = _2105 != 0.0;
    bool _3541 = isnan(_2105);
    bool _3543 = _3539 || _3541;
    bool _3545 = isnan(0.0);
    bool _3547 = _3543 || _3545;
    float _3549 = -_1891;
    float _3551 = _3549 + _2073;
    float _3553 = -_3535;
    float _3555 = fma(_3533, _3553, _3533);
    float _3557 = _3537 * 0.15915493667125701904296875;
    bool _3559 = _2053 == 0.0;
    bool _3561 = !_3547;
    bool _3563 = _3559 && _3561;
    float _3565 = abs(_2515);
    float _3567 = log2(_3565);
    float _3569 = fma(_2083, 3.1415927410125732421875, _3555);
    float _3571 = fma(_2019, _3551, _1891);
    bool _3573 = _2051 == 0.0;
    bool _3575 = _3573 && _3563;
    float _3577 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3579 = _3569 * 0.15915493667125701904296875;
    float _3581 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3583 = -_2189;
    float _3585 = _3583 + 1.0;
    float _3587 = _3557 * 6.283185482025146484375;
    float _3589 = cos(_3587);
    bool _3591 = _2515 <= 8000.0;
    bool _3593 = isnan(_2515);
    bool _3595 = _3591 || _3593;
    bool _3597 = isnan(8000.0);
    bool _3599 = _3595 || _3597;
    float _3601 = float(_3599);
    float _3603 = fma(_3085, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3581);
    out.m_79.x = _1846;
    out.m_79.y = _1856;
    float _3605 = _3579 * 6.283185482025146484375;
    float _3607 = sin(_3605);
    float _3609 = _3567 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3611 = _3571;
    if (!_3575)
    {
        float _3613 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3571);
        _3611 = _3613;
    }
    float _3615 = _3611;
    out.m_81.x = _3015;
    out.m_81.y = _3013;
    out.m_81.z = _3017;
    float _3617 = -_3615;
    float _3619 = _2617 * _3617;
    float _3621 = _2623 * _3615;
    float _3623 = _3557 * 6.283185482025146484375;
    float _3625 = sin(_3623);
    float _3627 = _2627 * _3615;
    float _3629 = exp2(_3609);
    float _3631 = -_2025;
    float _3633 = fma(_3607, _3589, _3631);
    float _3635 = fma(_2019, _3633, _2025);
    float _3637 = -_2027;
    float _3639 = fma(_3607, _3625, _3637);
    float _3641 = _3635;
    if (!_3575)
    {
        float _3643 = fma(_2053, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3635);
        _3641 = _3643;
    }
    float _3645 = _3641;
    float _3647 = exp2(_3577);
    float _3649 = fma(_2019, _3639, _2027);
    float _3651 = fma(_2659, _3645, _3621);
    float _3653 = fma(_2625, _3645, _3619);
    float _3655 = fma(_2657, _3645, _3627);
    float _3657 = fma(_3629, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3659 = precise::clamp(_3657, 0.0, 1.0);
    float _3661 = _3649;
    if (!_3575)
    {
        float _3663 = fma(_2051, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3649);
        _3661 = _3663;
    }
    float _3665 = _3661;
    float _3667 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3603);
    float _3669 = in.m_83.w;
    float _3671 = fma(_3659, -2.0, 3.0);
    float _3673 = _3659 * _3659;
    float _3675 = fma(_2663, _3665, _3651);
    float _3677 = fma(_2629, _3665, _3653);
    float _3679 = fma(_2691, _3665, _3655);
    float _3681 = _3673 * _3671;
    float _3683 = _3675 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _3685 = _3675 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _3687 = -_3647;
    float _3689 = _3687 + 1.0;
    float _3691 = fma(_3111, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3667);
    float _3693 = fma(_3677, (*spvDescriptorSet0.vp_c10)._m0[8].x, _3683);
    float _3695 = -_3681;
    float _3697 = _3695 + 1.0;
    float _3699 = fma(_3677, (*spvDescriptorSet0.vp_c10)._m0[9].x, _3685);
    float _3701 = _3689 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3703 = fma(_3679, (*spvDescriptorSet0.vp_c10)._m0[8].z, _3693);
    float _3705 = fma(_3697, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3681);
    float _3707 = _3693;
    if (!_3105)
    {
        _3707 = 1.0;
    }
    float _3709 = _3707;
    float _3711 = _3691 + _3125;
    float _3713 = _3709;
    if (_3105)
    {
        bool _3715 = _3217 >= _3205;
        bool _3717 = isnan(_3217);
        bool _3719 = _3715 || _3717;
        bool _3721 = isnan(_3205);
        bool _3723 = _3719 || _3721;
        float _3725 = float(_3723);
        _3713 = _3725;
    }
    float _3727 = _3713;
    float _3729 = _3601 * _3705;
    float _3731 = _3701 * _3219;
    float _3733 = _3675 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.gl_Position.x = _3143;
    out.gl_Position.y = _3159;
    out.gl_Position.z = _3691;
    out.gl_Position.w = _3125;
    float _3735 = _3729 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3737 = _3727 * _3301;
    float _3739 = _3711 * 0.5;
    float _3741 = fma(_3677, (*spvDescriptorSet0.vp_c10)._m0[10].x, _3733);
    float _3743 = _3585 * _3735;
    float _3745 = precise::clamp(_3743, 0.0, 1.0);
    float _3747 = -_3701;
    float _3749 = _3747 + 1.0;
    out.m_85.w = _3669;
    float _3751 = -_3745;
    float _3753 = fma(_3751, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3755 = fma(_3679, (*spvDescriptorSet0.vp_c10)._m0[9].z, _3699);
    float _3757 = fma(_3679, (*spvDescriptorSet0.vp_c10)._m0[10].z, _3741);
    bool _3759 = _3325 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3761 = isnan(_3325);
    bool _3763 = _3759 || _3761;
    bool _3765 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3767 = _3763 || _3765;
    float _3769 = -_3737;
    float _3771 = fma(_3769, _3753, 1.0);
    float _3773 = precise::clamp(_3771, 0.0, 1.0);
    float _3775 = _3229 * _3731;
    float _3777 = _3229 * _3749;
    out.m_87.x = _3703;
    out.m_87.y = _3755;
    out.m_87.z = _3757;
    float _3779 = _3773 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.z = _3739;
    out.m_89.w = _3125;
    out.m_91.x = _3779;
    float _3781 = _3735;
    float _3783 = _3737;
    float _3785 = _3749;
    float _3787 = _3739;
    float _3789 = _3125;
    float _3791 = _3773;
    if (!_3767)
    {
        _3781 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3793 = _3781;
    float _3795 = _3793;
    float _3797 = _3793;
    if (!_3767)
    {
        _3783 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3799 = _3783;
    float _3801 = _3799;
    float _3803 = _3799;
    if (!_3767)
    {
        _3785 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3805 = _3785;
    float _3807 = _3805;
    float _3809 = _3805;
    if (!_3767)
    {
        _3787 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3811 = _3787;
    float _3813 = _3811;
    float _3815 = _3811;
    if (!_3767)
    {
        _3789 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3817 = _3789;
    float _3819 = _3817;
    float _3821 = _3817;
    if (!_3767)
    {
        _3791 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3823 = _3791;
    float _3825 = _3531 * _3731;
    float _3827 = fma(_3527, _3775, _3223);
    float _3829 = fma(_3529, _3775, _3225);
    float _3831 = fma(_3229, _3825, _3227);
    out.m_93.x = _3827;
    out.m_93.y = _3829;
    out.m_93.z = _3831;
    out.m_93.w = _3777;
    bool _3833 = !_3767;
    float _3835 = _3823;
    float _3837 = _3823;
    if (!_3833)
    {
        bool _3839 = _3325 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3841 = isnan(_3325);
        bool _3843 = _3839 || _3841;
        bool _3845 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3847 = _3843 || _3845;
        if (!_3847)
        {
            float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3851 = _3325 + _3849;
            float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3855 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3853;
            float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3861 = 1.0 / _3855;
            float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3865 = _3863 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3869 = _3867 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3873 = _3871 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3877 = _3875 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3879 = _3851 * _3861;
            float _3881 = precise::clamp(_3879, 0.0, 1.0);
            float _3883 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3885 = _3883 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3887 = fma(_3881, _3859, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3889 = fma(_3881, _3885, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3891 = fma(_3881, _3865, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3893 = fma(_3881, _3869, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3895 = fma(_3881, _3873, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3897 = fma(_3881, _3877, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3821 = _3887;
            _3809 = _3895;
            _3815 = _3891;
            _3803 = _3893;
            _3797 = _3889;
            _3837 = _3897;
            _3899 = true;
        }
        else
        {
            bool _3901 = _3325 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3903 = isnan(_3325);
            bool _3905 = _3901 || _3903;
            bool _3907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3909 = _3905 || _3907;
            if (!_3909)
            {
                _3813 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3911 = _3813;
            _3815 = _3911;
            if (!_3909)
            {
                _3819 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3913 = _3819;
            _3821 = _3913;
            if (!_3909)
            {
                _3795 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3915 = _3795;
            _3797 = _3915;
            if (!_3909)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3917 = _3801;
            _3803 = _3917;
            if (!_3909)
            {
                _3807 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3919 = _3807;
            _3809 = _3919;
            if (!_3909)
            {
                _3835 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3921 = _3835;
            bool _3923 = !_3909;
            _3837 = _3921;
            if (!_3923)
            {
                bool _3925 = _3325 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3927 = isnan(_3325);
                bool _3929 = _3925 || _3927;
                bool _3931 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3933 = _3929 || _3931;
                if (!_3933)
                {
                    float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3937 = _3325 + _3935;
                    float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3941 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3939;
                    float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3947 = 1.0 / _3941;
                    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3951 = _3949 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3955 = _3953 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3959 = _3957 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3963 = _3961 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3965 = _3937 * _3947;
                    float _3967 = precise::clamp(_3965, 0.0, 1.0);
                    float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3971 = _3969 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3973 = fma(_3967, _3945, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3975 = fma(_3967, _3971, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3977 = fma(_3967, _3951, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3979 = fma(_3967, _3955, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3981 = fma(_3967, _3959, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3983 = fma(_3967, _3963, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3821 = _3973;
                    _3809 = _3981;
                    _3815 = _3977;
                    _3803 = _3979;
                    _3797 = _3975;
                    _3837 = _3983;
                    _3899 = true;
                }
                else
                {
                    _3821 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3809 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3815 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3797 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3837 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3899 = false;
    float _3985 = _3821;
    float _3987 = _3809;
    float _3989 = _3815;
    float _3991 = _3803;
    float _3993 = _3797;
    float _3995 = _3837;
    float _3997 = fma(_3755, -0.5, 0.5);
    float _3999 = precise::clamp(_3997, 0.0, 1.0);
    float _4001 = -_3985;
    float _4003 = _4001 + _3987;
    float _4005 = -_3989;
    float _4007 = _4005 + _3991;
    float _4009 = -_3993;
    float _4011 = _4009 + _3995;
    bool _4013 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4015 = fma(_3999, _4003, _3985);
    float _4017 = fma(_3999, _4007, _3989);
    float _4019 = fma(_3999, _4011, _3993);
    float _4021 = _4015 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _4023 = fma(_4017, 0.298911988735198974609375, _4021);
    float _4025 = fma(_4019, 0.114477999508380889892578125, _4023);
    out.m_95.x = 0.0;
    float _4027 = -_4025;
    float _4029 = _4017 + _4027;
    float _4031 = -_4025;
    float _4033 = _4015 + _4031;
    float _4035 = -_4025;
    float _4037 = _4019 + _4035;
    float _4039 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4041 = fma(_4029, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4025);
    float _4043 = fma(_4033, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4025);
    float _4045 = fma(_4037, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4025);
    out.m_97.x = 0.0;
    out.m_91.w = _4039;
    out.m_99.x = _4041;
    out.m_99.y = _4043;
    out.m_99.z = _4045;
    if (!_4013)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4047 = -_3013;
    float _4049 = _4047 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4051 = -_3015;
    float _4053 = _4051 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4055 = -_3017;
    float _4057 = _4055 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4059 = _4049 * _4049;
    float _4061 = fma(_4053, _4053, _4059);
    float _4063 = fma(_4057, _4057, _4061);
    float _4065 = rsqrt(_4063);
    float _4067 = sqrt(_4063);
    float _4069 = _4049 * _4065;
    float _4071 = _4053 * _4065;
    float _4073 = _4057 * _4065;
    float _4075 = -_3331;
    float _4077 = _4075 + _4069;
    float _4079 = -_3327;
    float _4081 = _4079 + _4071;
    float _4083 = -_3329;
    float _4085 = _4083 + _4073;
    float _4087 = _4077 * _4077;
    float _4089 = -_4067;
    float _4091 = _4089 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4093 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _4095 = precise::clamp(_4093, 0.0, 1.0);
    float _4097 = fma(_4081, _4081, _4087);
    float _4099 = _4091 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4101 = precise::clamp(_4099, 0.0, 1.0);
    float _4103 = _4095 * _4095;
    float _4105 = fma(_4085, _4085, _4097);
    float _4107 = _4103 + (-1.0);
    float _4109 = abs(_4101);
    float _4111 = log2(_4109);
    float _4113 = rsqrt(_4105);
    float _4115 = _4111 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4117 = exp2(_4115);
    float _4119 = _4077 * _4113;
    float _4121 = _4081 * _4113;
    float _4123 = _4085 * _4113;
    float _4125 = _4071 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4127 = _3755 * _4119;
    float _4129 = _3755 * _4069;
    float _4131 = fma(_3703, _4121, _4127);
    float _4133 = fma(_3703, _4071, _4129);
    float _4135 = fma(_3757, _4123, _4131);
    float _4137 = precise::clamp(_4135, 0.0, 1.0);
    float _4139 = fma(_3757, _4073, _4133);
    float _4141 = precise::clamp(_4139, 0.0, 1.0);
    float _4143 = _4137 * _4137;
    float _4145 = fma(_4143, _4107, 1.0);
    float _4147 = -_4069;
    float _4149 = -_4125;
    float _4151 = fma(_4147, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4149);
    float _4153 = _4145 * _4145;
    float _4155 = -_4073;
    float _4157 = fma(_4155, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4151);
    float _4159 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4161 = _4157 + _4159;
    float _4163 = 1.0 / _4153;
    float _4165 = _4161 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4167 = precise::clamp(_4165, 0.0, 1.0);
    float _4169 = _4117 * _4167;
    float _4171 = _4141 * _4169;
    float _4173 = _4171 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4175 = _4103 * _4163;
    float _4177 = _4171 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4179 = _4171 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _4181 = _4171 * _4175;
    out.m_95.x = _4173;
    out.m_95.y = _4177;
    out.m_95.z = _4179;
    float _4183 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4185 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4187 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _4183;
    out.m_97.y = _4185;
    out.m_97.z = _4187;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

