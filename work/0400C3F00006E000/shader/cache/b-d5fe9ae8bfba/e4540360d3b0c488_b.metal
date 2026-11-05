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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    constant _16* fp_c5 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture3d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _147 = false;
    float _52 = gl_FragCoord.w;
    float _54 = in.m_42.x;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_42.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = 1.0 / _52;
    float _68 = _66 * _58;
    float _70 = _66 * _64;
    float2 _300 = float2(_68, _70);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_300, float2(0.0), isnan(_300))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_300, float2(0.0), isnan(_300))).x;
    float2 _311 = float2(_68, _70);
    float4 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_311, float2(0.0), isnan(_311))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_311, float2(0.0), isnan(_311))).xyzw;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = _75.w;
    bool _87 = _72 >= 1.0;
    bool _89 = isnan(_72);
    bool _91 = _87 || _89;
    bool _93 = isnan(1.0);
    bool _95 = _91 || _93;
    float _97 = _77;
    float _99 = _79;
    float _101 = _81;
    if (!_95)
    {
        float _103 = _79 * 0.715200006961822509765625;
        float _105 = fma(_77, 0.2125999927520751953125, _103);
        bool _107 = (*spvDescriptorSet0.fp_c3)._m0[5].z > 0.999000012874603271484375;
        float _109 = fma(_81, 0.072200000286102294921875, _105);
        float _111 = 1.0 / _109;
        float _113 = _111 * (*spvDescriptorSet0.fp_c5)._m0[0].z;
        float _115 = precise::clamp(_113, 0.0, 1.0);
        float _117 = fma(_115, (*spvDescriptorSet0.fp_c5)._m0[0].y, (*spvDescriptorSet0.fp_c5)._m0[0].x);
        float _119 = _117 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _121 = fma(_77, _119, (*spvDescriptorSet0.fp_c4)._m0[0].w);
        float _123 = fma(_79, _119, (*spvDescriptorSet0.fp_c4)._m0[0].w);
        float _125 = fma(_81, _119, (*spvDescriptorSet0.fp_c4)._m0[0].w);
        bool _127 = !_107;
        float _129 = _109;
        float _141;
        float _143;
        float _145;
        if (!_127)
        {
            float3 _403 = float3(_121, _123, _125);
            float3 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_403, float3(0.0), isnan(_403))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_403, float3(0.0), isnan(_403))).xyz;
            float _135 = _133.x;
            float _137 = _133.y;
            float _139 = _133.z;
            _141 = _137;
            _143 = _135;
            _145 = _139;
            _147 = true;
        }
        else
        {
            bool _149 = (*spvDescriptorSet0.fp_c3)._m0[5].z >= 0.001000000047497451305389404296875;
            bool _151 = isnan((*spvDescriptorSet0.fp_c3)._m0[5].z);
            bool _153 = _149 || _151;
            bool _155 = isnan(0.001000000047497451305389404296875);
            bool _157 = _153 || _155;
            float3 _439 = float3(_121, _123, _125);
            float3 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_439, float3(0.0), isnan(_439))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_439, float3(0.0), isnan(_439))).xyz;
            float _161 = _159.x;
            float _163 = _159.y;
            float _165 = _159.z;
            float _167 = (*spvDescriptorSet0.fp_c3)._m0[5].z;
            float _169 = _119;
            float _171 = 0.0;
            float _173 = _161;
            float _175 = _163;
            _145 = _165;
            if (_157)
            {
                float3 _462 = float3(_121, _123, _125);
                float3 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_462, float3(0.0), isnan(_462))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_462, float3(0.0), isnan(_462))).xyz;
                float _179 = _177.x;
                float _181 = _177.y;
                float _183 = _177.z;
                _167 = _179;
                _169 = _181;
                _171 = _183;
            }
            float _185 = _167;
            float _187 = _169;
            float _189 = _171;
            float _191 = _185;
            float _193 = _187;
            if (_157)
            {
                float _195 = -_161;
                float _197 = _195 + _185;
                _129 = _197;
            }
            float _199 = _129;
            if (_157)
            {
                float _201 = -_163;
                float _203 = _201 + _187;
                _191 = _203;
            }
            float _205 = _191;
            if (_157)
            {
                float _207 = -_165;
                float _209 = _207 + _189;
                _193 = _209;
            }
            float _211 = _193;
            if (_157)
            {
                float _213 = fma(_199, (*spvDescriptorSet0.fp_c3)._m0[5].z, _161);
                _173 = _213;
            }
            float _215 = _173;
            _143 = _215;
            if (_157)
            {
                float _217 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[5].z, _163);
                _175 = _217;
            }
            float _219 = _175;
            _141 = _219;
            if (_157)
            {
                float _221 = fma(_211, (*spvDescriptorSet0.fp_c3)._m0[5].z, _165);
                _145 = _221;
            }
        }
        _147 = false;
        float _223 = _141;
        float _225 = _143;
        float _227 = _145;
        float _229 = _223 * 0.715200006961822509765625;
        float _231 = fma(_225, 0.2125999927520751953125, _229);
        float _233 = fma(_227, 0.072200000286102294921875, _231);
        float _235 = 1.0 / _233;
        float _237 = _235 * (*spvDescriptorSet0.fp_c5)._m0[1].z;
        float _239 = precise::clamp(_237, 0.0, 1.0);
        float _241 = fma(_239, (*spvDescriptorSet0.fp_c5)._m0[1].y, (*spvDescriptorSet0.fp_c5)._m0[1].x);
        float _243 = _241 * _225;
        float _245 = _241 * _223;
        float _247 = _241 * _227;
        _97 = _243;
        _99 = _245;
        _101 = _247;
    }
    float _249 = _97;
    float _251 = _99;
    float _253 = _101;
    float _255 = 0.0 + _249;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = 0.0 + _251;
    float _261 = precise::clamp(_259, 0.0, 1.0);
    float _263 = 0.0 + _253;
    float _265 = precise::clamp(_263, 0.0, 1.0);
    out.m_45.x = _257;
    out.m_45.y = _261;
    out.m_45.z = _265;
    out.m_45.w = _83;
    return out;
}

