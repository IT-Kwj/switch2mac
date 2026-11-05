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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c3 [[id(0)]];
    device _23* cp_s0 [[id(1)]];
    texturecube<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    sampler cp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    float _38 = 0.0;
    float _40 = 0.0;
    float _42 = 0.0;
    float _44 = 0.0;
    float _46 = 0.0;
    bool _50;
    bool _84;
    float _170;
    float _172;
    float _174;
    float _176;
    do
    {
        float _52 = _38;
        float _54 = _40;
        float _56 = _42;
        float _58 = _44;
        float _60 = _46;
        float _62 = _52 * 0.15915493667125701904296875;
        float _64 = _62 * 6.283185482025146484375;
        float _66 = cos(_64);
        float _68 = _62 * 6.283185482025146484375;
        float _70 = sin(_68);
        float _72 = _66 * _66;
        float _74 = -3.1415927410125732421875;
        float _76 = _54;
        float _78 = _56;
        float _80 = _58;
        float _82 = _60;
        do
        {
            float _86 = _74;
            float _88 = _76;
            float _90 = _78;
            float _92 = _80;
            float _94 = _82;
            float _96 = _86 * 0.15915493667125701904296875;
            float _98 = _96 * 6.283185482025146484375;
            float _100 = cos(_98);
            float _102 = _96 * 6.283185482025146484375;
            float _104 = sin(_102);
            float _106 = _70 * _100;
            float _108 = fma(_106, _106, _72);
            float _110 = _70 * _104;
            float _112 = fma(_110, _110, _108);
            float _114 = rsqrt(_112);
            float _116 = _106 * _114;
            float _118 = _66 * _114;
            float _120 = _110 * _114;
            float _122 = abs(_116);
            float _124 = abs(_118);
            float _126 = precise::max(_122, _124);
            float _128 = abs(_120);
            float _130 = precise::max(_128, _126);
            float _132 = 1.0 / _130;
            float _134 = _116 * _132;
            float _136 = _118 * _132;
            float _138 = -_132;
            float _140 = _120 * _138;
            float3 _299 = float3(_134, _136, _140);
            float _142 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_299, float3(0.0), isnan(_299)), level((*spvDescriptorSet0.cp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_299, float3(0.0), isnan(_299)), level((*spvDescriptorSet0.cp_c3)._m0[1].x)).x;
            float _144 = _86 + (*spvDescriptorSet0.cp_c3)._m0[0].y;
            bool _146 = _144 >= 3.1415927410125732421875;
            bool _148 = isnan(_144);
            bool _150 = _146 || _148;
            bool _152 = isnan(3.1415927410125732421875);
            bool _154 = _150 || _152;
            float _156 = -_142;
            float _158 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
            float _160 = fma(_156, (*spvDescriptorSet0.cp_c3)._m0[5].y, _158);
            float _162 = abs(_160);
            bool _164 = _162 >= (*spvDescriptorSet0.cp_c3)._m0[6].x;
            float _166 = float(_164);
            float _168 = _166 * 0.48860299587249755859375;
            _170 = fma(_166, 0.2820949852466583251953125, _88);
            _172 = fma(_118, _168, _90);
            _174 = fma(_120, _168, _92);
            _176 = fma(_116, _168, _94);
            _84 = !_154;
            _40 = _170;
            _42 = _172;
            _44 = _174;
            _46 = _176;
            _74 = _144;
            _76 = _170;
            _78 = _172;
            _80 = _174;
            _82 = _176;
        } while (_84);
        float _178 = _52 + (*spvDescriptorSet0.cp_c3)._m0[0].x;
        bool _180 = _178 > 3.1415927410125732421875;
        bool _182 = isnan(_178);
        bool _184 = _180 || _182;
        bool _186 = isnan(3.1415927410125732421875);
        bool _188 = _184 || _186;
        _50 = !_188;
        _38 = _178;
    } while (_50);
    float _190 = _170 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _192 = _172 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _194 = _174 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _196 = _176 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    (*spvDescriptorSet0.cp_s0)._m0[0] = as_type<uint>(_190);
    (*spvDescriptorSet0.cp_s0)._m0[1] = as_type<uint>(_192);
    (*spvDescriptorSet0.cp_s0)._m0[2] = as_type<uint>(_194);
    (*spvDescriptorSet0.cp_s0)._m0[3] = as_type<uint>(_196);
}

