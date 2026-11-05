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
    constant _16* cp_c4 [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    texture2d<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(4)]];
    sampler cp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _43 = as_type<float>(gl_WorkGroupID.x);
    float _45 = as_type<float>(gl_LocalInvocationID.x);
    float _47 = as_type<float>(gl_WorkGroupID.y);
    float _49 = as_type<float>(gl_LocalInvocationID.y);
    int _52 = as_type<int>(_43) << 3;
    int _54 = _52 + as_type<int>(_45);
    bool _58 = uint(_54) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _60 = as_type<int>(_47) << 3;
    int _62 = _60 + as_type<int>(_49);
    bool _64 = uint(_62) < as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y);
    bool _66 = !_58;
    bool _68 = _64 && _66;
    if (!_68)
    {
        return;
    }
    float _70 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x));
    float _72 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y));
    float _74 = 1.0 / _70;
    float _76 = float(uint(_54));
    float _78 = float(uint(_62));
    float _80 = _76 + 0.5;
    float _82 = 1.0 / _72;
    float _84 = _78 + 0.5;
    float _86 = _80 * _74;
    float _88 = _84 * _82;
    float2 _384 = float2(_86, _88);
    float _90 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_384, float2(0.0), isnan(_384)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_384, float2(0.0), isnan(_384)), level(0.0)).x;
    float _92 = -_88;
    float _94 = _92 + 1.0;
    float _96 = _94 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _98 = _86 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _100 = fma(_96, 2.0, -1.0);
    float _102 = fma(_98, 2.0, -1.0);
    float _104 = _100 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _106 = _102 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _108 = fma(_88, 2.0, -1.0);
    float _110 = fma(_86, 2.0, -1.0);
    float _112 = -(*spvDescriptorSet0.cp_c3)._m0[10].y;
    float _114 = _108 + _112;
    float _116 = -(*spvDescriptorSet0.cp_c3)._m0[10].x;
    float _118 = _110 + _116;
    float _120 = _114 * _114;
    float _122 = fma(_118, _118, _120);
    float _124 = sqrt(_122);
    float _126 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _128 = _124 + _126;
    float _130 = _128 * 4.0;
    float _132 = precise::clamp(_130, 0.0, 1.0);
    float _134 = _132 * 16.0;
    float _136 = trunc(_134);
    float _138 = precise::max(_136, 0.0);
    uint _141 = uint(_138);
    float _143 = -_90;
    float _145 = fma(_143, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _147 = 1.0 / _145;
    float _149 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _151 = _147 * _149;
    float _153 = _151 * _104;
    float _155 = _151 * _106;
    float _157 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _159 = _153 * _157;
    float _161 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _163 = _153 * _161;
    float _165 = -_155;
    float _167 = fma(_165, (*spvDescriptorSet0.cp_c3)._m0[1].x, _159);
    float _169 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _171 = _153 * _169;
    float _173 = -_155;
    float _175 = fma(_173, (*spvDescriptorSet0.cp_c3)._m0[0].x, _163);
    float _177 = fma(_151, (*spvDescriptorSet0.cp_c3)._m0[1].z, _167);
    float _179 = -_155;
    float _181 = fma(_179, (*spvDescriptorSet0.cp_c3)._m0[2].x, _171);
    float _183 = fma(_151, (*spvDescriptorSet0.cp_c3)._m0[0].z, _175);
    float _185 = _177 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _187 = fma(_151, (*spvDescriptorSet0.cp_c3)._m0[2].z, _181);
    float _189 = _183 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _191 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _193 = _185 + _191;
    float _195 = _187 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _197 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _199 = _189 + _197;
    float _201 = _193 * _193;
    float _203 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _205 = _195 + _203;
    float _207 = abs(_189);
    float _209 = abs(_195);
    float _211 = precise::max(_207, _209);
    float _213 = fma(_199, _199, _201);
    float _215 = fma(_205, _205, _213);
    float _217 = fma(_211, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = sqrt(_215);
    float _223 = -_219;
    float _225 = _223 + 1.0;
    float _227 = -(*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _229 = fma(_221, (*spvDescriptorSet0.cp_c3)._m0[8].y, _227);
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _235 = _221 + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    float _241 = abs(_239);
    float _243 = log2(_241);
    float _245 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _247 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _245;
    float _249 = 1.0 / _247;
    float _251 = _243 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
    float _253 = exp2(_251);
    float _255 = _235 * _249;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = precise::min(_225, _257);
    float _261 = _259 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _263 = -_253;
    float _265 = _263 + 1.0;
    float _267 = trunc(_261);
    float _269 = precise::max(_267, 0.0);
    uint _271 = uint(_269);
    float _273 = -_265;
    float _275 = fma(_273, (*spvDescriptorSet0.cp_c3)._m0[8].w, 1.0);
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = -_277;
    float _281 = _279 + 1.0;
    float _283 = precise::min(_225, _281);
    float _285 = _283 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _287 = trunc(_285);
    float _289 = precise::max(_287, 0.0);
    uint _291 = uint(_289);
    uint _293 = max(_271, _291);
    uint _295 = max(_141, _293);
    uint _297 = min(_295, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_297), 0.0, 0.0, 0.0), uint2(int2(_54, _62)));
}

