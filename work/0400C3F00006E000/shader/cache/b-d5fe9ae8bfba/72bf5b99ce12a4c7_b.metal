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
    constant _16* fp_c3 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texturecube<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_36 [[user(locn1), center_no_perspective]];
};

static inline __attribute__((always_inline))
void _47(thread const int& _726, thread const int& _727, thread const int& _728, thread const int& _729, thread int& _730, thread int& _731, thread int& _732, thread int& _733, thread int& _734, thread int& _735)
{
    float _738 = as_type<float>(_727) + 0.0;
    bool _740 = _738 != 0.0;
    bool _742 = isnan(_738);
    bool _744 = _740 || _742;
    bool _746 = isnan(0.0);
    bool _748 = _744 || _746;
    int _750 = as_type<int>(_738);
    int _752 = _727;
    int _754 = _729;
    int _756 = _748 ? (-1) : 0;
    if (!_748)
    {
        float _758 = as_type<float>(_727) * 1.0;
        _750 = as_type<int>(_758);
    }
    int _760 = _750;
    bool _762 = !_748;
    int _764 = _760;
    if (!_762)
    {
        float _766 = as_type<float>(_727) + 0.0;
        bool _768 = _766 >= 0.0;
        bool _770 = isnan(_766);
        bool _772 = _768 || _770;
        bool _774 = isnan(0.0);
        bool _776 = _772 || _774;
        int _778 = as_type<int>(_766);
        _756 = _776 ? (-1) : 0;
        if (!_776)
        {
            _778 = 2147483647;
        }
        int _780 = _778;
        bool _782 = !_776;
        _764 = _780;
        if (!_782)
        {
            float _784 = abs(as_type<float>(_727));
            float _786 = _784 + 0.0;
            bool _788 = _786 > as_type<float>(0x7f800000u /* inf */);
            bool _790 = isnan(_786);
            bool _792 = _788 || _790;
            bool _794 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _796 = _792 || _794;
            int _798 = as_type<int>(_786);
            _756 = _796 ? (-1) : 0;
            if (_796)
            {
                float _800 = as_type<float>(_727) + 1.0;
                _798 = as_type<int>(_800);
            }
            int _802 = _798;
            _764 = _802;
            if (!_796)
            {
                float _804 = abs(as_type<float>(_727));
                float _806 = _804 + (-0.0);
                float _808 = 0.0 + _806;
                bool _810 = _808 != as_type<float>(0x7f800000u /* inf */);
                bool _812 = isnan(_808);
                bool _814 = _810 || _812;
                bool _816 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _818 = _814 || _816;
                int _820 = as_type<int>(_808);
                _756 = _818 ? (-1) : 0;
                if (!_818)
                {
                    _820 = _727;
                }
                int _822 = _820;
                bool _824 = !_818;
                _764 = _822;
                if (!_824)
                {
                    float _826 = as_type<float>(_727) * 18446744073709551616.0;
                    float _828 = rsqrt(_826);
                    float _830 = _826 * _828;
                    float _832 = _828 * 0.5;
                    float _834 = -_830;
                    float _836 = 0.0 + _834;
                    float _838 = fma(_832, _836, 0.5);
                    float _840 = fma(_830, _838, _830);
                    float _842 = -_840;
                    float _844 = 0.0 + _842;
                    float _846 = fma(_840, _844, _826);
                    float _848 = fma(_832, _846, _840);
                    float _850 = _848 * 2.3283064365386962890625e-10;
                    _764 = as_type<int>(_850);
                    _752 = as_type<int>(_826);
                    _754 = as_type<int>(_836);
                }
            }
        }
    }
    int _852 = _764;
    int _854 = _752;
    int _856 = _754;
    int _858 = _756;
    _730 = _852;
    _731 = _728;
    _732 = 0;
    _733 = _854;
    _734 = _856;
    _735 = _858;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _235 = false;
    float _51 = in.m_36.x;
    float _53 = in.m_36.y;
    float2 _326 = float2(_51, _53);
    float _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_326, float2(0.0), isnan(_326))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_326, float2(0.0), isnan(_326))).x;
    float2 _337 = float2(_51, _53);
    float3 _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_337, float2(0.0), isnan(_337))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_337, float2(0.0), isnan(_337))).xyz;
    float _61 = _59.x;
    float _63 = _59.y;
    float _65 = _59.z;
    float _67 = in.m_38.y;
    float _69 = in.m_38.x;
    float _71 = in.m_38.z;
    float _73 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _75 = -_73;
    float _77 = _67 * _75;
    float _79 = -_73;
    float _81 = _69 * _79;
    float _83 = -_73;
    float _85 = -(*spvDescriptorSet0.fp_c4)._m0[3].z;
    float _87 = fma(_71, _83, _85);
    float _89 = -(*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _91 = _77 + _89;
    float _93 = -(*spvDescriptorSet0.fp_c4)._m0[3].x;
    float _95 = _81 + _93;
    float _97 = _77 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _99 = _91 * _91;
    float _101 = _77 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _103 = _77 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _105 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[8].x, _97);
    float _107 = fma(_95, _95, _99);
    float _109 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[7].x, _101);
    float _111 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[9].x, _103);
    float _113 = -_73;
    float _115 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[8].z, _105);
    float _117 = fma(_87, _87, _107);
    float _119 = -_73;
    float _121 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[7].z, _109);
    float _123 = -_73;
    float _125 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[9].z, _111);
    float _127 = fma(_63, 2.0, -1.0);
    float _129 = sqrt(_117);
    float _131 = fma(_61, 2.0, -1.0);
    float _133 = _127 * _91;
    float _135 = fma(_65, 2.0, -1.0);
    float _137 = _115 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _139 = fma(_131, _95, _133);
    float _141 = rsqrt(_117);
    float _143 = -(*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _145 = _137 + _143;
    float _147 = fma(_135, _87, _139);
    float _149 = -_129;
    float _151 = fma(_149, (*spvDescriptorSet0.fp_c4)._m0[1].w, 1.0);
    float _153 = precise::clamp(_151, 0.0, 1.0);
    float _155 = _121 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _157 = _125 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _159 = _145 * _145;
    float _161 = -(*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _163 = _155 + _161;
    float _165 = abs(_153);
    float _167 = log2(_165);
    float _169 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _171 = _157 + _169;
    float _173 = -_141;
    float _175 = fma(_173, _147, 0.0);
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = fma(_163, _163, _159);
    float _181 = _177 + 0.001000000047497451305389404296875;
    float _183 = fma(_171, _171, _179);
    float _185 = abs(_181);
    float _187 = -_185;
    float _189 = _187 + 1.0;
    float _191 = sqrt(_183);
    float _193 = fma(_181, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _195 = as_type<int>(_189) + (-218103808);
    float _197 = _167 * (*spvDescriptorSet0.fp_c4)._m0[3].w;
    float _199 = fma(_181, _193, -0.212114393711090087890625);
    bool _203 = uint(_195) >= 1920991232u;
    float _205 = exp2(_197);
    float _207 = fma(_181, _199, 1.570728778839111328125);
    float _209 = _191 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    bool _211 = !_203;
    float _233;
    if (!_211)
    {
        int _213 = as_type<int>(_199);
        int _215 = as_type<int>(_189);
        int _217 = 1056;
        int _219 = as_type<int>(_117);
        int _221;
        int _223;
        int _225;
        int _227;
        int _229;
        int _231;
        _47(_213, _215, _217, _219, _221, _223, _225, _227, _229, _231);
        _233 = as_type<float>(_221);
        _235 = true;
    }
    else
    {
        float _237 = rsqrt(_189);
        float _239 = _189 * _237;
        float _241 = _237 * 0.5;
        float _243 = -_239;
        float _245 = 0.0 + _243;
        float _247 = fma(_241, _245, 0.5);
        float _249 = fma(_239, _247, _239);
        float _251 = -_249;
        float _253 = 0.0 + _251;
        float _255 = fma(_249, _253, _189);
        float _257 = fma(_241, _255, _249);
        _233 = _257;
    }
    _235 = false;
    float _259 = _233;
    float _261 = _207 * _259;
    float _263 = abs(_163);
    float _265 = abs(_145);
    float _267 = precise::max(_263, _265);
    float _269 = _261 * 0.15915493667125701904296875;
    float _271 = abs(_171);
    float _273 = precise::max(_271, _267);
    float _275 = _269 * 6.283185482025146484375;
    float _277 = cos(_275);
    float _279 = _269 * 6.283185482025146484375;
    float _281 = sin(_279);
    float _283 = 1.0 / _277;
    float _285 = 1.0 / _273;
    float _287 = _281 * _283;
    float _289 = _287 * (*spvDescriptorSet0.fp_c4)._m0[5].z;
    float _291 = _163 * _285;
    float _293 = precise::max(_289, 0.001000000047497451305389404296875);
    float _295 = _145 * _285;
    float _297 = _171 * _285;
    float _299 = -_209;
    float _301 = fma(_299, _293, _209);
    float3 _694 = float3(_291, _295, _297);
    float _303 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_694, float3(0.0), isnan(_694)), _301);
    float _305 = _205 * _303;
    float _307 = _177 * _305;
    float _309 = _307 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _311 = _307 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _313 = _307 * (*spvDescriptorSet0.fp_c4)._m0[1].z;
    out.m_41.x = _309;
    out.m_41.y = _311;
    out.m_41.z = _313;
    return out;
}

