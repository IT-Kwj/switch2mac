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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = gl_FragCoord.y;
    float _45 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _47 = _43 / _45;
    float _49 = gl_FragCoord.x;
    float _51 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _53 = _49 / _51;
    float _55 = 1.0 / _41;
    float _57 = _47 * _55;
    float _59 = _53 * _55;
    float _61 = _57 * 0.00390625;
    float _63 = _59 * 0.00390625;
    float2 _303 = float2(_63, _61);
    float2 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_303, float2(0.0), isnan(_303)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_303, float2(0.0), isnan(_303)), level(0.0)).xy;
    float _69 = _67.x;
    float _71 = _67.y;
    float2 _318 = float2(_69, _71);
    float2 _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_318, float2(0.0), isnan(_318)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_318, float2(0.0), isnan(_318)), level(0.0)).xy;
    float _75 = _73.x;
    float _77 = _73.y;
    bool _81 = 0 < as_type<int>((*spvDescriptorSet0.fp_c4)._m0[0].x);
    float _83 = _75 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _85 = _77 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _87 = !_81;
    int _90 = as_type<int>(_83);
    int _92 = as_type<int>(_85);
    float _94 = _85;
    float _96 = _83;
    if (!_87)
    {
        int _98 = 0;
        bool _100;
        do
        {
            int _102 = _98;
            int _104 = _90;
            int _106 = _92;
            int _108 = _102 * 48;
            int _110 = _102 + 1;
            int _112 = _108 + 24;
            uint _115 = uint(int(uint(_112) >> uint(2)));
            uint _117 = uint(int(uint(int(_115)) >> uint(2)));
            int _119 = int(_115) & 3;
            float _121 = (*spvDescriptorSet0.fp_c4)._m0[int(_117)][_119];
            int _123 = int(_115) + 1;
            uint _125 = uint(int(uint(_123) >> uint(2)));
            int _127 = _123 & 3;
            float _129 = (*spvDescriptorSet0.fp_c4)._m0[int(_125)][_127];
            bool _131 = _110 >= as_type<int>((*spvDescriptorSet0.fp_c4)._m0[0].x);
            int _133 = _108 + 16;
            uint _135 = uint(int(uint(_133) >> uint(2)));
            uint _137 = uint(int(uint(int(_135)) >> uint(2)));
            int _139 = int(_135) & 3;
            float _141 = (*spvDescriptorSet0.fp_c4)._m0[int(_137)][_139];
            int _143 = int(_135) + 1;
            uint _145 = uint(int(uint(_143) >> uint(2)));
            int _147 = _143 & 3;
            float _149 = (*spvDescriptorSet0.fp_c4)._m0[int(_145)][_147];
            float _151 = _129 * 5.0;
            float _153 = _121 * 5.0;
            float _155 = _151 * _151;
            float _157 = fma(_153, _153, _155);
            float _159 = -_149;
            float _161 = _159 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _163 = -_141;
            float _165 = _163 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
            float _167 = rsqrt(_157);
            float _169 = _57 + _161;
            float _171 = _59 + _165;
            float _173 = sqrt(_157);
            float _175 = _151 * _167;
            float _177 = _153 * _167;
            float _179 = _175 * _169;
            float _181 = fma(_177, _171, _179);
            float _183 = -_175;
            float _185 = fma(_183, _181, _169);
            bool _187 = _181 >= _173;
            bool _189 = isnan(_181);
            bool _191 = _187 || _189;
            bool _193 = isnan(_173);
            bool _195 = _191 || _193;
            float _197 = -_177;
            float _199 = fma(_197, _181, _171);
            float _201 = _185 * _185;
            bool _203 = _181 > 0.0;
            bool _205 = !_195;
            bool _207 = _203 && _205;
            float _209 = fma(_199, _199, _201);
            _98 = _110;
            float _211 = _157;
            if (_207)
            {
                int _213 = _108 + 44;
                uint _215 = uint(int(uint(_213) >> uint(2)));
                uint _217 = uint(int(uint(int(_215)) >> uint(2)));
                int _219 = int(_215) & 3;
                float _221 = (*spvDescriptorSet0.fp_c4)._m0[int(_217)][_219];
                _211 = _221;
            }
            float _223 = _211;
            float _225 = _209;
            if (_207)
            {
                float _227 = sqrt(_209);
                _225 = _227;
            }
            float _229 = _225;
            bool _231 = _229 < _223;
            bool _233 = _231 && _207;
            bool _235 = !_233;
            int _237 = _235 ? _104 : as_type<int>(_121);
            bool _239 = !_233;
            int _241 = _239 ? _106 : as_type<int>(_129);
            _100 = !_131;
            _90 = _237;
            _92 = _241;
            _94 = as_type<float>(_241);
            _96 = as_type<float>(_237);
        } while (_100);
    }
    float _243 = _94;
    float _245 = _96;
    float _247 = _243 * _243;
    float _249 = fma(_245, _245, _247);
    float _251 = sqrt(_249);
    float _253 = spvFAdd(_251, 9.9999997473787516355514526367188e-06);
    float _255 = 1.0 / _253;
    float _257 = precise::min(_253, 10.0);
    float _259 = _257 * _255;
    float _261 = _245 * _259;
    float _263 = _243 * _259;
    out.m_34.x = _261;
    out.m_34.y = _263;
    return out;
}

