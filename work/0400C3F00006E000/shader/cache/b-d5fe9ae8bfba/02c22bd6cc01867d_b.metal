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
    texture2d_array<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(4)]];
    sampler cp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _43 = as_type<float>(gl_WorkGroupID.x);
    float _45 = as_type<float>(gl_LocalInvocationID.x);
    int _48 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[16].z) << 4;
    float _50 = as_type<float>(gl_WorkGroupID.y);
    float _52 = as_type<float>(gl_LocalInvocationID.y);
    uint _55 = uint(int(uint(_48) >> uint(2)));
    uint _57 = uint(int(uint(int(_55)) >> uint(2)));
    int _59 = int(_55) & 3;
    float _61 = (*spvDescriptorSet0.cp_c4)._m0[int(_57)][_59];
    int _63 = as_type<int>(_43) << 3;
    int _65 = _63 + as_type<int>(_45);
    float _67 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _69 = fma(_67, 0.5, (*spvDescriptorSet0.cp_c3)._m0[0].x);
    float _71 = float(uint(_65));
    int _73 = as_type<int>(_50) << 3;
    int _75 = _73 + as_type<int>(_52);
    float _77 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _79 = fma(_77, 0.5, (*spvDescriptorSet0.cp_c3)._m0[0].y);
    float _81 = fma(_71, (*spvDescriptorSet0.cp_c3)._m0[1].z, _69);
    float _83 = float(uint(_75));
    float _85 = -(*spvDescriptorSet0.cp_c4)._m0[16].x;
    float _87 = _81 + _85;
    float _89 = fma(_83, (*spvDescriptorSet0.cp_c3)._m0[1].z, _79);
    float _91 = -(*spvDescriptorSet0.cp_c4)._m0[16].y;
    float _93 = _89 + _91;
    float _95 = abs(_87);
    float _97 = abs(_93);
    float _99 = precise::max(_95, _97);
    float _101 = _99 * _61;
    float _103 = _101 * 4.0;
    float _105 = precise::max(_103, 1.0);
    float _107 = log2(_105);
    float _109 = precise::min(_107, 5.0);
    float _111 = floor(_109);
    int _113 = int(_111);
    int _115 = _113 + as_type<int>((*spvDescriptorSet0.cp_c4)._m0[16].z);
    int _117 = _115 << 4;
    float _119 = floor(_109);
    uint _121 = uint(int(uint(_117) >> uint(2)));
    uint _123 = uint(int(uint(int(_121)) >> uint(2)));
    int _125 = int(_121) & 3;
    float _127 = (*spvDescriptorSet0.cp_c4)._m0[int(_123)][_125];
    float _129 = rint(_119);
    float _131 = precise::max(_129, 0.0);
    uint _133 = uint(_131);
    uint _135 = clamp(_133, 0u, 65535u);
    float _137 = fma(_87, _127, 0.5);
    float _139 = fma(_93, _127, 0.5);
    float3 _536 = float3(_137, _139, float(int(_135)));
    float3 _541 = select(_536, float3(0.0), isnan(_536));
    float2 _143 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _541.xy, uint(rint(_541.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _541.xy, uint(rint(_541.z)), level(0.0)).xz;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = -_145;
    float _151 = _81 + _149;
    float _153 = -_147;
    float _155 = _89 + _153;
    float _157 = -(*spvDescriptorSet0.cp_c4)._m0[16].x;
    float _159 = _151 + _157;
    float _161 = -(*spvDescriptorSet0.cp_c4)._m0[16].y;
    float _163 = _155 + _161;
    float _165 = abs(_159);
    float _167 = abs(_163);
    float _169 = precise::max(_165, _167);
    float _171 = _169 * _61;
    float _173 = _171 * 4.0;
    float _175 = precise::max(_173, 1.0);
    float _177 = log2(_175);
    float _179 = precise::min(_177, 5.0);
    float _181 = floor(_179);
    int _183 = int(_181);
    float _185 = floor(_179);
    int _187 = _183 + as_type<int>((*spvDescriptorSet0.cp_c4)._m0[16].z);
    int _189 = _187 << 4;
    float _191 = rint(_185);
    float _193 = precise::max(_191, 0.0);
    uint _195 = uint(_193);
    uint _197 = clamp(_195, 0u, 65535u);
    uint _199 = uint(int(uint(_189) >> uint(2)));
    uint _201 = uint(int(uint(int(_199)) >> uint(2)));
    int _203 = int(_199) & 3;
    float _205 = (*spvDescriptorSet0.cp_c4)._m0[int(_201)][_203];
    float _207 = fma(_159, _205, 0.5);
    float _209 = fma(_163, _205, 0.5);
    float3 _636 = float3(_207, _209, float(int(_197)));
    float3 _638 = select(_636, float3(0.0), isnan(_636));
    float2 _211 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _638.xy, uint(rint(_638.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _638.xy, uint(rint(_638.z)), level(0.0)).xz;
    float _213 = _211.x;
    float _215 = _211.y;
    float _217 = _151 + _213;
    float _219 = _155 + _215;
    float _221 = -_217;
    float _223 = _81 + _221;
    float _225 = -_219;
    float _227 = _89 + _225;
    float _229 = _151 + _223;
    float _231 = _155 + _227;
    float _233 = -(*spvDescriptorSet0.cp_c4)._m0[16].x;
    float _235 = _229 + _233;
    float _237 = -(*spvDescriptorSet0.cp_c4)._m0[16].y;
    float _239 = _231 + _237;
    float _241 = abs(_235);
    float _243 = abs(_239);
    float _245 = precise::max(_241, _243);
    float _247 = _245 * _61;
    float _249 = _247 * 4.0;
    float _251 = precise::max(_249, 1.0);
    float _253 = log2(_251);
    float _255 = precise::min(_253, 5.0);
    float _257 = floor(_255);
    int _259 = int(_257);
    float _261 = floor(_255);
    int _263 = _259 + as_type<int>((*spvDescriptorSet0.cp_c4)._m0[16].z);
    int _265 = _263 << 4;
    float _267 = rint(_261);
    float _269 = precise::max(_267, 0.0);
    uint _271 = uint(_269);
    uint _273 = clamp(_271, 0u, 65535u);
    uint _275 = uint(int(uint(_265) >> uint(2)));
    uint _277 = uint(int(uint(int(_275)) >> uint(2)));
    int _279 = int(_275) & 3;
    float _281 = (*spvDescriptorSet0.cp_c4)._m0[int(_277)][_279];
    float _283 = fma(_235, _281, 0.5);
    float _285 = fma(_239, _281, 0.5);
    float3 _745 = float3(_283, _285, float(int(_273)));
    float3 _747 = select(_745, float3(0.0), isnan(_745));
    float2 _287 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _747.xy, uint(rint(_747.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _747.xy, uint(rint(_747.z)), level(0.0)).xz;
    float _289 = _287.x;
    float _291 = _287.y;
    float _293 = _229 + _289;
    float _295 = _231 + _291;
    float _297 = -_293;
    float _299 = _81 + _297;
    float _301 = -_295;
    float _303 = _89 + _301;
    float _305 = _229 + _299;
    float _307 = _231 + _303;
    float _309 = -(*spvDescriptorSet0.cp_c4)._m0[16].x;
    float _311 = _305 + _309;
    float _313 = -(*spvDescriptorSet0.cp_c4)._m0[16].y;
    float _315 = _307 + _313;
    float _317 = abs(_311);
    float _319 = abs(_315);
    float _321 = precise::max(_317, _319);
    float _323 = _321 * _61;
    float _325 = _323 * 4.0;
    float _327 = precise::max(_325, 1.0);
    float _329 = log2(_327);
    float _331 = precise::min(_329, 5.0);
    float _333 = floor(_331);
    int _335 = int(_333);
    int _337 = _335 + as_type<int>((*spvDescriptorSet0.cp_c4)._m0[16].z);
    int _339 = _337 << 4;
    float _341 = floor(_331);
    uint _343 = uint(int(uint(_339) >> uint(2)));
    uint _345 = uint(int(uint(int(_343)) >> uint(2)));
    int _347 = int(_343) & 3;
    float _349 = (*spvDescriptorSet0.cp_c4)._m0[int(_345)][_347];
    float _351 = rint(_341);
    float _353 = precise::max(_351, 0.0);
    uint _355 = uint(_353);
    uint _357 = clamp(_355, 0u, 65535u);
    float _359 = fma(_315, _349, 0.5);
    float _361 = fma(_311, _349, 0.5);
    float3 _854 = float3(_361, _359, float(int(_357)));
    float3 _856 = select(_854, float3(0.0), isnan(_854));
    float _363 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, _856.xy, uint(rint(_856.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, _856.xy, uint(rint(_856.z)), level(0.0)).y;
    float _365 = _363 * (*spvDescriptorSet0.cp_c3)._m0[1].w;
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_365, 0.0, 0.0, 0.0), uint2(int2(_65, _75)));
}

