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
    float _84 = 1.0 / _80;
    float _86 = float(uint(_64));
    float _88 = float(uint(_72));
    float _90 = _86 + 0.5;
    float _92 = 1.0 / _82;
    float _94 = _88 + 0.5;
    float _96 = _90 * _84;
    float _98 = _94 * _92;
    float2 _402 = float2(_96, _98);
    float _100 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_402, float2(0.0), isnan(_402)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_402, float2(0.0), isnan(_402)), level(0.0)).x;
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
    float3 _455 = float3(_96, _98, _124);
    float _126 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_455, float3(0.0), isnan(_455)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_455, float3(0.0), isnan(_455)), level(0.0)).w;
    float3 _466 = float3(_96, _98, float(0));
    float3 _468 = select(_466, float3(0.0), isnan(_466));
    float _128 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _468.xy, uint(rint(_468.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _468.xy, uint(rint(_468.z)), level(0.0)).y;
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
    float _158 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _160 = _146 * _158;
    float _162 = -_148;
    float _164 = fma(_162, (*spvDescriptorSet0.cp_c3)._m0[1].x, _152);
    float _166 = -_148;
    float _168 = fma(_166, (*spvDescriptorSet0.cp_c3)._m0[0].x, _156);
    float _170 = fma(_98, 2.0, -1.0);
    float _172 = -_148;
    float _174 = fma(_172, (*spvDescriptorSet0.cp_c3)._m0[2].x, _160);
    float _176 = fma(_112, (*spvDescriptorSet0.cp_c3)._m0[1].z, _164);
    float _178 = fma(_112, (*spvDescriptorSet0.cp_c3)._m0[0].z, _168);
    float _180 = -(*spvDescriptorSet0.cp_c3)._m0[10].y;
    float _182 = _170 + _180;
    float _184 = fma(_96, 2.0, -1.0);
    float _186 = _176 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _188 = _178 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _190 = fma(_112, (*spvDescriptorSet0.cp_c3)._m0[2].z, _174);
    float _192 = _182 * _182;
    float _194 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _196 = _186 + _194;
    float _198 = -(*spvDescriptorSet0.cp_c3)._m0[10].x;
    float _200 = _184 + _198;
    float _202 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _204 = _188 + _202;
    float _206 = _190 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _208 = _196 * _196;
    float _210 = fma(_200, _200, _192);
    float _212 = fma(_204, _204, _208);
    float _214 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _216 = _206 + _214;
    float _218 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _220 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _218;
    float _222 = abs(_188);
    float _224 = abs(_206);
    float _226 = precise::max(_222, _224);
    float _228 = sqrt(_210);
    float _230 = fma(_216, _216, _212);
    float _232 = fma(_226, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _234 = precise::clamp(_232, 0.0, 1.0);
    float _236 = sqrt(_230);
    float _238 = -_234;
    float _240 = _238 + 1.0;
    float _242 = 1.0 / _220;
    float _244 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _246 = _228 + _244;
    float _248 = _246 * 4.0;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _254 = _236 + _252;
    float _256 = _250 * 16.0;
    float _258 = trunc(_256);
    float _260 = precise::max(_258, 0.0);
    uint _263 = uint(_260);
    float _265 = _254 * _242;
    float _267 = precise::clamp(_265, 0.0, 1.0);
    float _269 = precise::min(_240, _267);
    float _271 = _269 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _273 = trunc(_271);
    float _275 = precise::max(_273, 0.0);
    uint _277 = uint(_275);
    float _279 = 0.0 + _126;
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = -_128;
    float _285 = _283 + 1.0;
    float _287 = -_281;
    float _289 = _287 + 1.0;
    float _291 = _285 * (*spvDescriptorSet0.cp_c3)._m0[7].z;
    float _293 = precise::min(_240, _289);
    float _295 = trunc(_291);
    float _297 = precise::max(_295, 0.0);
    uint _299 = uint(_297);
    float _301 = _293 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _303 = trunc(_301);
    float _305 = precise::max(_303, 0.0);
    uint _307 = uint(_305);
    uint _309 = max(_299, _263);
    uint _311 = max(_277, _307);
    uint _313 = max(_311, _309);
    uint _315 = min(_313, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_315), 0.0, 0.0, 0.0), uint2(int2(_64, _72)));
}

