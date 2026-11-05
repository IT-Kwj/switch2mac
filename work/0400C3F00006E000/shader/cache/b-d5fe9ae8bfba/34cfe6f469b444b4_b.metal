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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture3d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture3d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _127 = false;
    float _50 = gl_FragCoord.w;
    float _52 = in.m_40.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_40.y;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = 1.0 / _50;
    float _66 = _64 * _56;
    float _68 = _64 * _62;
    float2 _268 = float2(_66, _68);
    float4 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_268, float2(0.0), isnan(_268))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_268, float2(0.0), isnan(_268))).xyzw;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float _79 = _71.w;
    bool _83 = (*spvDescriptorSet0.fp_c3)._m0[5].z > 0.999000012874603271484375;
    float _85 = _75 * 0.715200006961822509765625;
    float _87 = fma(_73, 0.2125999927520751953125, _85);
    float _89 = fma(_77, 0.072200000286102294921875, _87);
    float _91 = 1.0 / _89;
    float _93 = _91 * (*spvDescriptorSet0.fp_c5)._m0[0].z;
    float _95 = precise::clamp(_93, 0.0, 1.0);
    float _97 = fma(_95, (*spvDescriptorSet0.fp_c5)._m0[0].y, (*spvDescriptorSet0.fp_c5)._m0[0].x);
    float _99 = _97 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _101 = fma(_73, _99, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _103 = fma(_75, _99, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _105 = fma(_77, _99, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    bool _107 = !_83;
    float _109 = _89;
    float _121;
    float _123;
    float _125;
    if (!_107)
    {
        float3 _346 = float3(_101, _103, _105);
        float3 _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_346, float3(0.0), isnan(_346))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_346, float3(0.0), isnan(_346))).xyz;
        float _115 = _113.x;
        float _117 = _113.y;
        float _119 = _113.z;
        _121 = _117;
        _123 = _115;
        _125 = _119;
        _127 = true;
    }
    else
    {
        bool _129 = (*spvDescriptorSet0.fp_c3)._m0[5].z >= 0.001000000047497451305389404296875;
        bool _131 = isnan((*spvDescriptorSet0.fp_c3)._m0[5].z);
        bool _133 = _129 || _131;
        bool _135 = isnan(0.001000000047497451305389404296875);
        bool _137 = _133 || _135;
        float3 _382 = float3(_101, _103, _105);
        float3 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_382, float3(0.0), isnan(_382))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_382, float3(0.0), isnan(_382))).xyz;
        float _141 = _139.x;
        float _143 = _139.y;
        float _145 = _139.z;
        float _147 = (*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _149 = _99;
        float _151 = 0.0;
        float _153 = _141;
        float _155 = _143;
        _125 = _145;
        if (_137)
        {
            float3 _405 = float3(_101, _103, _105);
            float3 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_405, float3(0.0), isnan(_405))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_405, float3(0.0), isnan(_405))).xyz;
            float _159 = _157.x;
            float _161 = _157.y;
            float _163 = _157.z;
            _147 = _159;
            _149 = _161;
            _151 = _163;
        }
        float _165 = _147;
        float _167 = _149;
        float _169 = _151;
        float _171 = _165;
        float _173 = _167;
        if (_137)
        {
            float _175 = -_141;
            float _177 = _175 + _165;
            _109 = _177;
        }
        float _179 = _109;
        if (_137)
        {
            float _181 = -_143;
            float _183 = _181 + _167;
            _171 = _183;
        }
        float _185 = _171;
        if (_137)
        {
            float _187 = -_145;
            float _189 = _187 + _169;
            _173 = _189;
        }
        float _191 = _173;
        if (_137)
        {
            float _193 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[5].z, _141);
            _153 = _193;
        }
        float _195 = _153;
        _123 = _195;
        if (_137)
        {
            float _197 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[5].z, _143);
            _155 = _197;
        }
        float _199 = _155;
        _121 = _199;
        if (_137)
        {
            float _201 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[5].z, _145);
            _125 = _201;
        }
    }
    _127 = false;
    float _203 = _121;
    float _205 = _123;
    float _207 = _125;
    float _209 = _203 * 0.715200006961822509765625;
    float _211 = fma(_205, 0.2125999927520751953125, _209);
    float _213 = fma(_207, 0.072200000286102294921875, _211);
    float _215 = 1.0 / _213;
    float _217 = _215 * (*spvDescriptorSet0.fp_c5)._m0[1].z;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = fma(_219, (*spvDescriptorSet0.fp_c5)._m0[1].y, (*spvDescriptorSet0.fp_c5)._m0[1].x);
    float _223 = _221 * _205;
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = _221 * _203;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = _221 * _207;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    out.m_43.x = _225;
    out.m_43.y = _229;
    out.m_43.z = _233;
    out.m_43.w = _79;
    return out;
}

