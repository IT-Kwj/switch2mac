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
    texture3d<float> cp_t_tcb_A [[id(4)]];
    sampler cp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> cp_t_tcb_C [[id(6)]];
    sampler cp_t_tcb_CSmplr [[id(7)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(8)]];
    sampler cp_t_tcb_8Smplr_w [[id(9)]];
    sampler cp_t_tcb_ASmplr_w [[id(10)]];
    sampler cp_t_tcb_CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _53 = as_type<float>(gl_WorkGroupID.x);
    float _55 = as_type<float>(gl_LocalInvocationID.x);
    float _57 = as_type<float>(gl_WorkGroupID.y);
    float _59 = as_type<float>(gl_LocalInvocationID.y);
    int _62 = as_type<int>(_53) << 3;
    int _64 = _62 + as_type<int>(_55);
    bool _68 = uint(_64) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _70 = as_type<int>(_57) << 3;
    int _72 = _70 + as_type<int>(_59);
    bool _74 = uint(_72) < as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y);
    bool _76 = !_68;
    bool _78 = _74 && _76;
    if (!_78)
    {
        return;
    }
    float _80 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x));
    float _82 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y));
    float _84 = float(uint(_64));
    float _86 = 1.0 / _80;
    float _88 = float(uint(_72));
    float _90 = _84 + 0.5;
    float _92 = _88 + 0.5;
    float _94 = 1.0 / _82;
    float _96 = _90 * _86;
    float _98 = _92 * _94;
    float2 _428 = float2(_96, _98);
    float _100 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_428, float2(0.0), isnan(_428)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_428, float2(0.0), isnan(_428)), level(0.0)).x;
    float _102 = (-1.0) + (*spvDescriptorSet0.cp_c3)._m0[9].z;
    float _104 = -_100;
    float _106 = fma(_104, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _108 = 1.0 / _106;
    float _110 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _112 = _108 * _110;
    float _114 = _112 * (*spvDescriptorSet0.cp_c3)._m0[9].y;
    float _116 = -_114;
    float _118 = fma(_116, _102, 1.0);
    float _120 = log2(_118);
    float _122 = _120 * 0.693147182464599609375;
    float _124 = _122 * (*spvDescriptorSet0.cp_c3)._m0[9].w;
    float3 _481 = float3(_96, _98, _124);
    float _126 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_481, float3(0.0), isnan(_481)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_481, float3(0.0), isnan(_481)), level(0.0)).w;
    float3 _492 = float3(_96, _98, float(0));
    float3 _494 = select(_492, float3(0.0), isnan(_492));
    float _128 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _494.xy, uint(rint(_494.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _494.xy, uint(rint(_494.z)), level(0.0)).y;
    float _130 = -_98;
    float _132 = _130 + 1.0;
    float _134 = _132 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _136 = _96 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _138 = fma(_134, 2.0, -1.0);
    float _140 = fma(_136, 2.0, -1.0);
    float _142 = _138 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _144 = _140 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _146 = _112 * _142;
    float _148 = _112 * _144;
    float _150 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _152 = _146 * _150;
    float _154 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _156 = _146 * _154;
    float _158 = -_148;
    float _160 = fma(_158, (*spvDescriptorSet0.cp_c3)._m0[1].x, _152);
    float _162 = -_148;
    float _164 = fma(_162, (*spvDescriptorSet0.cp_c3)._m0[0].x, _156);
    float _166 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _168 = _146 * _166;
    float _170 = fma(_96, 2.0, -1.0);
    float _172 = fma(_112, (*spvDescriptorSet0.cp_c3)._m0[1].z, _160);
    float _174 = fma(_112, (*spvDescriptorSet0.cp_c3)._m0[0].z, _164);
    float _176 = -_148;
    float _178 = fma(_176, (*spvDescriptorSet0.cp_c3)._m0[2].x, _168);
    float _180 = -(*spvDescriptorSet0.cp_c3)._m0[10].x;
    float _182 = _170 + _180;
    float _184 = _172 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _186 = _174 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _188 = fma(_112, (*spvDescriptorSet0.cp_c3)._m0[2].z, _178);
    float _190 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _192 = _184 + _190;
    float _194 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _196 = _186 + _194;
    float _198 = _188 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _200 = _192 * _192;
    float _202 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _204 = _198 + _202;
    float _206 = abs(_186);
    float _208 = abs(_198);
    float _210 = precise::max(_206, _208);
    float _212 = fma(_196, _196, _200);
    float _214 = fma(_98, 2.0, -1.0);
    float _216 = fma(_204, _204, _212);
    float _218 = -(*spvDescriptorSet0.cp_c3)._m0[10].y;
    float _220 = _214 + _218;
    float _222 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _224 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _222;
    float _226 = fma(_210, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = sqrt(_216);
    float _232 = _220 * _220;
    float _234 = -_228;
    float _236 = _234 + 1.0;
    float _238 = fma(_182, _182, _232);
    float _240 = 1.0 / _224;
    float _242 = -(*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _244 = fma(_230, (*spvDescriptorSet0.cp_c3)._m0[8].y, _242);
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = sqrt(_238);
    float _250 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _252 = _230 + _250;
    float _254 = -_246;
    float _256 = _254 + 1.0;
    float _258 = _252 * _240;
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = abs(_256);
    float _264 = log2(_262);
    float _266 = precise::min(_236, _260);
    float _268 = _266 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _270 = trunc(_268);
    float _272 = precise::max(_270, 0.0);
    uint _275 = uint(_272);
    float _277 = _264 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
    float _279 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _281 = _248 + _279;
    float _283 = _281 * 4.0;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = exp2(_277);
    float _289 = _285 * 16.0;
    float _291 = trunc(_289);
    float _293 = precise::max(_291, 0.0);
    uint _295 = uint(_293);
    float _297 = -_287;
    float _299 = _297 + 1.0;
    float _301 = -_299;
    float _303 = fma(_301, (*spvDescriptorSet0.cp_c3)._m0[8].w, 1.0);
    float _305 = _303 * _126;
    float _307 = precise::clamp(_305, 0.0, 1.0);
    float _309 = -_128;
    float _311 = _309 + 1.0;
    float _313 = -_307;
    float _315 = _313 + 1.0;
    float _317 = _311 * (*spvDescriptorSet0.cp_c3)._m0[7].z;
    float _319 = precise::min(_236, _315);
    float _321 = trunc(_317);
    float _323 = precise::max(_321, 0.0);
    uint _325 = uint(_323);
    float _327 = _319 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _329 = trunc(_327);
    float _331 = precise::max(_329, 0.0);
    uint _333 = uint(_331);
    uint _335 = max(_325, _295);
    uint _337 = max(_275, _333);
    uint _339 = max(_337, _335);
    uint _341 = min(_339, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_341), 0.0, 0.0, 0.0), uint2(int2(_64, _72)));
}

