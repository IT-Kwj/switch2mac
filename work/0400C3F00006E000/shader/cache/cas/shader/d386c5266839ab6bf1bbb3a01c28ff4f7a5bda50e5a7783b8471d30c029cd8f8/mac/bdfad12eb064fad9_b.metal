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
    texture2d<float> cp_t_tcb_A [[id(4)]];
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
    float _50 = as_type<float>(gl_WorkGroupID.x);
    float _52 = as_type<float>(gl_LocalInvocationID.x);
    float _54 = as_type<float>(gl_WorkGroupID.y);
    float _56 = as_type<float>(gl_LocalInvocationID.y);
    int _59 = as_type<int>(_50) << 3;
    int _61 = _59 + as_type<int>(_52);
    bool _65 = uint(_61) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _67 = as_type<int>(_54) << 3;
    int _69 = _67 + as_type<int>(_56);
    bool _71 = uint(_69) < as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y);
    bool _73 = !_65;
    bool _75 = _71 && _73;
    if (!_75)
    {
        return;
    }
    float _77 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y));
    float _79 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x));
    float _81 = float(uint(_69));
    float _83 = 1.0 / _77;
    float _85 = float(uint(_61));
    float _87 = _81 + 0.5;
    float _89 = _85 + 0.5;
    float _91 = 1.0 / _79;
    float _93 = _87 * _83;
    float _95 = _89 * _91;
    float2 _411 = float2(_95, _93);
    float _97 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_411, float2(0.0), isnan(_411)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_411, float2(0.0), isnan(_411)), level(0.0)).x;
    float2 _422 = float2(_95, _93);
    float _99 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_422, float2(0.0), isnan(_422)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_422, float2(0.0), isnan(_422)), level(0.0)).w;
    float3 _432 = float3(_95, _93, float(0));
    float3 _436 = select(_432, float3(0.0), isnan(_432));
    float _101 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, _436.xy, uint(rint(_436.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, _436.xy, uint(rint(_436.z)), level(0.0)).y;
    float _103 = -_93;
    float _105 = _103 + 1.0;
    float _107 = _105 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _109 = _95 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _111 = fma(_107, 2.0, -1.0);
    float _113 = fma(_109, 2.0, -1.0);
    float _115 = _111 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _117 = _113 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _119 = fma(_93, 2.0, -1.0);
    float _121 = fma(_95, 2.0, -1.0);
    float _123 = -(*spvDescriptorSet0.cp_c3)._m0[10].y;
    float _125 = _119 + _123;
    float _127 = -(*spvDescriptorSet0.cp_c3)._m0[10].x;
    float _129 = _121 + _127;
    float _131 = _125 * _125;
    float _133 = -_97;
    float _135 = fma(_133, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _137 = -_101;
    float _139 = _137 + 1.0;
    float _141 = 1.0 / _135;
    float _143 = _139 * (*spvDescriptorSet0.cp_c3)._m0[7].z;
    float _145 = trunc(_143);
    float _147 = precise::max(_145, 0.0);
    uint _150 = uint(_147);
    float _152 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _154 = _141 * _152;
    float _156 = _154 * _115;
    float _158 = _154 * _117;
    float _160 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _162 = _156 * _160;
    float _164 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _166 = _156 * _164;
    float _168 = -_158;
    float _170 = fma(_168, (*spvDescriptorSet0.cp_c3)._m0[1].x, _162);
    float _172 = -_158;
    float _174 = fma(_172, (*spvDescriptorSet0.cp_c3)._m0[0].x, _166);
    float _176 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _178 = _156 * _176;
    float _180 = fma(_154, (*spvDescriptorSet0.cp_c3)._m0[1].z, _170);
    float _182 = fma(_154, (*spvDescriptorSet0.cp_c3)._m0[0].z, _174);
    float _184 = -_158;
    float _186 = fma(_184, (*spvDescriptorSet0.cp_c3)._m0[2].x, _178);
    float _188 = _180 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _190 = _182 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _192 = fma(_154, (*spvDescriptorSet0.cp_c3)._m0[2].z, _186);
    float _194 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _196 = _188 + _194;
    float _198 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _200 = _190 + _198;
    float _202 = _192 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _204 = fma(_129, _129, _131);
    float _206 = _196 * _196;
    float _208 = fma(_200, _200, _206);
    float _210 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _212 = _202 + _210;
    float _214 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _216 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _214;
    float _218 = sqrt(_204);
    float _220 = abs(_190);
    float _222 = abs(_202);
    float _224 = precise::max(_220, _222);
    float _226 = fma(_212, _212, _208);
    float _228 = fma(_224, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = sqrt(_226);
    float _234 = -_230;
    float _236 = _234 + 1.0;
    float _238 = 1.0 / _216;
    float _240 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _242 = _218 + _240;
    float _244 = _242 * 4.0;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = -(*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _250 = fma(_232, (*spvDescriptorSet0.cp_c3)._m0[8].y, _248);
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _256 = _232 + _254;
    float _258 = _246 * 16.0;
    float _260 = -_252;
    float _262 = _260 + 1.0;
    float _264 = _256 * _238;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = trunc(_258);
    float _270 = precise::max(_268, 0.0);
    uint _272 = uint(_270);
    float _274 = precise::min(_236, _266);
    float _276 = abs(_262);
    float _278 = log2(_276);
    float _280 = _274 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _282 = trunc(_280);
    float _284 = precise::max(_282, 0.0);
    uint _286 = uint(_284);
    float _288 = _278 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
    float _290 = exp2(_288);
    float _292 = -_290;
    float _294 = _292 + 1.0;
    uint _296 = max(_150, _272);
    float _298 = -_294;
    float _300 = fma(_298, (*spvDescriptorSet0.cp_c3)._m0[8].w, 1.0);
    float _302 = _300 * _99;
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = -_304;
    float _308 = _306 + 1.0;
    float _310 = precise::min(_236, _308);
    float _312 = _310 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _314 = trunc(_312);
    float _316 = precise::max(_314, 0.0);
    uint _318 = uint(_316);
    uint _320 = max(_286, _318);
    uint _322 = max(_320, _296);
    uint _324 = min(_322, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_324), 0.0, 0.0, 0.0), uint2(int2(_61, _69)));
}

